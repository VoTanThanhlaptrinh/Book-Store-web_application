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
	public List<FilterProduct> getProducts(int limit, int offset, Integer categoryId, Integer categoryParentId, Double minPrice, Double maxPrice) {
	    Connection con = null;
	    List<FilterProduct> products = new ArrayList<>();
	    try {
	        StringBuilder queryBuilder = new StringBuilder();
	        queryBuilder.append("SELECT p.product_id, p.img_id, p.title, p.price ");
	        queryBuilder.append("FROM Product_1 p ");
	        queryBuilder.append("WHERE 1=1 "); // Điều kiện chung để dễ dàng thêm các lọc khác

	        // Lọc theo categoryId
	        if (categoryId != null) {
	            queryBuilder.append(" AND p.category_id = ? ");
	        }

	        // Lọc theo categoryParentId
	        if (categoryParentId != null) {
	            queryBuilder.append(" AND p.category_parent_id = ? ");
	        }

	        // Lọc theo giá tiền
	        if (minPrice != null && maxPrice != null) {
	            queryBuilder.append(" AND p.price BETWEEN ? AND ? ");
	        } else if (minPrice != null) {
	            queryBuilder.append(" AND p.price >= ? ");
	        } else if (maxPrice != null) {
	            queryBuilder.append(" AND p.price <= ? ");
	        }

	        // Sắp xếp và phân trang
	        queryBuilder.append("ORDER BY p.product_id ");
	        queryBuilder.append("OFFSET ? ROWS FETCH NEXT ? ROWS ONLY");

	        con = DatabaseConnection.getConnection();
	        PreparedStatement statement = con.prepareStatement(queryBuilder.toString());

	        int paramIndex = 1;

	        // Set tham số cho categoryId, categoryParentId
	        if (categoryId != null) {
	            statement.setInt(paramIndex++, categoryId);
	        }
	        if (categoryParentId != null) {
	            statement.setInt(paramIndex++, categoryParentId);
	        }

	        // Set tham số cho giá tiền
	        if (minPrice != null && maxPrice != null) {
	            statement.setDouble(paramIndex++, minPrice);
	            statement.setDouble(paramIndex++, maxPrice);
	        } else if (minPrice != null) {
	            statement.setDouble(paramIndex++, minPrice);
	        } else if (maxPrice != null) {
	            statement.setDouble(paramIndex++, maxPrice);
	        }

	        // Set tham số cho phân trang
	        statement.setInt(paramIndex++, offset);
	        statement.setInt(paramIndex++, limit);

	        ResultSet resultSet = statement.executeQuery();

	        while (resultSet.next()) {
	            FilterProduct product = new FilterProduct();
	            product.setProductId(resultSet.getInt("product_id"));
	            product.setImgId(resultSet.getString("img_id"));
	            product.setTitle(resultSet.getString("title"));
	            product.setPrice(resultSet.getDouble("price"));
	            products.add(product);
	        }

	        resultSet.close();
	        statement.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (con != null) con.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    return products;
	}
	public int getTotalProducts(Integer categoryId, Integer categoryParentId, Double minPrice, Double maxPrice) {
	    Connection con = null;
	    int totalProducts = 0;
	    try {
	        StringBuilder queryBuilder = new StringBuilder();
	        queryBuilder.append("SELECT COUNT(*) AS total FROM Product_1 WHERE 1=1"); // Điều kiện chung để dễ dàng thêm các lọc khác

	        // Lọc theo categoryId
	        if (categoryId != null) {
	            queryBuilder.append(" AND category_id = ?");
	        }

	        // Lọc theo categoryParentId
	        if (categoryParentId != null) {
	            queryBuilder.append(" AND category_parent_id = ?");
	        }

	        // Lọc theo giá tiền
	        if (minPrice != null && maxPrice != null) {
	            queryBuilder.append(" AND price BETWEEN ? AND ?");
	        } else if (minPrice != null) {
	            queryBuilder.append(" AND price >= ?");
	        } else if (maxPrice != null) {
	            queryBuilder.append(" AND price <= ?");
	        }

	        con = DatabaseConnection.getConnection();
	        PreparedStatement statement = con.prepareStatement(queryBuilder.toString());

	        // Set tham số cho các điều kiện
	        int paramIndex = 1;
	        if (categoryId != null) {
	            statement.setInt(paramIndex++, categoryId);
	        }
	        if (categoryParentId != null) {
	            statement.setInt(paramIndex++, categoryParentId);
	        }
	        if (minPrice != null && maxPrice != null) {
	            statement.setDouble(paramIndex++, minPrice);
	            statement.setDouble(paramIndex++, maxPrice);
	        } else if (minPrice != null) {
	            statement.setDouble(paramIndex++, minPrice);
	        } else if (maxPrice != null) {
	            statement.setDouble(paramIndex++, maxPrice);
	        }

	        ResultSet resultSet = statement.executeQuery();
	        if (resultSet.next()) {
	            totalProducts = resultSet.getInt("total");
	        }

	        resultSet.close();
	        statement.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (con != null) con.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    System.out.println("tong san pham: " + totalProducts);
	    return totalProducts;
	}


}
