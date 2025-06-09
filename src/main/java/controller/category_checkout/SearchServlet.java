package controller.category_checkout;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.Log;
import models.Product;
import models.User;
import service.DatabaseConnection;
import service.ILogService;
import service.LogServiceImpl;
import service.LoginService;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.Normalizer;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.commons.text.similarity.LevenshteinDistance;

import controller.product.ProductCache;
@WebServlet("/search")
public class SearchServlet extends HttpServlet {
	ILogService logService = new LogServiceImpl();
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
        temp = temp.replaceAll("\\p{M}", ""); //xoa dau tieng viet
        return temp.toLowerCase().replaceAll("\\s+", ""); //loai bo khoang trang
    }

    private boolean isApproxMatch(String input, String dbValue, int threshold) {
        if (dbValue.contains(input)) {
            return true;
        }
        //do phuc tap O(m*n) voi m va n là do dai 2 chuoi
        LevenshteinDistance distance = new LevenshteinDistance();
     //   System.out.println("khoand cach:" + distance.apply(input, dbValue));
        return distance.apply(input, dbValue) <= threshold;
    }
	private int getDistance(String inString, String value) {
		LevenshteinDistance distance = new LevenshteinDistance();
		return distance.apply(inString, value);
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		User user = (User) session.getAttribute("user");
		
		int userId = 13;
		if (user != null) {
			userId = user.getUserId();  
		}
		
		

		String rawKeyword = request.getParameter("query");
		Set<Integer> matchedIds = new HashSet<>();
		List<Product> matchedProducts = searchProductsByKeyword(rawKeyword, matchedIds);
		logService.info(new Log(userId, "info", "User", "/search", "Thuc hien tim kiem voi keyword: " + rawKeyword));
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
	    List<ScoredProduct> scoredProducts = new ArrayList<>();

	    int tolerance = 0;
	    int length = normalizedKeyword.length();
	    
	    if (length > 15) {
	    	tolerance = 15;
	    }
	    else if (length > 10) {
	        tolerance = 10;
	    }
	    else {
	    	tolerance = 3;
	    }

	    // 1. Tu cache
	    for (Product p : ProductCache.getCachedProducts()) {
	        if (tolerance > 0 && isApproxMatch(normalizedKeyword, p.getUnsignedTitle(), tolerance)) {
	            if (matchedIds.add(p.getProductId())) {
	            	scoredProducts.add(new ScoredProduct(p, getDistance(rawKeyword,p.getUnsignedTitle() )));
	            }
	        }
	    }
	    // 2. Sap xep theo khoang cach tang dan
	    scoredProducts.sort(Comparator.comparingInt(sp -> sp.distance));

	    // 3. Chuyen ve List<Product>
	    List<Product> matchedProducts = new ArrayList<>();
	    for (ScoredProduct sp : scoredProducts) {
	        matchedProducts.add(sp.product);
	    }
	    return matchedProducts;
		/*
		 * // 2. Tu DB try (Connection conn = DatabaseConnection.getConnection();
		 * PreparedStatement stmt = conn.prepareStatement(
		 * "SELECT product_id, img_id, title, price, product_name_unsigned FROM PRODUCT_1 "
		 * + "WHERE product_name_unsigned LIKE ?")) {
		 * 
		 * stmt.setString(1, normalizedKeyword + "%"); try (ResultSet rs =
		 * stmt.executeQuery()) { while (rs.next()) { String dbNormalized =
		 * rs.getString("product_name_unsigned"); if (isApproxMatch(normalizedKeyword,
		 * dbNormalized, 3)) { int productId = rs.getInt("product_id"); if
		 * (matchedIds.add(productId)) { Product product = new Product();
		 * product.setProductId(productId);
		 * product.setImgId(Integer.parseInt(rs.getString("img_id")));
		 * product.setTitle(rs.getString("title"));
		 * product.setPrice(rs.getDouble("price")); matchedProducts.add(product); } } }
		 * } } catch (SQLException e) { e.printStackTrace(); }
		 */

	    
	}


}
class ScoredProduct {
    Product product;
    int distance;

    ScoredProduct(Product product, int distance) {
        this.product = product;
        this.distance = distance;
    }
}
