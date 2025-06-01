package daoImp;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import daoInterface.IOrderDao;
import service.DatabaseConnection;

public class OrderDaoImp implements IOrderDao {

	@Override
	public int createOrder(int userID, double total, String status) {
	    int generatedOrderId = -1;

	    try {
	        Connection con = DatabaseConnection.getConnection();
	        PreparedStatement stmp = con.prepareStatement(
	            "INSERT INTO Order_1(user_id, total_amount, status, create_date, update_date) VALUES (?, ?, ?, ?, ?)",
	            Statement.RETURN_GENERATED_KEYS);

	        Date currentDate = new Date(System.currentTimeMillis());
	        stmp.setInt(1, userID);
	        stmp.setDouble(2, total);
	        stmp.setString(3, status);
	        stmp.setDate(4, currentDate);
	        stmp.setDate(5, currentDate);

	        int affectedRows = stmp.executeUpdate();

	        if (affectedRows > 0) {
	            ResultSet rs = stmp.getGeneratedKeys();
	            if (rs.next()) {
	                generatedOrderId = rs.getInt(1); // Lấy id vừa được tạo
	                System.out.println("Lưu order thành công, ID: " + generatedOrderId);
	            }
	            rs.close();
	        }

	        stmp.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return generatedOrderId;
	}

	public static void main(String[] args) {
		OrderDaoImp o = new OrderDaoImp();

		o.createOrder(8, 555, "cho thanh toan");
	}

}
