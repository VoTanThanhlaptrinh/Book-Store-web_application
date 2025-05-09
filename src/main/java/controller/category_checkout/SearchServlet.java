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
        String normalizedKeyword = normalize(rawKeyword);
        Set<Integer> matchedIds = new HashSet<>();
        List<Product> matchedProducts = new ArrayList<>();

        // 1. So với cache
        for (Product p : ProductCache.getCachedProducts()) {
            if (isApproxMatch(normalizedKeyword, p.getUnsignedTitle(), 3)) {
                if (matchedIds.add(p.getProductId())) {
                    matchedProducts.add(p);
                }
            }
        }

        // 2. So với DB
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

        request.setAttribute("products", matchedProducts);
        request.getRequestDispatcher("webPage/categoryAndSingle/filter.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
