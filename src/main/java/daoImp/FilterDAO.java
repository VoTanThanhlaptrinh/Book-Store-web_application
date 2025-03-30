package daoImp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.Category;
import service.DatabaseConnection;

public class FilterDAO {
	
	public List<Category> getTopCategories() {
	    Connection con = null;
	    List<Category> categories = new ArrayList<>();
	    try {
	        String query = "SELECT id, name FROM categories WHERE parent_id IS NULL";
	        con = DatabaseConnection.getConnection();
	        PreparedStatement statement = con.prepareStatement(query);
	        ResultSet resultSet = statement.executeQuery();

	        while (resultSet.next()) {
	            Category category = new Category();
	            category.setId(resultSet.getInt("id"));
	            category.setName(resultSet.getString("name"));
	            categories.add(category);
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
	    return categories;
	}
	public List<Category> getSubCategories(int categoryId) {
	    Connection con = null;
	    List<Category> subCategories = new ArrayList<>();
	    try {
	        String query = "SELECT id, name FROM categories WHERE parent_id = ?";
	        con = DatabaseConnection.getConnection();
	        PreparedStatement statement = con.prepareStatement(query);
	        statement.setInt(1, categoryId);
	        ResultSet resultSet = statement.executeQuery();

	        while (resultSet.next()) {
	            Category category = new Category();
	            category.setId(resultSet.getInt("id"));
	            category.setName(resultSet.getString("name"));
	            subCategories.add(category);
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
	    return subCategories;
	}
}
