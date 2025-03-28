package daoImp;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import service.DatabaseConnection;
import models.*;
public class NewProductDao {

	public NewProductDao() {
		
	}
	public List<FilterProduct> getProducts(int limit, int offset) {
	    Connection con = null;
	    List<FilterProduct> products = new ArrayList<>();
	    try {
	        // Truy vấn với OFFSET FETCH
	        String query = "SELECT product_id, img_id, title, price " +
	                       "FROM Product_1 " +
	                       "ORDER BY product_id " +
	                       "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
	        con = DatabaseConnection.getConnection();
	        PreparedStatement statement = con.prepareStatement(query);
	        statement.setInt(1, offset); // Thiết lập giá trị OFFSET
	        statement.setInt(2, limit);  // Thiết lập giá trị LIMIT
	        ResultSet resultSet = statement.executeQuery();

	        // Đọc dữ liệu từ ResultSet
	        while (resultSet.next()) {
	            int productId = resultSet.getInt("product_id");
	            String imgId = resultSet.getString("img_id");
	            String title = resultSet.getString("title");
	            double price = resultSet.getDouble("price");

	            // Tạo đối tượng Product và thêm vào danh sách
	            FilterProduct product = new FilterProduct(productId, imgId, title, price);
	            products.add(product);
	        }

	        // Đóng ResultSet và PreparedStatement
	        resultSet.close();
	        statement.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        // Đóng kết nối
	        try {
	            if (con != null) con.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    return products;
	}
	 public int getTotalProduct() {
	        Connection con = null;
	        int totalProducts = 0; // Biến lưu trữ tổng số sản phẩm

	        try {
	            // Truy vấn để lấy tổng số sản phẩm
	            String query = "SELECT COUNT(*) AS total FROM Product_1";
	            con = DatabaseConnection.getConnection();
	            PreparedStatement statement = con.prepareStatement(query);
	            ResultSet resultSet = statement.executeQuery();

	            // Đọc kết quả từ ResultSet
	            if (resultSet.next()) {
	                totalProducts = resultSet.getInt("total"); // Lấy giá trị từ cột "total"
	            }

	            // Đóng ResultSet và PreparedStatement
	            resultSet.close();
	            statement.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            // Đóng kết nối
	            try {
	                if (con != null) con.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }

	        return totalProducts; // Trả về tổng số sản phẩm
	    }
}
