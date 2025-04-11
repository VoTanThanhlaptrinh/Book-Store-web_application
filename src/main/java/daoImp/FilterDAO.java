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
    
    // Phương thức lấy các danh mục cấp trên (Top categories)
    public List<Category> getTopCategories() {
        Connection con = null;
        List<Category> categories = new ArrayList<>();
        try {
            StringBuilder query = new StringBuilder();
            query.append("SELECT id, name "
                    + "FROM categories "
                    + "WHERE parent_id IS NULL");

         

            con = DatabaseConnection.getConnection();
            PreparedStatement statement = con.prepareStatement(query.toString());

            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
            	Category filterModel = new Category();
            	filterModel.setId(resultSet.getInt("id"));
            	filterModel.setName(resultSet.getString("name"));
          
                categories.add(filterModel);
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

    // Phương thức lấy các danh mục con (Sub categories)
    public List<Category> getSubCategories(int categoryParentId) {
        Connection con = null;
        List<Category> subCategories = new ArrayList<>();
        try {
            StringBuilder query = new StringBuilder();
            query.append("SELECT c.id,c.name, c.parent_id "
            		+ "FROM categories c " 
            		+ "WHERE c.parent_id = ?");

           

            con = DatabaseConnection.getConnection();
            PreparedStatement statement = con.prepareStatement(query.toString());
            statement.setInt(1, categoryParentId);


            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
            	Category filterModel = new Category();
            	filterModel.setId(resultSet.getInt("id"));
            	filterModel.setName(resultSet.getString("name"));
           
                subCategories.add(filterModel);
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
