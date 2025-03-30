package daoImp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import daoInterface.ISocialLoginDAO;
import models.SocialLogin;
import service.DatabaseConnection;

public class SocialLoginDAOImpl implements ISocialLoginDAO {

	@Override
	public void save(SocialLogin login) {
		// TODO Auto-generated method stub
		try (Connection con = DatabaseConnection.getConnection();
				PreparedStatement statement = con.prepareStatement("insert into SocialLogin values(?,?,?,?)")) {
			statement.setString(1, login.getId());
			statement.setInt(2, login.getUserId());
			statement.setString(3, login.getName());
			statement.setDate(4, login.getCreateAt());
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	@Override
	public boolean checkIdSocialLogin(String id) {
		// TODO Auto-generated method stub
		try (Connection con = DatabaseConnection.getConnection();
				PreparedStatement statement = con
						.prepareStatement("select 1 into SocialLogin where social_login_id = ?")) {
			statement.setString(1, id);
			try (ResultSet rs = statement.executeQuery();) {
				return rs.next();
			} catch (Exception e) {
				// TODO: handle exception
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return false;
	}
}
