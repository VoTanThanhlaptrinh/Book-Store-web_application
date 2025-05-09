package daoImp;

import java.security.interfaces.RSAKey;
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

public class AddressDaoImp implements IAddressDao {

	@Override
	public int saveAddressAndGetID(Address address) {
		Connection conn = null;
		String sql = "insert into addresses (user_id, full_name, phone, address_detail, district_id, ward_code, address_type, is_default,province_name, district_name,ward_name) "
				+ "values (?, ?, ?, ?, ?, ?, ?, ?,?,?,?)";
		int id = 0;
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
			ps.setString(9, address.getProvinceName());
			ps.setString(10, address.getDistrictName());
			ps.setString(11, address.getWardName());
			int update = ps.executeUpdate();
			if (update > 0) {
				ResultSet generatedKeys = ps.getGeneratedKeys();
				if (generatedKeys.next()) {
					id = generatedKeys.getInt(1);
				}
			}

			ps.close();
		} catch (Exception e) {
			e.printStackTrace();
			try {
				if (conn != null)
					conn.close();
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
		try (Connection conn = DatabaseConnection.getConnection();
				PreparedStatement stmt = conn.prepareStatement(sql)) {
			stmt.setInt(1, userId);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Address addr = new Address(rs.getInt("id"), rs.getInt("user_id"), rs.getString("full_name"),
						rs.getString("phone"), rs.getInt("district_id"), rs.getString("ward_code"),
						rs.getString("address_detail"), rs.getString("address_type"), rs.getString("province_name"),
						rs.getString("district_name"), rs.getString("ward_name"), rs.getBoolean("is_default"));
				addresses.add(addr);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return addresses;
	}

	public Address getAddressDefault(int userID) {
		Address address = null;
		String sql = "select * from addresses where is_default = 'True' and user_id =?";
		try {
			Connection conn = DatabaseConnection.getConnection();
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, userID);
			ResultSet resultSet = stmt.executeQuery();
			while (resultSet.next()) {
				address = new Address(resultSet.getInt(1), resultSet.getInt(2), resultSet.getString(3),
						resultSet.getString(4), resultSet.getInt(6), resultSet.getString(7), resultSet.getString(5),
						resultSet.getString(8), resultSet.getString(10), resultSet.getString(11),
						resultSet.getString(12), resultSet.getBoolean(9));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return address;
	}



	public Address selectAddressByIdAndUser(int addressId, int userId) {
		Address address = null;
		String sql = "select * from addresses where id =? and user_id = ?";
		Connection con;
		try {
			con = DatabaseConnection.getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setInt(1, addressId);
			stmt.setInt(2, userId);
			ResultSet resultSet = stmt.executeQuery();
			while (resultSet.next()) {
				
				address = new Address(resultSet.getInt(1), resultSet.getInt(2), resultSet.getString(3),
						resultSet.getString(4), resultSet.getInt(6), resultSet.getString(7), resultSet.getString(5),
						resultSet.getString(8), resultSet.getString(10), resultSet.getString(11),
						resultSet.getString(12), resultSet.getBoolean(9));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return address;
	}

	
	public static void main(String[] args) {
		AddressDaoImp add = new AddressDaoImp();
	
		
		List<Address> daa= add.getAddressesByUserId(8);
		for (Address address : daa) {
			System.out.println(address);
		}

	}
}


