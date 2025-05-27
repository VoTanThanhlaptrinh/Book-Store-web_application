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
import models.CartProductDetail;
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
				String status = resultSet.getString(7);
				
				items.add(new CartItem(cartItemId, cartId, quantity, productId, createDate, updateDate, status));
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
	  public List<CartProductDetail> getCartProductDetails(int cartId,String status)  {
	        List<CartProductDetail> cartProductDetails = new ArrayList<>();

	        String query = """
	            SELECT ci.cart_item_id, ci.product_id, ci.quantity, ci.create_date, 
	                   p.title AS name, p.price, p.img_id,p.pdQuantity
	            FROM Cart_item ci
	            JOIN Product_1 p ON ci.product_id = p.product_id
	            WHERE ci.status = ? AND ci.cart_id = ?
	        """;
	        
	        Connection connection = null;
			try {
				connection = DatabaseConnection.getConnection();
				 PreparedStatement statement = connection.prepareStatement(query);
	        		statement.setString(1, status);
	        		statement.setInt(2, cartId);
	             ResultSet resultSet = statement.executeQuery();
	            while (resultSet.next()) {
	                CartProductDetail detail = new CartProductDetail();
	                detail.setCartItemId(resultSet.getInt("cart_item_id"));
	                detail.setProductId(resultSet.getInt("product_id"));
	                detail.setName(resultSet.getString("name"));
	                detail.setQuantity(resultSet.getInt("quantity"));
	                detail.setCreateDate(resultSet.getDate("create_date"));
	                detail.setPrice(resultSet.getDouble("price"));
	                detail.setImgId(resultSet.getInt("img_id"));
	                detail.setPd_Quantity(resultSet.getInt("pdQuantity"));
	         //       System.out.println(detail.toString());
	                cartProductDetails.add(detail);
	            }
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				try {
					connection.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
	        return cartProductDetails;
	    }
	@Override
	public boolean updateStatusCartItem(int cartItemId, String status) {
	    // Câu truy vấn DELETE
	    String query = "UPDATE Cart_item SET status = ? WHERE cart_item_id = ?";

	    try (Connection connection = DatabaseConnection.getConnection();
	         PreparedStatement statement = connection.prepareStatement(query)) {

	        // Gán giá trị cho dấu ?
	        statement.setString(1, status);
	        statement.setInt(2, cartItemId);

	        // Thực hiện truy vấn UPDATE
	        if (statement.executeUpdate() > 0) {
	        	return true;
	        }
	        
	       

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	 return false;
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
			System.out.println("still");
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
	public void updateCartItem(int quatity, Date updateDate, int productId, int cart_id) {
		// TODO Auto-generated method stub
		Connection con = null;
		try {
			con = DatabaseConnection.getConnection();
			PreparedStatement preparedStatement = con.prepareStatement(
					"update Cart_item set quantity = ?,update_date = ? where product_id = ? AND cart_id = ?");
			preparedStatement.setInt(1, quatity);
			preparedStatement.setDate(2, updateDate);
			preparedStatement.setInt(3, productId);
			preparedStatement.setInt(4, cart_id);
			int index = preparedStatement.executeUpdate();
		//	System.out.println(index);
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
	public boolean updateQuantityProduct(int minusValue, int productId) {
		// TODO Auto-generated method stub
		int index = 0;
		Connection con = null;
		try {
			con = DatabaseConnection.getConnection();
			PreparedStatement preparedStatement = con.prepareStatement(
					"UPDATE Product_1 SET pdQuantity = pdQuantity - ? WHERE product_id = ?");
			preparedStatement.setInt(1, minusValue);
			preparedStatement.setInt(2, productId);
			index = preparedStatement.executeUpdate();
			
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
		
		return index > 0;
	}




	public static void main(String[] args) {
		CartItemDAOImp dao = new CartItemDAOImp();
//		Date currentDate = new Date(System.currentTimeMillis()); 
	//	System.out.println(dao.updateQuantityProduct(55, 33)); 
		
		
		
		boolean check =dao.updateStatusCartItem(10, "checked");
		System.out.println(check);
	}
}
