package daoImp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import models.Admin;
import models.Image;
import models.Product;
import service.DatabaseConnection;
import daoInterface.IImageDao;
import daoInterface.IProductDao;

public class ProductDAOImp implements IProductDao {
	private IImageDao iImageDao;

	public ProductDAOImp() {
		iImageDao = new ImageDAOImp();
	}

	@Override
	public List<Product> getProducts() {
		Connection con = null;
		List<Product> products = null;
		try {
			products = new ArrayList<>();
			con = DatabaseConnection.getConnection();
			Statement statement = con.createStatement();
			ResultSet resultSet = statement.executeQuery("select * from Product_1 ");
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
				Image img = iImageDao.findByImageId(imgId);
				products.add(new Product(id, adminId, title, price, description, type, img, createDate, updateDate));
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
			Statement statement = con.createStatement();
			ResultSet resultSet = statement.executeQuery("select * from Product_1 where product_id = " + productId);
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
				product = new Product(id, adminId, title, price, description, type, iImageDao.findByImageId(imgId),
						createDate, updateDate);
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
					"insert into Product_1 (added_by_admin,title,price,description,type,img_id,create_date, update_date) values(?,?,?,?,?,?,?,?)");
			preparedStatement.setInt(1, admin.getAdminId());
			preparedStatement.setString(2, product.getTitle());
			preparedStatement.setDouble(3, product.getPrice());
			preparedStatement.setNString(4, product.getDescription());
			preparedStatement.setNString(5, product.getDescription());
			preparedStatement.setInt(6, product.getImg().getImgId());
			preparedStatement.setDate(7, new java.sql.Date(System.currentTimeMillis()));
			preparedStatement.setDate(8, new java.sql.Date(System.currentTimeMillis()));
			preparedStatement.executeUpdate();

			ResultSet re = preparedStatement.getGeneratedKeys();
			while (re.next()) {
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
	public void updateProduct(Product product, Admin admin, Image img) {
		// TODO Auto-generated method stub
		Connection con = null;
		try {
			con = DatabaseConnection.getConnection();
			PreparedStatement preparedStatement = con.prepareStatement(
					"update Product_1 set title = ?,price = ?,description = ?,type = ?,img_id = ?, update_date = ? where product_id = "
							+ product.getProductId());
			preparedStatement.setString(1, product.getTitle());
			preparedStatement.setDouble(2, product.getPrice());
			preparedStatement.setNString(3, product.getDescription());
			preparedStatement.setNString(4, product.getDescription());
			preparedStatement.setInt(5, img.getImgId());
			preparedStatement.setDate(6, new java.sql.Date(System.currentTimeMillis()));
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
			PreparedStatement preparedStatement = con.prepareStatement(
					"delete Product_1 where product_id = " + product.getProductId() + " on delete set null");
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
