package daoImp;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import daoInterface.ICartDao;
import models.Cart;
import service.DatabaseConnection;

public class CartDAOImp implements ICartDao {

	@Override
	public Cart getCartByUserId(int userId) {
		Connection con = null;
		Cart cart = null;
		try {
			con = DatabaseConnection.getConnection();
			PreparedStatement statement = con.prepareStatement("select * from Cart where user_id = ?");
			statement.setInt(1, userId);
			ResultSet resultSet = statement.executeQuery();
			if (resultSet.next()) {
				int cartId = resultSet.getInt(1);
				String status = resultSet.getNString(3);
				Date createDate = resultSet.getDate(4);
				Date updateDate = resultSet.getDate(5);
				cart = new Cart(cartId, userId, status, createDate, updateDate);
			}
			resultSet.close();
			statement.close();
		} catch (Exception e) {
			// TODO: handle exception
			try {
				con.close();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		return cart;
	}

	@Override
	public void saveCart(Cart cart, int userId) {
		// TODO Auto-generated method stub
		Connection con = null;
		try {
			con = DatabaseConnection.getConnection();
			PreparedStatement statement = con
					.prepareStatement("insert into Cart (user_id,status,create_date,update_date) values(?,?,?,?)");
			statement.setInt(1, userId);
			statement.setNString(2, cart.getStatus());
			statement.setDate(3, cart.getCreateDate());
			statement.setDate(4, cart.getUpdateDate());
			statement.executeUpdate();
			statement.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			try {
				con.close();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
	}

	@Override
	public void updateCart(Cart cart) {
		// TODO Auto-generated method stub
		Connection con = null;
		try {
			con = DatabaseConnection.getConnection();
			PreparedStatement statement = con
					.prepareStatement("update Cart set status = ?,update_date = ? where cart_id = ?");
			statement.setNString(1, cart.getStatus());
			statement.setDate(2, cart.getUpdateDate());
			statement.setInt(3, cart.getCartId());
			statement.executeUpdate();
			statement.close();
		} catch (Exception e) {
			// TODO: handle exception
			try {
				con.close();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
	}

}
