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
import models.Resource;
import models.User;
import service.DatabaseConnection;

public class UserDAOImp implements IUserDao {
// sử dụng try-with-resource
	@Override
	public List<User> getUsers() {
		List<User> users = new ArrayList<>();
		try (Connection con = DatabaseConnection.getConnection();
				PreparedStatement statement = con.prepareStatement("select * from User_1");
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
		Set<String> roles = new HashSet<>();
		Set<Resource> resources = new HashSet<>();
		try (Connection con = DatabaseConnection.getConnection();
				PreparedStatement statement = con.prepareStatement("select u.*,r.url,p.level,role.content from User_1 u"
						+ " left join User_Resource_Permission u_r_p on u.user_id = u_r_p.user_id"
						+ " left join Resource r on u_r_p.resource_id = r.id"
						+ " left join Permission p on u_r_p.permission_id = p.id"
						+ " left join Role_User r_u on r_u.user_id = u.user_id"
						+ " left join Role role on role.role_id = r_u.role_id"
						+ " where u.user_id = ?")) {
			statement.setInt(1, userId);
			try (ResultSet resultSet = statement.executeQuery();) {
				while (resultSet.next()) {
					if(user == null) {
						String username = resultSet.getNString(2);
						String password = resultSet.getNString(3);
						Date date = resultSet.getDate(4);
						String email = resultSet.getNString(5);
						Date updateDate = resultSet.getDate(6);
						user = new User(userId, username, password, email, date, updateDate);
						user.setSocialLogin(resultSet.getBoolean(7));
						user.setStatus(resultSet.getNString(8));
						user.setActivate(resultSet.getBoolean(9));
					}
					resources.add(new Resource(resultSet.getString(10), resultSet.getInt(11)));
					roles.add(resultSet.getString(12));
				}
				user.setRoles(roles);
				user.setResources(resources);
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

	public int saveUser(User user) {

		// TODO Auto-generated method stub
		int userId = 0;
		Connection con = null;
		try  {
			con = DatabaseConnection.getConnection();
			PreparedStatement preparedStatement = con.prepareStatement(
					"insert into User_1 (username,password,create_date,email,update_date,is_social_login,status,is_activate) values(?,?,?,?,?,?,?,?,?) ",
					Statement.RETURN_GENERATED_KEYS);
			con.setAutoCommit(false);
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
				con.commit();
			} catch (Exception e) {
				// TODO: handle exception
				con.rollback();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
		    if (con != null) {
		        try {
		            con.rollback(); // Rollback nếu có lỗi
		        } catch (SQLException rollbackEx) {
		            rollbackEx.printStackTrace();
		        }
		    }
		    e.printStackTrace();
		}finally {
			if (con != null) {
		        try {
		            con.setAutoCommit(true); // Trả lại trạng thái mặc định
		            con.close(); // Đóng connection
		        } catch (SQLException closeEx) {
		            closeEx.printStackTrace();
		        }
		    }
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
		Set<String> roles = new HashSet<>();
		Set<Resource> resources = new HashSet<>();
		try (Connection con = DatabaseConnection.getConnection();
				PreparedStatement statement = con.prepareStatement("select u.*,r.url,p.level,role.content from User_1 u"
						+ " left join User_Resource_Permission u_r_p on u.user_id = u_r_p.user_id"
						+ " left join Resource r on u_r_p.resource_id = r.id"
						+ " left join Permission p on u_r_p.permission_id = p.id"
						+ " left join Role_User r_u on r_u.user_id = u.user_id"
						+ " left join Role role on role.role_id = r_u.role_id"
						+ " where u.username = ?")) {
			statement.setNString(1, username);
			try (ResultSet resultSet = statement.executeQuery();) {
				while (resultSet.next()) {
					if(user == null) {
						int userId = resultSet.getInt(1);
						String password = resultSet.getNString(3);
						Date date = resultSet.getDate(4);
						String email = resultSet.getNString(5);
						Date updateDate = resultSet.getDate(6);
						user = new User(userId, username, password, email, date, updateDate);
						user.setSocialLogin(resultSet.getBoolean(7));
						user.setStatus(resultSet.getNString(8));
						user.setActivate(resultSet.getBoolean(9));
					}
					
					resources.add(new Resource(resultSet.getString(10), resultSet.getInt(11)));
					roles.add(resultSet.getString(12));
					
				}
				user.setRoles(roles);
				user.setResources(resources);
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
	public boolean checkEmail(String email) {
		boolean b = false;
		try (Connection con = DatabaseConnection.getConnection();
				PreparedStatement statement = con.prepareStatement("select TOP 1 * from User_1 where email = ?");) {
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
		Set<String> roles = new HashSet<>();
		Set<Resource> resources = new HashSet<>();
		try (Connection con = DatabaseConnection.getConnection();
				PreparedStatement statement = con.prepareStatement("select u.*,r.url,p.level,role.content from User_1 u"
						+ " left join User_Resource_Permission u_r_p on u.user_id = u_r_p.user_id"
						+ " left join Resource r on u_r_p.resource_id = r.id"
						+ " left join Permission p on u_r_p.permission_id = p.id"
						+ " left join Role_User r_u on r_u.user_id = u.user_id"
						+ " left join Role role on role.role_id = r_u.role_id"
						+ " where u.email = ?")) {
			statement.setNString(1, email);
			try (ResultSet resultSet = statement.executeQuery();) {
				while (resultSet.next()) {
					if(user == null) {
						int userId = resultSet.getInt(1);
						String username = resultSet.getNString(2);
						String password = resultSet.getNString(3);
						Date date = resultSet.getDate(4);
						Date updateDate = resultSet.getDate(6);
						user = new User(userId, username, password, email, date, updateDate);
						user.setSocialLogin(resultSet.getBoolean(7));
						user.setStatus(resultSet.getNString(8));
						user.setActivate(resultSet.getBoolean(9));
					}
					resources.add(new Resource(resultSet.getString(10), resultSet.getInt(11)));
					roles.add(resultSet.getString(12));
				}
				user.setRoles(roles);
				user.setResources(resources);
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
