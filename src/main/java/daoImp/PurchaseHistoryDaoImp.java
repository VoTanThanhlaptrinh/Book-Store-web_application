package daoImp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.PurchaseHistory;
import service.DatabaseConnection;

public class PurchaseHistoryDaoImp {
	public List<PurchaseHistory> getPurchasedProductsByUser(int userId) {
	    List<PurchaseHistory> list = new ArrayList<>();
	    String sql = "SELECT * FROM dbo.fn_GetPurchasedProductsByUser(?) ORDER BY create_date DESC";

	    try (Connection con = DatabaseConnection.getConnection();
	         PreparedStatement ps = con.prepareStatement(sql)) {

	        ps.setInt(1, userId);

	        try (ResultSet rs = ps.executeQuery()) {
	            while (rs.next()) {
	            	PurchaseHistory p = new PurchaseHistory();
	            	p.setOrderId(rs.getInt("order_id"));
	                p.setProductId(rs.getInt("product_id"));
	                p.setProductName(rs.getString("product_name"));
	                p.setImgId(rs.getInt("product_image")); // giả sử img_id là int
	                p.setQuantity(rs.getInt("quantity"));
	                p.setPrice(rs.getDouble("price"));
	                p.setTotalPricePerProduct(rs.getDouble("total_price_per_product"));
	                p.setCreateDate(rs.getDate("create_date"));
	                p.setStatus(rs.getString("status"));

	                list.add(p);
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return list;
	}
	public List<PurchaseHistory> getPurchaseHistoryByOrderId(int orderId) {
	    List<PurchaseHistory> list = new ArrayList<>();
	    String sql = "SELECT * FROM dbo.fn_GetPurchaseHistoryByOrderId(?) ORDER BY create_date DESC";

	    try (Connection con = DatabaseConnection.getConnection();
	         PreparedStatement ps = con.prepareStatement(sql)) {

	        ps.setInt(1, orderId);

	        try (ResultSet rs = ps.executeQuery()) {
	            while (rs.next()) {
	                PurchaseHistory p = new PurchaseHistory();
	                p.setOrderId(rs.getInt("order_id"));
	                p.setProductId(rs.getInt("product_id"));
	                p.setProductName(rs.getString("product_name"));
	                p.setImgId(rs.getInt("product_image")); // gia su img_id la int
	                p.setQuantity(rs.getInt("quantity"));
	                p.setPrice(rs.getDouble("price"));
	                p.setTotalPricePerProduct(rs.getDouble("total_price_per_product"));
	                p.setCreateDate(rs.getDate("create_date"));
	                p.setStatus(rs.getString("status"));

	                list.add(p);
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return list;
	}

	public static void main(String[] args) {
		PurchaseHistoryDaoImp pImp = new PurchaseHistoryDaoImp();
		List<PurchaseHistory> ls= pImp.getPurchasedProductsByUser(18);
		
		
		for (PurchaseHistory purchaseHistory : ls) {
			System.out.println(purchaseHistory);
		}
	}

}
