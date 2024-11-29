package daoImp;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import daoInterface.IProductDao;
import models.Admin;
import models.Product;
import service.DatabaseConnection;

public class ProductDAOImp implements IProductDao {

	@Override
	public List<Product> getProducts() {
		Connection con = null;
		List<Product> products = null;
		try {
			products = new ArrayList<>();
			con = DatabaseConnection.getConnection();
			PreparedStatement statement = con.prepareStatement("select * from Product_1 ");
			ResultSet resultSet = statement.executeQuery();
			while (resultSet.next()) {
				int id = resultSet.getInt(1);
				int adminId = resultSet.getInt(2);
				String title = resultSet.getNString(3);
				double price = resultSet.getDouble(4);
				String description = resultSet.getNString(5);
				String type = resultSet.getNString(6);
				int imgId = resultSet.getInt(7);
				Date createDate = resultSet.getDate(8);
				Date updateDate = resultSet.getDate(9);
				products.add(new Product(id, adminId, title, price, description, type, imgId, createDate, updateDate));
			}
			resultSet.close();
			statement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			try {
				con.close();
			} catch (SQLException e2) {
				e.printStackTrace();
			}
		}
		return products;
	}

	@Override
	public Product findByProductId(int productId) {
		Product product = null;
		Connection con = null;
		try {
			con = DatabaseConnection.getConnection();
			PreparedStatement statement = con.prepareStatement("select * from Product_1 where product_id = ?");
			statement.setInt(1, productId);
			ResultSet resultSet = statement.executeQuery();
			if (resultSet.next()) {
				int id = resultSet.getInt(1);
				int adminId = resultSet.getInt(2);
				String title = resultSet.getNString(3);
				double price = resultSet.getDouble(4);
				String description = resultSet.getNString(5);
				String type = resultSet.getNString(6);
				int imgId = resultSet.getInt(7);
				Date createDate = resultSet.getDate(8);
				Date updateDate = resultSet.getDate(9);
				product = new Product(id, adminId, title, price, description, type, imgId, createDate, updateDate);
			}
			resultSet.close();
			statement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			try {
				con.close();
			} catch (SQLException e2) {
				e.printStackTrace();
			}
		}
		return product;
	}

	@Override
	public int saveProduct(Product product, Admin admin) {
		// TODO Auto-generated method stub
		Connection con = null;
		int productId = 0;
		try {
			con = DatabaseConnection.getConnection();
			PreparedStatement preparedStatement = con.prepareStatement(
					"insert into Product_1 (added_by_admin,title,price,description,type,img_id,create_date, update_date) values(?,?,?,?,?,?,?,?)",
					PreparedStatement.RETURN_GENERATED_KEYS);
			preparedStatement.setInt(1, admin.getAdminId());
			preparedStatement.setString(2, product.getTitle());
			preparedStatement.setDouble(3, product.getPrice());
			preparedStatement.setNString(4, product.getDescription());
			preparedStatement.setNString(5, product.getDescription());
			preparedStatement.setInt(6, product.getImgId());
			preparedStatement.setDate(7, new Date(System.currentTimeMillis()));
			preparedStatement.setDate(8, new Date(System.currentTimeMillis()));
			preparedStatement.executeUpdate();

			ResultSet re = preparedStatement.getGeneratedKeys();
			if (re.next()) {
				productId = re.getInt(1);
			}
			preparedStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			try {
				con.close();
			} catch (SQLException e2) {
				e.printStackTrace();
			}
		}
		return productId;
	}

	@Override
	public void updateProduct(Product product) {
		// TODO Auto-generated method stub
		Connection con = null;
		try {
			con = DatabaseConnection.getConnection();
			PreparedStatement preparedStatement = con.prepareStatement(
					"update Product_1 set added_by_admin = ?, title = ?,price = ?,description = ?,type = ?,img_id = ?, update_date = ? where product_id = ?"
							+ product.getProductId());
			preparedStatement.setInt(1, product.getAddedByAdmin());
			preparedStatement.setString(2, product.getTitle());
			preparedStatement.setDouble(3, product.getPrice());
			preparedStatement.setNString(4, product.getDescription());
			preparedStatement.setNString(5, product.getType());
			preparedStatement.setInt(6, product.getImgId());
			preparedStatement.setDate(7, new Date(System.currentTimeMillis()));
			preparedStatement.setInt(8, product.getProductId());
			preparedStatement.executeUpdate();
			preparedStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			try {
				con.close();
			} catch (SQLException e2) {
				e.printStackTrace();
			}
		}
	}

	@Override
	public void deleteProduct(Product product) {
		// TODO Auto-generated method stub
		Connection con = null;
		try {
			con = DatabaseConnection.getConnection();
			PreparedStatement preparedStatement = con
					.prepareStatement("delete Product_1 where product_id = ? on delete set null");
			preparedStatement.setInt(1, product.getProductId());
			preparedStatement.executeUpdate();
			preparedStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			try {
				con.close();
			} catch (SQLException e2) {
				e.printStackTrace();
			}
		}
	}
}
