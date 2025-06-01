package daoImp;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import daoInterface.IOrderitemDao;
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
			System.out.println("Luu order_item thanh cong");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	public static void main(String[] args) {
		OrderItemDaoImp oi = new OrderItemDaoImp();
		oi.createOrderItem(1, 1, 3, 2000);	
	}

}
