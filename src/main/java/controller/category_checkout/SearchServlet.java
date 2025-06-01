package controller.category_checkout;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Product;
import service.DatabaseConnection;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.Normalizer;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.commons.text.similarity.LevenshteinDistance;

import controller.product.ProductCache;
@WebServlet("/search")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    private String normalize(String input) {
        String temp = Normalizer.normalize(input, Normalizer.Form.NFD);
        temp = temp.replaceAll("\\p{M}", "");
        return temp.toLowerCase().replaceAll("\\s+", "");
    }

    private boolean isApproxMatch(String input, String dbValue, int threshold) {
        if (dbValue.contains(input)) {
            return true;
        }
        LevenshteinDistance distance = new LevenshteinDistance();
        return distance.apply(input, dbValue) <= threshold;
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		String rawKeyword = request.getParameter("query");
		Set<Integer> matchedIds = new HashSet<>();
		List<Product> matchedProducts = searchProductsByKeyword(rawKeyword, matchedIds);

		// Phan trang
		int totalProducts = matchedProducts.size();
		int currentPage = 1;
		try {
		    currentPage = Integer.parseInt(request.getParameter("page"));
		} catch (NumberFormatException e) {}

		int productsPerPage = 8;
		int offset = (currentPage - 1) * productsPerPage;
		int totalPages = (int) Math.ceil((double) totalProducts / productsPerPage);

		List<Product> paginatedProducts = matchedProducts.stream().skip(offset).limit(productsPerPage).toList();

		request.setAttribute("currentPage", currentPage);
		request.setAttribute("totalPages", totalPages);
		request.setAttribute("query", rawKeyword);
		request.setAttribute("products", paginatedProducts);
		request.setAttribute("prtotal", totalProducts);

		request.getRequestDispatcher("webPage/categoryAndSingle/search.jsp").forward(request, response);
     
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	private List<Product> searchProductsByKeyword(String rawKeyword, Set<Integer> matchedIds) {
	    String normalizedKeyword = normalize(rawKeyword);
	    List<Product> matchedProducts = new ArrayList<>();

	    // 1. Tu cache
	    for (Product p : ProductCache.getCachedProducts()) {
	        if (isApproxMatch(normalizedKeyword, p.getUnsignedTitle(), 3)) {
	            if (matchedIds.add(p.getProductId())) {
	                matchedProducts.add(p);
	            }
	        }
	    }

	    // 2. Tu DB
	    try (Connection conn = DatabaseConnection.getConnection();
	         PreparedStatement stmt = conn.prepareStatement("SELECT product_id, img_id, title, price, product_name_unsigned FROM PRODUCT_1");
	         ResultSet rs = stmt.executeQuery()) {

	        while (rs.next()) {
	            String dbNormalized = rs.getString("product_name_unsigned");
	            if (isApproxMatch(normalizedKeyword, dbNormalized, 3)) {
	                int productId = rs.getInt("product_id");
	                if (matchedIds.add(productId)) {
	                    Product product = new Product();
	                    product.setProductId(productId);
	                    product.setImgId(Integer.parseInt(rs.getString("img_id")));
	                    product.setTitle(rs.getString("title"));
	                    product.setPrice(rs.getDouble("price"));
	                    matchedProducts.add(product);
	                }
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return matchedProducts;
	}


}
