package daoImp;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import daoInterface.IOrderitemDao;
import models.OrderItem;
import service.DatabaseConnection;

public class OrderItemDaoImp implements IOrderitemDao{

	@Override
	public void createOrderItem(int orderId, int productId, int quantity, double price) {
		try {
			Connection con = DatabaseConnection.getConnection();
			PreparedStatement stmp = con.prepareStatement(
					"insert into Order_item(order_id, product_id,quantity,price,create_date,update_date) values (?,?,?,?,?,?)");
			Date currentDate = new Date(System.currentTimeMillis());
			stmp.setInt(1, orderId);
			stmp.setInt(2, productId);
			stmp.setInt(3, quantity);
			stmp.setDouble(4, price);
			stmp.setDate(5, currentDate);
			stmp.setDate(6, currentDate);

			stmp.executeUpdate();
			stmp.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	public List<OrderItem> getOrderItemsByOrderId(int orderId) {
	    List<OrderItem> orderItems = new ArrayList<>();

	    try {
	        Connection con = DatabaseConnection.getConnection();
	        PreparedStatement stmp = con.prepareStatement(
	            "SELECT * FROM Order_item WHERE order_id = ?"
	        );
	        stmp.setInt(1, orderId);
	        ResultSet rs = stmp.executeQuery();

	        while (rs.next()) {
	            OrderItem item = new OrderItem();
	        //    item.setOrderId(rs.getInt("order_id"));
	        //    item.setProductId(rs.getInt("product_id"));
	         //   item.setQuantity(rs.getInt("quantity"));
	         //   item.setPrice(rs.getDouble("price"));
	       //     item.setCreateDate(rs.getDate("create_date"));
	          //  item.setUpdateDate(rs.getDate("update_date"));

	            orderItems.add(item);
	        }

	        rs.close();
	        stmp.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return orderItems;
	}

	public static void main(String[] args) {
		OrderItemDaoImp oi = new OrderItemDaoImp();
		oi.createOrderItem(1, 1, 3, 2000);	
	}

}
