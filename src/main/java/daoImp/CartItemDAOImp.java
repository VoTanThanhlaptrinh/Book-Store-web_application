package daoImp;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import daoInterface.ICartItemDao;
import models.CartItem;
import service.DatabaseConnection;

public class CartItemDAOImp implements ICartItemDao {

	@Override
	public List<CartItem> getCartItemsByCartId(int cartId) {
		// TODO Auto-generated method stub
		Connection con = null;
		List<CartItem> items = new ArrayList<CartItem>();
		try {
			con = DatabaseConnection.getConnection();
			PreparedStatement statement = con.prepareStatement("select * from Cart_item where cart_id = ?");
			statement.setInt(1, cartId);
			ResultSet resultSet = statement.executeQuery();
			while (resultSet.next()) {
				int cartItemId = resultSet.getInt(1);
				int quantity = resultSet.getInt(3);
				int productId = resultSet.getInt(4);
				Date createDate = resultSet.getDate(5);
				Date updateDate = resultSet.getDate(6);
				items.add(new CartItem(cartItemId, cartId, quantity, productId, createDate, updateDate));
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
		return items;
	}

	@Override
	public void saveCartItem(CartItem cartItem) {
		// TODO Auto-generated method stub
		Connection con = null;
		try {
			con = DatabaseConnection.getConnection();
			PreparedStatement preparedStatement = con.prepareStatement(
					"insert into Cart_item (cart_id,quantity,product_id,create_date,update_date) values(?,?,?,?,?)");
			preparedStatement.setInt(1, cartItem.getCartId());
			preparedStatement.setInt(2, cartItem.getQuantity());
			preparedStatement.setInt(3, cartItem.getProductId());
			preparedStatement.setDate(4, cartItem.getCreateDate());
			preparedStatement.setDate(5, cartItem.getUpdateDate());
			preparedStatement.executeUpdate();
			preparedStatement.close();
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

	@Override
	public void updateCartItem(CartItem cartItem) {
		// TODO Auto-generated method stub
		Connection con = null;
		try {
			con = DatabaseConnection.getConnection();
			PreparedStatement preparedStatement = con.prepareStatement(
					"update Cart_item set cart_id = ?,quantity = ?,product_id = ?,update_date = ? where cart_item_id = ?");
			preparedStatement.setInt(1, cartItem.getCartId());
			preparedStatement.setInt(2, cartItem.getQuantity());
			preparedStatement.setInt(3, cartItem.getProductId());
			preparedStatement.setDate(4, cartItem.getUpdateDate());
			preparedStatement.setInt(5, cartItem.getCartItemId());
			preparedStatement.executeUpdate();
			preparedStatement.close();
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
