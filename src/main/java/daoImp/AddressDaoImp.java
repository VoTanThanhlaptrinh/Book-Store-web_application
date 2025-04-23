package daoImp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

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
	}