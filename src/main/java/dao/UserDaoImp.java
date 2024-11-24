package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import models.User;
import service.DatabaseConnection;
import service.IUserDao;

public class UserDaoImp implements IUserDao {

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
				if (infoId != 0) {
					users.add(new User(id, userName, password, date, infoId));
				} else {
					users.add(new User(id, userName, password, date));
				}

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
				if (infoId != 0) {
					user = new User(id, userName, password, date, infoId);
				} else {
					user = new User(id, userName, password, date);
				}

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
	public void saveUser(User user) {
		// TODO Auto-generated method stub
		Connection con = null;
		try {
			con = DatabaseConnection.getConnection();
			PreparedStatement preparedStatement = con
					.prepareStatement("insert into User_1 (username,password,create_date) values(?,?,?)");
			preparedStatement.setString(1, user.getUsername());
			preparedStatement.setString(2, user.getPassword());
			preparedStatement.setDate(3, new java.sql.Date(System.currentTimeMillis()));
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
	public void changePassword(User user, String password) {
		// TODO Auto-generated method stub
		Connection con = null;
		try {
			con = DatabaseConnection.getConnection();
			PreparedStatement preparedStatement = con
					.prepareStatement("update User_1 set password = ? where user_id =" + user.getUserId());
			preparedStatement.setNString(1, password);
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
}
