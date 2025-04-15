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
	public void grantPermissions(int userId, Set<Resource> toAdd) {
		String sqlPermission = "SELECT level, id FROM Permission";
		String sqlInsert = """
				INSERT INTO User_Resource_Permission 
				(user_id, resource_id, permission_id) 
				SELECT ?, r.id, ? FROM Resource r WHERE r.url = ?
				""";

		try (Connection conn = DatabaseConnection.getConnection()) {
			// Disable auto-commit for batch processing
			conn.setAutoCommit(false);

			// Lấy tất cả các permission_id trong một truy vấn
			Map<Integer, Integer> permissionMap = new HashMap<>();
			try (PreparedStatement stmtPermission = conn.prepareStatement(sqlPermission)) {
				stmtPermission.setInt(1, 1); // READ
				stmtPermission.setInt(2, 2); // WRITE
				stmtPermission.setInt(3, 4); // EXECUTE

				try (ResultSet rs = stmtPermission.executeQuery()) {
					while (rs.next()) {
						int level = rs.getInt("level");
						int permissionId = rs.getInt("id");
						permissionMap.put(level, permissionId);
					}
				}
			}

			// Chèn dữ liệu vào bảng User_Resource_Permission
			try (PreparedStatement stmtInsert = conn.prepareStatement(sqlInsert)) {
				for (Resource resource : toAdd) {
					int permissionId = permissionMap.get(resource.getPermission()); // Lấy permission_id từ Map
					stmtInsert.setInt(1, userId); // user_id
					stmtInsert.setInt(2, permissionId); // permission_id
					stmtInsert.setString(3, resource.getUrl()); // url
					stmtInsert.addBatch(); // Thêm vào batch
				}

				// Thực hiện batch insert
				stmtInsert.executeBatch();

				// Commit giao dịch
				conn.commit();
			} catch (SQLException e) {
				e.printStackTrace();
				// Nếu có lỗi, rollback
				try {
					conn.rollback();
				} catch (SQLException rollbackEx) {
					rollbackEx.printStackTrace();
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void revokePermissions(int userId, Set<Resource> toRemove) {
		String sqlPermission = "SELECT level, id FROM Permission";
		String sqlInsert = """
				DELETE FROM User_Resource_Permission
				WHERE user_id = ? AND resource_id = (SELECT id FROM Resource WHERE url = ?) AND permission_id = ?
				""";

		try (Connection conn = DatabaseConnection.getConnection()) {
			// Disable auto-commit for batch processing
			conn.setAutoCommit(false);

			// Lấy tất cả các permission_id trong một truy vấn
			Map<Integer, Integer> permissionMap = new HashMap<>();
			try (PreparedStatement stmtPermission = conn.prepareStatement(sqlPermission)) {
				stmtPermission.setInt(1, 1); // READ
				stmtPermission.setInt(2, 2); // WRITE
				stmtPermission.setInt(3, 4); // EXECUTE

				try (ResultSet rs = stmtPermission.executeQuery()) {
					while (rs.next()) {
						int level = rs.getInt("level");
						int permissionId = rs.getInt("id");
						permissionMap.put(level, permissionId);
					}
				}
			}

			// Chèn dữ liệu vào bảng User_Resource_Permission
			try (PreparedStatement stmtInsert = conn.prepareStatement(sqlInsert)) {
				for (Resource resource : toRemove) {
					int permissionId = permissionMap.get(resource.getPermission()); // Lấy permission_id từ Map
					stmtInsert.setInt(1, userId); // user_id
					stmtInsert.setInt(2, permissionId); // permission_id
					stmtInsert.setString(3, resource.getUrl()); // url
					stmtInsert.addBatch(); // Thêm vào batch
				}

				// Thực hiện batch insert
				stmtInsert.executeBatch();

				// Commit giao dịch
				conn.commit();
			} catch (SQLException e) {
				e.printStackTrace();
				// Nếu có lỗi, rollback
				try {
					conn.rollback();
				} catch (SQLException rollbackEx) {
					rollbackEx.printStackTrace();
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
