package daoImp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import daoInterface.IResourceDao;
import models.Resource;
import service.DatabaseConnection;

public class ResourceDAOImpl implements IResourceDao {

	@Override
	public List<Resource> getListResources() {
		List<Resource> resources = new ArrayList<Resource>();
		String sql = "select * from Resource";
		try (Connection con = DatabaseConnection.getConnection();
				PreparedStatement statement = con.prepareStatement(sql)) {
			try (ResultSet rs = statement.executeQuery()) {
				while (rs.next()) {
					String url = rs.getString(2);
					String resourceName = rs.getNString(3);
					resources.add(new Resource(url, resourceName));
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resources;
	}

	@Override
	public void grantPermissionAndUpdateRole(int userId, Set<Resource> toAdd, Set<Resource> toRemove, int allow) {
		// TODO Auto-generated method stub
		Map<Integer, Integer> permissionMap = null;
		try (Connection con = DatabaseConnection.getConnection()) {
			con.setAutoCommit(false);
			// lấy hết tất cả permission bên trong db
			permissionMap = queryPermissionInDB(con);
			// insert những quyền mới
			if (toAdd.size() > 0) {
				insertNewResource(con, toAdd, permissionMap, userId);
			}
			// xoá quyền
			if (toRemove.size() > 0) {
				deleteResource(con, toRemove, permissionMap, userId);
			}
			// cấp role admin cho user
			if (allow == 1) {
				grantRoleAdmin(con, userId);
			}
			// xoá role admin của user
			if (allow == -1) {
				deleteRoleAdmin(con, userId);
			}
			con.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private Map<Integer, Integer> queryPermissionInDB(Connection con) throws SQLException {
		String sqlPermission = "SELECT level, id FROM Permission";
		Map<Integer, Integer> permissionMap = new HashMap<>();
		try (PreparedStatement preparedStatement = con.prepareStatement(sqlPermission)) {

			try (ResultSet rs = preparedStatement.executeQuery()) {
				while (rs.next()) {
					int level = rs.getInt("level");
					int permissionId = rs.getInt("id");
					permissionMap.put(level, permissionId);
				}
			} catch (Exception e) {
				e.printStackTrace();
				con.rollback();
			}

		} catch (Exception e) {
			e.printStackTrace();
			con.rollback();
		}
		return permissionMap;
	}

	private void insertNewResource(Connection con, Set<Resource> toAdd, Map<Integer, Integer> permissionMap, int userId)
			throws SQLException {
		String sqlInsert = """
				INSERT INTO User_Resource_Permission
				(user_id, resource_id, permission_id)
				SELECT ?, r.id, ? FROM Resource r WHERE r.url = ?
				""";
		try (PreparedStatement stmtDelete = con.prepareStatement(sqlInsert)) {
			for (Resource resource : toAdd) {
				int permissionId = permissionMap.get(resource.getPermission()); // Lấy permission_id từ Map
				stmtDelete.setInt(1, userId); // user_id
				stmtDelete.setInt(2, permissionId); // permission_id
				stmtDelete.setString(3, resource.getUrl()); // url
				stmtDelete.addBatch(); // Thêm vào batch
			}

			// Thực hiện batch insert
			stmtDelete.executeBatch();
		} catch (Exception e) {
			e.printStackTrace();
			con.rollback();
		}
	}

	private void deleteResource(Connection con, Set<Resource> toRemove, Map<Integer, Integer> permissionMap, int userId)
			throws SQLException {
		String sqlDelete = """
				DELETE FROM User_Resource_Permission
				WHERE user_id = ? AND resource_id = (SELECT id FROM Resource WHERE url = ?) AND permission_id = ?
				""";
		try (PreparedStatement stmtDelete = con.prepareStatement(sqlDelete)) {
			for (Resource resource : toRemove) {
				int permissionId = permissionMap.get(resource.getPermission()); // Lấy permission_id từ Map
				stmtDelete.setInt(1, userId); // user_id
				stmtDelete.setInt(3, permissionId); // permission_id
				stmtDelete.setString(2, resource.getUrl()); // url
				stmtDelete.addBatch(); // Thêm vào batch
			}
			// Thực hiện batch delete
			stmtDelete.executeBatch();
		} catch (SQLException e) {
			e.printStackTrace();
			con.rollback();
		}
	}

	private void grantRoleAdmin(Connection con, int userId) throws SQLException {
		String sql = """
				insert into Role_User values (3,?)
				""";
		try (PreparedStatement ps = con.prepareStatement(sql)) {
			ps.setInt(1, userId);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			con.rollback();
		}
	}
	private void deleteRoleAdmin(Connection con, int userId) throws SQLException {
		String sql = """
				delete Role_User where role_id = 3 and user_id = ?
				""";
		try (PreparedStatement ps = con.prepareStatement(sql)) {
			ps.setInt(1, userId);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			con.rollback();
		}
	}
}
