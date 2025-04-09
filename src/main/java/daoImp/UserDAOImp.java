package daoImp;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import daoInterface.IUserDao;
import models.User;
import service.DatabaseConnection;

public class UserDAOImp implements IUserDao {
// sử dụng try-with-resource
	@Override
	public List<User> getUsers() {
		List<User> users = new ArrayList<>();
		try (Connection con = DatabaseConnection.getConnection();
				PreparedStatement statement = con.prepareStatement("select * from User_1 ");
				ResultSet resultSet = statement.executeQuery();) {
			while (resultSet.next()) {
				int id = resultSet.getInt(1);
				String userName = resultSet.getNString(2);
				String password = resultSet.getNString(3);
				Date createDate = resultSet.getDate(4);
				String email = resultSet.getNString(5);
				Date updatedate = resultSet.getDate(6);
				users.add(new User(id, userName, password, email, createDate, updatedate));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return users;
	}

	@Override
	public User findByUserId(int userId) {
		User user = null;
		try (Connection con = DatabaseConnection.getConnection();
				PreparedStatement statement = con.prepareStatement("select * from User_1 where user_id = ?");) {

			statement.setInt(1, userId);
			try (ResultSet resultSet = statement.executeQuery();) {
				while (resultSet.next()) {
					String username = resultSet.getNString(2);
					String password = resultSet.getNString(3);
					Date date = resultSet.getDate(4);
					String email = resultSet.getNString(5);
					Date updateDate = resultSet.getDate(6);
					user = new User(userId, username, password, email, date, updateDate);
					user.setSocialLogin(resultSet.getBoolean(7));
					user.setStatus(resultSet.getNString(8));
					user.setActivate(resultSet.getBoolean(9));
					user.setRoles(getRolesByUserId(userId));
				}
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			statement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}

	public int saveUser(User user) {

		// TODO Auto-generated method stub
		int userId = 0;
		try (Connection con = DatabaseConnection.getConnection();
				PreparedStatement preparedStatement = con.prepareStatement(
						"insert into User_1 (username,password,create_date,email,update_date,is_social_login,status,is_activate) values(?,?,?,?,?,?,?,?,?) ",
						Statement.RETURN_GENERATED_KEYS);) {
			preparedStatement.setString(1, user.getUsername());
			preparedStatement.setString(2, user.getPassword());
			preparedStatement.setDate(3, user.getCreateDate());
			preparedStatement.setNString(4, user.getEmail());
			preparedStatement.setDate(5, user.getUpdateDate());
			preparedStatement.setBoolean(6, user.isSocialLogin());
			preparedStatement.setNString(7, user.getStatus());
			preparedStatement.setBoolean(8, user.isActivate());
			preparedStatement.executeUpdate();
			try (ResultSet resultSet = preparedStatement.getGeneratedKeys();
				PreparedStatement preStatement = con.prepareStatement("insert into Role_User(role_id,user_id) values(2,?)")) {
				if (resultSet.next()) {
					userId = resultSet.getInt(1);
					preStatement.setInt(1, userId);
					preStatement.executeUpdate();
				}
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return userId;
	}

	@Override
	public void deleteUser(User user) {
		try (Connection con = DatabaseConnection.getConnection();
				PreparedStatement preparedStatement = con.prepareStatement("delete from User_1 where user_id = ?");) {
			preparedStatement.setInt(1, user.getUserId());
			preparedStatement.executeUpdate();
			preparedStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public void updateUser(User user) {
		// TODO Auto-generated method stub
		try (Connection con = DatabaseConnection.getConnection();
				PreparedStatement preparedStatement = con
						.prepareStatement("update User_1 set password = ?, update_date = ?where user_id = ?");) {
			preparedStatement.setNString(1, user.getPassword());
			preparedStatement.setDate(2, new Date(System.currentTimeMillis()));
			preparedStatement.setInt(3, user.getUserId());
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public User findByUserName(String username) {
		User user = null;
		try (Connection con = DatabaseConnection.getConnection();
				PreparedStatement statement = con.prepareStatement("select * from User_1 where username = ?");) {
			statement.setString(1, username);
			try (ResultSet resultSet = statement.executeQuery();) {
				if (resultSet.next()) {
					int id = resultSet.getInt(1);
					String password = resultSet.getNString(3);
					Date date = resultSet.getDate(4);
					String email = resultSet.getNString(5);
					Date updateDate = resultSet.getDate(6);
					user = new User(id, username, password, email, date, updateDate);
					user.setSocialLogin(resultSet.getBoolean(7));
					user.setStatus(resultSet.getNString(8));
					user.setActivate(resultSet.getBoolean(9));
					user.setRoles(getRolesByUserId(id));
				}
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}

	public Set<String> getRolesByUserId(int userId) {
		Set<String> roles = new HashSet<String>();
		String sql = "select r.content from Role r join Role_User ru on r.role_id = ru.role_id where ru.user_id = ?";
		try (Connection con = DatabaseConnection.getConnection();
				PreparedStatement preparedStatement = con.prepareStatement(sql)) {
			preparedStatement.setInt(1, userId);
			try (ResultSet rs = preparedStatement.executeQuery()) {
				while (rs.next()) {
					roles.add(rs.getNString(1));
				}
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return roles;
	}

	@Override
	public boolean checkEmail(String email) {
		boolean b = false;
		try (Connection con = DatabaseConnection.getConnection();
				PreparedStatement statement = con.prepareStatement("select * from User_1 where email = ?");) {
			statement.setString(1, email);
			try (ResultSet resultSet = statement.executeQuery();) {
				b = resultSet.next();
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return b;
	}

	@Override
	public User getUserByMail(String email) {
		User user = null;
		try (Connection con = DatabaseConnection.getConnection();
				PreparedStatement statement = con.prepareStatement("select * from User_1 where email = ?");) {
			statement.setString(1, email);
			try (ResultSet resultSet = statement.executeQuery();) {
				if (resultSet.next()) {
					int id = resultSet.getInt(1);
					String username = resultSet.getNString(2);
					String password = resultSet.getNString(3);
					Date date = resultSet.getDate(4);
					Date updateDate = resultSet.getDate(6);
					user = new User(id, username, password, email, date, updateDate);
					user.setSocialLogin(resultSet.getBoolean(7));
					user.setStatus(resultSet.getNString(8));
					user.setActivate(resultSet.getBoolean(9));
					user.setRoles(getRolesByUserId(id));
				}
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}

	@Override
	public void activateUser(User user) {
		// TODO Auto-generated method stub
		try (Connection con = DatabaseConnection.getConnection();
				PreparedStatement preparedStatement = con
						.prepareStatement("update User_1 set is_activate = ?, update_date = ? where user_id = ?");) {
			preparedStatement.setBoolean(1, user.isActivate());
			preparedStatement.setDate(2, new Date(System.currentTimeMillis()));
			preparedStatement.setInt(3, user.getUserId());
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
