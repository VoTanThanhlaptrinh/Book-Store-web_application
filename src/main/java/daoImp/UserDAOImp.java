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
import java.util.StringTokenizer;

import daoInterface.IUserDao;
import models.Resource;
import models.User;
import service.DatabaseConnection;

public class UserDAOImp implements IUserDao {
// sử dụng try-with-resource
	@Override
	public List<User> getUsers(int page, int pageSize) {
		List<User> users = new ArrayList<User>();
		int offset = pageSize * (page - 1);
		String sql = """
					SELECT
				    u.user_id,
				    u.username,
				    u.password,
				    u.create_date,
				    u.email,
				    u.update_date,
				    u.is_social_login,
				    u.status,
				    u.is_activate,
				    urls.urls,
				    urls.levels,
				    roles.roles
				FROM User_1 u
				LEFT JOIN (
				    SELECT u_r_p.user_id,
				           STRING_AGG(r.url, ',') AS urls,
				           STRING_AGG(p.level, ',') AS levels
				    FROM User_Resource_Permission u_r_p
				    JOIN Resource r ON u_r_p.resource_id = r.id
				    JOIN Permission p ON u_r_p.permission_id = p.id
				    GROUP BY u_r_p.user_id
				) urls ON u.user_id = urls.user_id
				LEFT JOIN (
				    SELECT r_u.user_id, STRING_AGG(role.content, ',') AS roles
				    FROM Role_User r_u
				    JOIN Role role ON r_u.role_id = role.role_id
				    GROUP BY r_u.user_id
				) roles ON u.user_id = roles.user_id
				ORDER BY u.user_id
				OFFSET ? ROWS FETCH NEXT ? ROWS ONLY;
								""";

		try (Connection con = DatabaseConnection.getConnection();
				PreparedStatement statement = con.prepareStatement(sql)) {
			statement.setInt(1, offset);
			statement.setInt(2, pageSize);
			try (ResultSet rs = statement.executeQuery()) {
				while (rs.next()) {
					int userId = rs.getInt(1);
					String username = rs.getNString(2);
					String password = rs.getNString(3);
					Date date = rs.getDate(4);
					String email = rs.getNString(5);
					Date updateDate = rs.getDate(6);
					User user = new User(userId, username, password, email, date, updateDate);
					user.setSocialLogin(rs.getBoolean(7));
					user.setStatus(rs.getNString(8));
					user.setActivate(rs.getBoolean(9));
					// xử lý cho resource
					String url = rs.getString(10);
					Set<Resource> resources = new HashSet<Resource>();
					if (url != null) {
						StringTokenizer levels = new StringTokenizer(rs.getString(11), ",");
						StringTokenizer urls = new StringTokenizer(url, ",");
						while (urls.hasMoreTokens()) {
							resources.add(new Resource(urls.nextToken(), Integer.valueOf(levels.nextToken().trim())));
						}
					}
					user.setResources(resources);
					// xử lý cho roles
					String role = rs.getString(12);
					Set<String> roleContents = new HashSet<String>();
					if (role != null) {
						StringTokenizer roles = new StringTokenizer(role, ",");
						while (roles.hasMoreTokens()) {
							roleContents.add(roles.nextToken());
						}
					}

					user.setRoles(roleContents);
					users.add(user);
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return users;
	}

	@Override
	public User findByUserId(int userId) {
		User user = null;
		String sql = """
					SELECT
				    u.user_id,
				    u.username,
				    u.password,
				    u.create_date,
				    u.email,
				    u.update_date,
				    u.is_social_login,
				    u.status,
				    u.is_activate,
				    urls.urls,
				    urls.levels,
				    roles.roles
				FROM User_1 u
				LEFT JOIN (
				    SELECT u_r_p.user_id,
				           STRING_AGG(r.url, ',') AS urls,
				           STRING_AGG(p.level, ',') AS levels
				    FROM User_Resource_Permission u_r_p
				    JOIN Resource r ON u_r_p.resource_id = r.id
				    JOIN Permission p ON u_r_p.permission_id = p.id
				    GROUP BY u_r_p.user_id
				) urls ON u.user_id = urls.user_id
				LEFT JOIN (
				    SELECT r_u.user_id, STRING_AGG(role.content, ',') AS roles
				    FROM Role_User r_u
				    JOIN Role role ON r_u.role_id = role.role_id
				    GROUP BY r_u.user_id
				) roles ON u.user_id = roles.user_id
				where u.user_id = ?
								""";

		try (Connection con = DatabaseConnection.getConnection();
				PreparedStatement statement = con.prepareStatement(sql);) {
			statement.setInt(1, userId);
			try (ResultSet rs = statement.executeQuery();) {
				if (rs.next()) {
					String username = rs.getNString(2);
					String password = rs.getNString(3);
					Date date = rs.getDate(4);
					String email = rs.getNString(5);
					Date updateDate = rs.getDate(6);
					user = new User(userId, username, password, email, date, updateDate);
					user.setSocialLogin(rs.getBoolean(7));
					user.setStatus(rs.getNString(8));
					user.setActivate(rs.getBoolean(9));
					// xử lý cho resource
					String url = rs.getString(10);
					Set<Resource> resources = new HashSet<Resource>();
					if (url != null) {
						StringTokenizer levels = new StringTokenizer(rs.getString(11), ",");
						StringTokenizer urls = new StringTokenizer(url, ",");
						while (urls.hasMoreTokens()) {
							resources.add(new Resource(urls.nextToken(), Integer.valueOf(levels.nextToken().trim())));
						}
					}
					user.setResources(resources);
					// xử lý cho roles
					String role = rs.getString(12);
					Set<String> roleContents = new HashSet<String>();
					if (role != null) {
						StringTokenizer roles = new StringTokenizer(role, ",");
						while (roles.hasMoreTokens()) {
							roleContents.add(roles.nextToken());
						}
					}

					user.setRoles(roleContents);
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

	public int saveUser(User user) {

		// TODO Auto-generated method stub
		int userId = 0;
		Connection con = null;
		try {
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
					PreparedStatement preStatement = con
							.prepareStatement("insert into Role_User(role_id,user_id) values(2,?)")) {
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
		} finally {
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
		String sql = """
					SELECT
				    u.user_id,
				    u.username,
				    u.password,
				    u.create_date,
				    u.email,
				    u.update_date,
				    u.is_social_login,
				    u.status,
				    u.is_activate,
				    urls.urls,
				    urls.levels,
				    roles.roles
				FROM User_1 u
				LEFT JOIN (
				    SELECT u_r_p.user_id,
				           STRING_AGG(r.url, ',') AS urls,
				           STRING_AGG(p.level, ',') AS levels
				    FROM User_Resource_Permission u_r_p
				    JOIN Resource r ON u_r_p.resource_id = r.id
				    JOIN Permission p ON u_r_p.permission_id = p.id
				    GROUP BY u_r_p.user_id
				) urls ON u.user_id = urls.user_id
				LEFT JOIN (
				    SELECT r_u.user_id, STRING_AGG(role.content, ',') AS roles
				    FROM Role_User r_u
				    JOIN Role role ON r_u.role_id = role.role_id
				    GROUP BY r_u.user_id
				) roles ON u.user_id = roles.user_id
				where u.username = ?
								""";
		try (Connection con = DatabaseConnection.getConnection();
				PreparedStatement statement = con.prepareStatement(sql);) {
			statement.setNString(1, username);
			try (ResultSet rs = statement.executeQuery();) {
				if (rs.next()) {
					int userId = rs.getInt(1);
					String password = rs.getNString(3);
					Date date = rs.getDate(4);
					String email = rs.getNString(5);
					Date updateDate = rs.getDate(6);
					user = new User(userId, username, password, email, date, updateDate);
					user.setSocialLogin(rs.getBoolean(7));
					user.setStatus(rs.getNString(8));
					user.setActivate(rs.getBoolean(9));
					// xử lý cho resource
					String url = rs.getString(10);
					Set<Resource> resources = new HashSet<Resource>();
					if (url != null) {
						StringTokenizer levels = new StringTokenizer(rs.getString(11), ",");
						StringTokenizer urls = new StringTokenizer(url, ",");
						while (urls.hasMoreTokens()) {
							resources.add(new Resource(urls.nextToken(), Integer.valueOf(levels.nextToken().trim())));
						}
					}
					user.setResources(resources);
					// xử lý cho roles
					String role = rs.getString(12);
					Set<String> roleContents = new HashSet<String>();
					if (role != null) {
						StringTokenizer roles = new StringTokenizer(role, ",");
						while (roles.hasMoreTokens()) {
							roleContents.add(roles.nextToken());
						}
					}

					user.setRoles(roleContents);
					user.setResources(resources);
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
		String sql = """
					SELECT
				    u.user_id,
				    u.username,
				    u.password,
				    u.create_date,
				    u.email,
				    u.update_date,
				    u.is_social_login,
				    u.status,
				    u.is_activate,
				    urls.urls,
				    urls.levels,
				    roles.roles
				FROM User_1 u
				LEFT JOIN (
				    SELECT u_r_p.user_id,
				           STRING_AGG(r.url, ',') AS urls,
				           STRING_AGG(p.level, ',') AS levels
				    FROM User_Resource_Permission u_r_p
				    JOIN Resource r ON u_r_p.resource_id = r.id
				    JOIN Permission p ON u_r_p.permission_id = p.id
				    GROUP BY u_r_p.user_id
				) urls ON u.user_id = urls.user_id
				LEFT JOIN (
				    SELECT r_u.user_id, STRING_AGG(role.content, ',') AS roles
				    FROM Role_User r_u
				    JOIN Role role ON r_u.role_id = role.role_id
				    GROUP BY r_u.user_id
				) roles ON u.user_id = roles.user_id
				where u.email = ?
								""";

		try (Connection con = DatabaseConnection.getConnection();
				PreparedStatement statement = con.prepareStatement(sql);) {
			statement.setNString(1, email);
			try (ResultSet rs = statement.executeQuery();) {
				if (rs.next()) {
					int userId = rs.getInt(1);
					String username = rs.getNString(2);
					String password = rs.getNString(3);
					Date date = rs.getDate(4);

					Date updateDate = rs.getDate(6);
					user = new User(userId, username, password, email, date, updateDate);
					user.setSocialLogin(rs.getBoolean(7));
					user.setStatus(rs.getNString(8));
					user.setActivate(rs.getBoolean(9));
					// xử lý cho resource
					String url = rs.getString(10);
					Set<Resource> resources = new HashSet<Resource>();
					if (url != null) {
						StringTokenizer levels = new StringTokenizer(rs.getString(11), ",");
						StringTokenizer urls = new StringTokenizer(url, ",");
						while (urls.hasMoreTokens()) {
							resources.add(new Resource(urls.nextToken(), Integer.valueOf(levels.nextToken().trim())));
						}
					}
					user.setResources(resources);
					// xử lý cho roles
					String role = rs.getString(12);
					Set<String> roleContents = new HashSet<String>();
					if (role != null) {
						StringTokenizer roles = new StringTokenizer(role, ",");
						while (roles.hasMoreTokens()) {
							roleContents.add(roles.nextToken());
						}
					}

					user.setRoles(roleContents);
					user.setResources(resources);
				}
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

	@Override
	public int getTotalUsers() {
		int total = 0;
		try (Connection con = DatabaseConnection.getConnection();
				PreparedStatement preparedStatement = con.prepareStatement("select count(user_id) from User_1");) {
			ResultSet rs = preparedStatement.executeQuery();
			if (rs.next())
				total = rs.getInt(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return total;
	}

	@Override
	public List<Integer> getListImgIds(List<User> users) {
		List<Integer> imgIds = new ArrayList<Integer>();
		StringBuilder sql = new StringBuilder("""
				    SELECT info.img_id
				    FROM User_1 u
				    left join Information info on u.user_id = info.user_id
				    WHERE u.user_id in
				""");

		sql.append("(");
		for (int i = 0; i < users.size() - 1; i++) {
			sql.append("?,");
		}
		sql.append("?)");

		try (Connection con = DatabaseConnection.getConnection();
				PreparedStatement statement = con.prepareStatement(sql.toString());) {
			int i = 0;
			for (User user : users) {
				statement.setInt(++i, user.getUserId());
			}

			try (ResultSet resultSet = statement.executeQuery();) {
				while (resultSet.next()) {
					int imgId = resultSet.getInt(1);
					if (imgId == 0)
						imgIds.add(37);
					else
						imgIds.add(imgId);
				}
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return imgIds;
	}
}
