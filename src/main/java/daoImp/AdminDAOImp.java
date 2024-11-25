package daoImp;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import daoInterface.IAdminDao;
import models.Admin;
import service.DatabaseConnection;

public class AdminDAOImp implements IAdminDao {

	@Override
	public List<Admin> getAdmins() {
		Connection con = null;
		List<Admin> admins = new ArrayList<>();
		try {
			con = DatabaseConnection.getConnection();
			Statement statement = con.createStatement();
			ResultSet resultSet = statement.executeQuery("select * from Admin ");
			while (resultSet.next()) {
				int id = resultSet.getInt(1);
				String userName = resultSet.getNString(2);
				String password = resultSet.getNString(3);
				String status = resultSet.getNString(4);
				int infoId = resultSet.getInt(5);
				Date create_date = resultSet.getDate(6);
				Date update_date = resultSet.getDate(7);
				admins.add(new Admin(id, userName, password, status, infoId, update_date, create_date));
			}
			resultSet.close();
			statement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			try {
				con.close();
			} catch (SQLException e2) {
				e.printStackTrace();
			}
		}
		return admins;
	}

	@Override
	public Admin findByAdminId(int adminId) {
		Admin admin = null;
		Connection con = null;
		try {
			con = DatabaseConnection.getConnection();
			Statement statement = con.createStatement();
			ResultSet resultSet = statement.executeQuery("select * from Admin where admin_id =" + adminId);
			if (resultSet.next()) {
				int id = resultSet.getInt(1);
				String userName = resultSet.getNString(2);
				String password = resultSet.getNString(3);
				String status = resultSet.getNString(4);
				int infoId = resultSet.getInt(5);
				Date create_date = resultSet.getDate(6);
				Date update_date = resultSet.getDate(7);

				admin = new Admin(id, userName, password, status, infoId, create_date, update_date);
			}
			resultSet.close();
			statement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			try {
				con.close();
			} catch (SQLException e2) {
				e.printStackTrace();
			}
		}
		return admin;
	}

	@Override
	public void saveAdmin(Admin admin) {
		// TODO Auto-generated method stub
		Connection con = null;
		try {
			con = DatabaseConnection.getConnection();
			PreparedStatement preparedStatement = con.prepareStatement(
					"insert into Admin (username,password,status,create_date,update_date) values(?,?,?,?,?)");
			preparedStatement.setString(1, admin.getUsername());
			preparedStatement.setString(2, admin.getPassword());
			preparedStatement.setNString(3, "Active");
			preparedStatement.setDate(4, new Date(System.currentTimeMillis()));
			preparedStatement.setDate(5, new Date(System.currentTimeMillis()));
			preparedStatement.executeUpdate();
			preparedStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			try {
				con.close();
			} catch (SQLException e2) {
				e.printStackTrace();
			}
		}
	}

	@Override
	public void updateAdmin(Admin admin) {
		// TODO Auto-generated method stub
		Connection con = null;
		try {
			con = DatabaseConnection.getConnection();
			PreparedStatement preparedStatement = con.prepareStatement(
					"update Admin set password = ?, status = ?, info_id = ?, update_date = ? where admin_id = "
							+ admin.getAdminId());
			preparedStatement.setNString(1, admin.getPassword());
			preparedStatement.setNString(2, admin.getStatus());
			preparedStatement.setInt(3, admin.getInfoId());
			preparedStatement.setDate(4, new Date(System.currentTimeMillis()));
			preparedStatement.executeUpdate();
			preparedStatement.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			try {
				con.close();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
	}
}
