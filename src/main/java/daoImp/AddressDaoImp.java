package daoImp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import daoInterface.IAddressDao;
import models.Address;
import service.DatabaseConnection;

public class AddressDaoImp implements IAddressDao{

	@Override
	public int saveAddressAndGetID(Address address) {
		Connection conn = null;
		String sql ="insert into addresses (user_id, full_name, phone, address_detail, district_id, ward_code, address_type, is_default) " +
                "values (?, ?, ?, ?, ?, ?, ?, ?)";
		int id =0;
		try {
			conn = DatabaseConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			
			  ps.setInt(1, address.getUserID());
	            ps.setString(2, address.getFull_name());
	            ps.setString(3, address.getPhone());
	            ps.setString(4, address.getAddress_detail());
	            ps.setInt(5, address.getDistrictID());
	            ps.setString(6, address.getWard_code());
	            ps.setString(7, address.getAddress_type());
	            ps.setBoolean(8, address.isIs_default());

	            int update = ps.executeUpdate();
	            if(update>0) {
	            	ResultSet generatedKeys = ps.getGeneratedKeys();
	            	if(generatedKeys.next()) {
	            		id= generatedKeys.getInt(1);
	            	}
	            }
	            
	            
	            ps.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	            try {
	                if (conn != null) conn.close();
	            } catch (SQLException ex) {
	                ex.printStackTrace();
	            }
	        }
		return id;
	    }

	@Override
	public void updateDefaultStatus(int userID, int addressID) {
		Connection conn = null;
		String sql = "update addresses set is_default = case when id = ? then 1 else 0 end where user_id = ?";
		try {
			conn = DatabaseConnection.getConnection();
			PreparedStatement pre = conn.prepareStatement(sql);
			pre.setInt(1, addressID);
			pre.setInt(2, userID);
			pre.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	public List<Address> getAddressesByUserId(int userId) {
	    List<Address> addresses = new ArrayList<>();
	    String sql = "SELECT * FROM addresses WHERE user_id = ?";
	    try (Connection conn =DatabaseConnection.getConnection(); 
	    	PreparedStatement stmt = conn.prepareStatement(sql)) {
	        stmt.setInt(1, userId);
	        ResultSet rs = stmt.executeQuery();
	        while (rs.next()) {
	            Address addr = new Address(
	            	rs.getInt("id"),
	                rs.getInt("user_id"),
	                rs.getString("full_name"),
	                rs.getString("phone"),
	                rs.getInt("district_id"),
	                rs.getString("ward_code"),
	                rs.getString("address_detail"),
	                rs.getString("address_type"),
	                rs.getBoolean("is_default")
	            );
	            // Nếu có provinceName, districtName, wardName, thêm vào đây
	            addresses.add(addr);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return addresses;
	}
	public static void main(String[] args) {
		AddressDaoImp add = new AddressDaoImp();
		List<Address> address = add.getAddressesByUserId(18);
		for (Address address2 : address) {
			System.out.println(address2);
		}
	}
	}