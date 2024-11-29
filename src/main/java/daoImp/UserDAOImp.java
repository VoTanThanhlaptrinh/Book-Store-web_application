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
import exeption.SqlException;
import models.User;
import service.DatabaseConnection;

public class UserDAOImp implements IUserDao {

	@Override
	public List<User> getUsers() {
		Connection con = null;
		List<User> users = new ArrayList<User>();
		try {
			con = DatabaseConnection.getConnection();
			PreparedStatement statement = con.prepareStatement("select * from User_1 ");
			ResultSet resultSet = statement.executeQuery();
			while (resultSet.next()) {
				int id = resultSet.getInt(1);
				String userName = resultSet.getNString(2);
				String password = resultSet.getNString(3);
				Date createDate = resultSet.getDate(4);
				int infoId = resultSet.getInt(5);
				String email = resultSet.getNString(6);
				Date updatedate = resultSet.getDate(7);
				users.add(new User(id, userName, password, email, createDate, infoId, updatedate));
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
			PreparedStatement statement = con.prepareStatement("select * from User_1 where user_id = ?");
			statement.setInt(1, userId);
			ResultSet resultSet = statement.executeQuery();
			while (resultSet.next()) {
				int id = resultSet.getInt(1);
				String userName = resultSet.getNString(2);
				String password = resultSet.getNString(3);
				Date date = resultSet.getDate(4);
				int infoId = resultSet.getInt(5);
				String email = resultSet.getNString(6);
				Date updatedate = resultSet.getDate(7);
				user = new User(id, userName, password, email, date, infoId, updatedate);
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
	public int saveUser(User user) throws SqlException, SQLException {
		// TODO Auto-generated method stub
		Connection con = null;
		int userId = 0;
		try {
			con = DatabaseConnection.getConnection();
			PreparedStatement preparedStatement = con.prepareStatement(
					"insert into User_1 (username,password,create_date,email,update_date) values(?,?,?,?,?) ",
					Statement.RETURN_GENERATED_KEYS);
			preparedStatement.setString(1, user.getUsername());
			preparedStatement.setString(2, user.getPassword());
			preparedStatement.setDate(3, user.getCreateDate());
			preparedStatement.setNString(4, user.getEmail());
			preparedStatement.setDate(5, new Date(System.currentTimeMillis()));
			preparedStatement.executeUpdate();

			ResultSet resultSet = preparedStatement.getGeneratedKeys();
			if (resultSet.next())
				userId = resultSet.getInt(1);
			preparedStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			throw new SqlException("user đã tồn tại");
		}finally {
			con.close();
		}
		return userId;
	}

	@Override
	public void deleteUser(User user) {
		Connection con = null;
		try {
			con = DatabaseConnection.getConnection();
			PreparedStatement preparedStatement = con.prepareStatement("delete from User_1 where user_id = ?");
			preparedStatement.setInt(1, user.getUserId());
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
			PreparedStatement preparedStatement = con
					.prepareStatement("update User_1 set password = ?, update_date = ?,info_id = ? where user_id = ?");
			preparedStatement.setNString(1, user.getPassword());
			preparedStatement.setDate(2, new Date(System.currentTimeMillis()));
			preparedStatement.setInt(3, user.getInfoId());
			preparedStatement.setInt(4, user.getUserId());
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
	public User findByUserName(String username) {
		User user = null;
		Connection con = null;
		try {
			con = DatabaseConnection.getConnection();
			PreparedStatement statement = con.prepareStatement("select * from User_1 where username = ?");
			statement.setString(1, username);
			ResultSet resultSet = statement.executeQuery();
			while (resultSet.next()) {
				int id = resultSet.getInt(1);
				String userName = resultSet.getNString(2);
				String password = resultSet.getNString(3);
				Date date = resultSet.getDate(4);
				int infoId = resultSet.getInt(5);
				String email = resultSet.getNString(6);
				Date updateDate = resultSet.getDate(7);
				user = new User(id, userName, password, email, date, infoId, updateDate);
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
}
