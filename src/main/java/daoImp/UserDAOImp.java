package daoImp;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import daoInterface.IUserDao;
import models.User;
import service.DatabaseConnection;

public class UserDAOImp implements IUserDao {

	@Override
	public List<User> getUsers() {
		Connection con = null;
		List<User> users = new ArrayList<User>();
		try {
			con = DatabaseConnection.getConnection();
			Statement statement = con.createStatement();
			ResultSet resultSet = statement.executeQuery("select * from User_1 ");
			while (resultSet.next()) {
				int id = resultSet.getInt(1);
				String userName = resultSet.getNString(2);
				String password = resultSet.getNString(3);
				Date date = resultSet.getDate(4);
				int infoId = resultSet.getInt(5);
				users.add(new User(id, userName, password, date, infoId));
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
		return users;
	}

	@Override
	public User findByUserId(int userId) {
		User user = null;
		Connection con = null;
		try {
			con = DatabaseConnection.getConnection();
			Statement statement = con.createStatement();
			ResultSet resultSet = statement.executeQuery("select * from User_1 where user_id =" + userId);
			while (resultSet.next()) {
				int id = resultSet.getInt(1);
				String userName = resultSet.getNString(2);
				String password = resultSet.getNString(3);
				Date date = resultSet.getDate(4);
				int infoId = resultSet.getInt(5);

				user = new User(id, userName, password, date, infoId);
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
		return user;
	}

	@Override
	public int saveUser(User user) {
		// TODO Auto-generated method stub
		Connection con = null;
		int userId = 0;
		try {
			con = DatabaseConnection.getConnection();
			PreparedStatement preparedStatement = con.prepareStatement(
					"insert into User_1 (username,password,create_date,update_date) values(?,?,?,?) ",
					Statement.RETURN_GENERATED_KEYS);
			preparedStatement.setString(1, user.getUsername());
			preparedStatement.setString(2, user.getPassword());
			preparedStatement.setDate(3, new Date(System.currentTimeMillis()));
			preparedStatement.setDate(4, new Date(System.currentTimeMillis()));
			preparedStatement.executeUpdate();

			ResultSet resultSet = preparedStatement.getGeneratedKeys();
			if (resultSet.next())
				userId = resultSet.getInt(1);
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
		return userId;
	}

	@Override
	public void deleteUser(User user) {
		Connection con = null;
		try {
			con = DatabaseConnection.getConnection();
			PreparedStatement preparedStatement = con
					.prepareStatement("delete from User_1 where user_id = " + user.getUserId());
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
	public void updateUser(User user) {
		// TODO Auto-generated method stub
		Connection con = null;
		try {
			con = DatabaseConnection.getConnection();
			PreparedStatement preparedStatement = con.prepareStatement(
					"update User_1 set password = ?, update_date = ?,info_id = ? where user_id =" + user.getUserId());
			preparedStatement.setNString(1, user.getPassword());
			preparedStatement.setDate(2, new Date(System.currentTimeMillis()));
			preparedStatement.setInt(3, user.getInfoId());
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
}
