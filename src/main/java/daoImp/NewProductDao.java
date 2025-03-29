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
	public List<FilterProduct> getProducts(int limit, int offset, Integer categoryId, Integer categoryParentId) {
	    Connection con = null;
	    List<FilterProduct> products = new ArrayList<>();
	    try {
	        StringBuilder queryBuilder = new StringBuilder();
	        queryBuilder.append("SELECT p.product_id, p.img_id, p.title, p.price ");
	        queryBuilder.append("FROM Product_1 p ");

	        if (categoryId != null) {
	            queryBuilder.append("WHERE p.category_id = ? ");
	        } else if (categoryParentId != null) {
	            queryBuilder.append("WHERE p.category_parent_id = ? ");
	        }

	        queryBuilder.append("ORDER BY p.product_id ");
	        queryBuilder.append("OFFSET ? ROWS FETCH NEXT ? ROWS ONLY");

	        con = DatabaseConnection.getConnection();
	        PreparedStatement statement = con.prepareStatement(queryBuilder.toString());

	        int paramIndex = 1;
	        if (categoryId != null) {
	            statement.setInt(paramIndex++, categoryId);
	        } else if (categoryParentId != null) {
	            statement.setInt(paramIndex++, categoryParentId);
	        }

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
	public int getTotalProducts(Integer categoryId, Integer categoryParentId) {
	    Connection con = null;
	    int totalProducts = 0;
	    try {
	        StringBuilder queryBuilder = new StringBuilder();
	        queryBuilder.append("SELECT COUNT(*) AS total ");

	        if (categoryId != null) {
	            queryBuilder.append("FROM Product_1 WHERE category_id = ?");
	        } else if (categoryParentId != null) {
	            queryBuilder.append("FROM Product_1 WHERE category_parent_id = ?");
	        } else {
	            queryBuilder.append("FROM Product_1");
	        }

	        con = DatabaseConnection.getConnection();
	        PreparedStatement statement = con.prepareStatement(queryBuilder.toString());

	        int paramIndex = 1;
	        if (categoryId != null) {
	            statement.setInt(paramIndex++, categoryId);
	        } else if (categoryParentId != null) {
	            statement.setInt(paramIndex++, categoryParentId);
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
	    return totalProducts;
	}
}
