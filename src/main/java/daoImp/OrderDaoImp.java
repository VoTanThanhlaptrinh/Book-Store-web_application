package daoImp;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import daoInterface.IOrderDao;
import models.Order;
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

	        Timestamp currentDateTime = new Timestamp(System.currentTimeMillis());
	        
	        stmp.setInt(1, userID);
	        stmp.setDouble(2, total);
	        stmp.setString(3, status);
	        stmp.setTimestamp(4, currentDateTime);
	        stmp.setTimestamp(5, currentDateTime);

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
	
	
	public Order getOrderByIdAndUserId(int orderId, int userId) {
	    Order order = null;

	    try {
	        Connection con = DatabaseConnection.getConnection();
	        PreparedStatement stmp = con.prepareStatement(
	            "SELECT * FROM Order_1 WHERE order_id = ? AND user_id = ?"
	        );

	        stmp.setInt(1, orderId);
	        stmp.setInt(2, userId);

	        ResultSet rs = stmp.executeQuery();
	        if (rs.next()) {
	            order = new Order();
	            order.setOrderId(rs.getInt("order_id"));
	            order.setUserId(rs.getInt("user_id"));
	            order.setTotalAmount(rs.getDouble("total_amount"));
	            order.setStatus(rs.getString("status"));
	            order.setCreateDate(rs.getDate("create_date"));
	            order.setUpdateDate(rs.getDate("update_date"));
	            order.setSignature(rs.getString("signature"));
	            order.setPublicKey(rs.getString("publicKey"));
	        }

	        rs.close();
	        stmp.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return order;
	}
	public List<Order> getOrdersByUserId(int userId) {
	    List<Order> orders = new ArrayList<>();

	    try {
	        Connection con = DatabaseConnection.getConnection();
	        PreparedStatement stmp = con.prepareStatement(
	            "SELECT * FROM Order_1 WHERE user_id = ? AND status != 'deleted'"
	        );

	        stmp.setInt(1, userId);
	        ResultSet rs = stmp.executeQuery();

	        while (rs.next()) {
	            Order order = new Order();
	            order.setOrderId(rs.getInt("order_id"));
	            order.setUserId(rs.getInt("user_id"));
	            order.setTotalAmount(rs.getDouble("total_amount"));
	            order.setStatus(rs.getString("status"));
	            order.setCreateDate(rs.getDate("create_date"));
	            order.setUpdateDate(rs.getDate("update_date"));
	            order.setSignature(rs.getString("signature"));
	            order.setPublicKey(rs.getString("publicKey"));
	            orders.add(order);
	        }

	        rs.close();
	        stmp.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return orders;
	}
	
	public Order getOrderById(int orderId) {
	    Order order = null;
	    String sql = "SELECT order_id, user_id, total_amount,create_date, status, signature,publicKey FROM Order_1 WHERE order_id = ?";
	    
	    try (Connection conn = DatabaseConnection.getConnection();
	         PreparedStatement ps = conn.prepareStatement(sql)) {
	        
	        ps.setInt(1, orderId);
	        ResultSet rs = ps.executeQuery();
	        
	        if (rs.next()) {
	            order = new Order();
	            order.setOrderId(rs.getInt("order_id"));
	            order.setUserId(rs.getInt("user_id"));
	            order.setCreateDate(rs.getTimestamp("create_date")); // Hoặc getDate nếu bạn dùng java.sql.Date
	            order.setStatus(rs.getString("status"));
	            order.setSignature(rs.getString("signature"));
	            order.setPublicKey(rs.getString("publicKey"));
	            order.setTotalPrice(rs.getDouble("total_amount"));
	        }
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    
	    return order;
	}
	
	public void savePublicKey(int userId, String publicKey) {
	    // 1. Cap nhat tat ca cac khoa hien tai ve 'inactive'
	    String deactivateSql = "UPDATE public_key SET status = 'inactive' WHERE user_id = ?";
	    
	    // 2. Chen khoa moi vao bang voi trang thai 'active'
	    String insertSql = "INSERT INTO public_key(user_id, public_key, status) VALUES (?, ?, 'active')";
	    
	    try (Connection conn = DatabaseConnection.getConnection()) {
	        // Tat autocommit de dam bao ca 2 buoc duoc xu ly cung nhau
	        conn.setAutoCommit(false);
	        
	        try (
	            PreparedStatement deactivateStmt = conn.prepareStatement(deactivateSql);
	            PreparedStatement insertStmt = conn.prepareStatement(insertSql);
	        ) {
	            // Buoc 1
	            deactivateStmt.setInt(1, userId);
	            deactivateStmt.executeUpdate();
	            
	            // Buoc 2
	            insertStmt.setInt(1, userId);
	            insertStmt.setString(2, publicKey);
	            insertStmt.executeUpdate();
	            
	            // Commit neu khong loi
	            conn.commit();
	        } catch (Exception ex) {
	            conn.rollback();
	            ex.printStackTrace();
	        } finally {
	            conn.setAutoCommit(true);
	        }
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
	public void updatePublicKeyStatus(int userId, String status) {
	    String sql = "UPDATE public_key SET status = ? WHERE user_id = ?";
	    
	    try (Connection conn = DatabaseConnection.getConnection();
	         PreparedStatement ps = conn.prepareStatement(sql)) {
	        
	        ps.setString(1, status);
	        ps.setInt(2, userId);
	        
	        ps.executeUpdate();
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
	
	public boolean hasActivePublicKey(int userId, String publicKey) {
	    String sql = "SELECT 1 FROM public_key WHERE user_id = ? AND status = 'active' AND public_key = ?";
	    
	    try (Connection conn = DatabaseConnection.getConnection();
	         PreparedStatement ps = conn.prepareStatement(sql)) {
	        
	        ps.setInt(1, userId);
	        ps.setString(2, publicKey);
	        ResultSet rs = ps.executeQuery();
	        
	        return rs.next(); // Nếu có kết quả => đã có public key active
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    
	    return false;
	}

	public String loadPublicKey(int userId) {
		String publicKey = "";
		
		String sql = "SELECT public_key FROM public_key WHERE user_id = ? AND status = 'active' ";
		
		
		 try (Connection conn = DatabaseConnection.getConnection();
		         PreparedStatement ps = conn.prepareStatement(sql)) {
		        
		        ps.setInt(1, userId);
		        ResultSet rs = ps.executeQuery();
		        
		        if (rs.next()) {
		            publicKey = rs.getString("public_key");
		        }
		        
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		  
		    return publicKey;
		
	}
	
	
	
	public String getProductListByOrderId(int orderId) {
	    String productList = "";

	    String sql = "SELECT " +
	                  "STUFF(( " +
	                  "    SELECT ', ' + p2.title " +
	                  "    FROM Order_item oi2 " +
	                  "    JOIN Product_1 p2 ON p2.product_id = oi2.product_id " +
	                  "    WHERE oi2.order_id = o.order_id " +
	                  "    FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)'), 1, 2, '') AS product_list " +
	                  "FROM Order_1 o " +
	                  "WHERE o.order_id = ? " +
	                  "GROUP BY o.order_id";

	    try (Connection con = DatabaseConnection.getConnection();
	         PreparedStatement stmp = con.prepareStatement(sql)) {

	        stmp.setInt(1, orderId);

	        ResultSet rs = stmp.executeQuery();
	        if (rs.next()) {
	            productList = rs.getString("product_list");
	        }

	        rs.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return productList;
	}

	public boolean updateOrderStatus(int orderId, String newStatus) {
	    String sql = "UPDATE Order_1 SET status = ?, update_date = ? WHERE order_id = ?";
	    try (Connection con = DatabaseConnection.getConnection();
	         PreparedStatement stmp = con.prepareStatement(sql)) {
	        stmp.setString(1, newStatus);
	        stmp.setTimestamp(2, new Timestamp(System.currentTimeMillis())); // cập nhật update_date
	        stmp.setInt(3, orderId);

	        int rowsAffected = stmp.executeUpdate();
	        return rowsAffected > 0; // nếu update thành công trả về true

	    } catch (SQLException e) {
	        e.printStackTrace();
	        return false; // lỗi thì trả về false
	    }
	}

	public int getHoursSinceOrder(int orderId) {
	    int hours = -1;
	    String sql = "SELECT DATEDIFF(HOUR, create_date, GETDATE()) AS hours_since_order " +
	                 "FROM Order_1 WHERE order_id = ?";
	    
	    try (Connection conn = DatabaseConnection.getConnection();
	         PreparedStatement ps = conn.prepareStatement(sql)) {
	        
	        ps.setInt(1, orderId);
	        ResultSet rs = ps.executeQuery();
	        
	        if (rs.next()) {
	            hours = rs.getInt("hours_since_order");
	        }
	        
	        rs.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    
	    return hours;
	}
	
	public void updateOrderSignature(int orderId, String signature) {
	    String sql = "UPDATE Order_1 SET signature = ?, update_date = ? WHERE order_id = ?";

	    try (Connection conn = DatabaseConnection.getConnection();
	         PreparedStatement ps = conn.prepareStatement(sql)) {

	        ps.setString(1, signature);
	        ps.setTimestamp(2, new Timestamp(System.currentTimeMillis())); 
	        ps.setInt(3, orderId);

	        int rowsAffected = ps.executeUpdate();

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	}
	public void updateOrderPublicKey(int orderId, String publicKey) {
	    String sql = "UPDATE Order_1 SET publicKey = ?, update_date = ? WHERE order_id = ?";

	    try (Connection conn = DatabaseConnection.getConnection();
	         PreparedStatement ps = conn.prepareStatement(sql)) {

	        ps.setString(1, publicKey);
	        ps.setTimestamp(2, new Timestamp(System.currentTimeMillis())); 
	        ps.setInt(3, orderId);

	        int rowsAffected = ps.executeUpdate();

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	}

	public static void main(String[] args) {
		OrderDaoImp o = new OrderDaoImp();

		System.out.println(o.getProductListByOrderId(69));

	}

}
