package daoImp;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import daoInterface.IInfoDao;
import models.Information;
import service.DatabaseConnection;

public class InfoDAOImp implements IInfoDao {
	@Override
	public int saveInfor(Information info) {
		// TODO Auto-generated method stub
		int infoId = 0;
		try (Connection con = DatabaseConnection.getConnection();
				PreparedStatement preparedStatement = con.prepareStatement(
						"insert into Information (name,phone_number,birth,email,create_date, update_date,img_id,user_id,gender) values(?,?,?,?,?,?,?,?,?)",
						Statement.RETURN_GENERATED_KEYS);) {

			preparedStatement.setNString(1, info.getName());
			preparedStatement.setNString(2, info.getPhoneNumber());
			preparedStatement.setDate(3, info.getBirth());
			preparedStatement.setNString(4, info.getEmail());
			preparedStatement.setDate(5, new Date(System.currentTimeMillis()));
			preparedStatement.setDate(6, new Date(System.currentTimeMillis()));
			preparedStatement.setInt(7, info.getImgId());
			preparedStatement.setInt(8, info.getUserId());
			preparedStatement.setNString(9, info.getGender());
			preparedStatement.executeUpdate();

			try (ResultSet re = preparedStatement.getGeneratedKeys();) {
				if (re.next()) {
					infoId = re.getInt(1);
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return infoId;
	}

	@Override
	public void deleteInfor(Information info) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateInfor(Information info) {
		// TODO Auto-generated method stub
		try (Connection con = DatabaseConnection.getConnection();
				PreparedStatement preparedStatement = con.prepareStatement(
						"update Information set name = ?,phone_number = ?,birth = ?,email = ?, update_date = ?, img_id = ?, gender= ? where info_id = ?");) {

			preparedStatement.setNString(1, info.getName());
			preparedStatement.setNString(2, info.getPhoneNumber());
			preparedStatement.setDate(3, info.getBirth());
			preparedStatement.setNString(4, info.getEmail());
			preparedStatement.setDate(5, new Date(System.currentTimeMillis()));
			preparedStatement.setInt(6, info.getImgId());
			preparedStatement.setNString(7, info.getGender());
			preparedStatement.setInt(8, info.getInfoId());
			
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public Information findInfoByInfoId(int infoId) {
		Information information = null;
		try (Connection con = DatabaseConnection.getConnection();
				PreparedStatement statement = con.prepareStatement("select * from Information where info_id = ?");) {
			statement.setInt(1, infoId);
			try (ResultSet resultSet = statement.executeQuery();) {
				if (resultSet.next()) {
					int id = resultSet.getInt(1);
					String name = resultSet.getNString(2);
					String phoneNumber = resultSet.getNString(3);
					Date birthDay = resultSet.getDate(4);
					String email = resultSet.getNString(5);
					Date createDate = resultSet.getDate(6);
					Date updateDate = resultSet.getDate(7);
					int imgId = resultSet.getInt(8);
					int userId = resultSet.getInt(9);
					String gender = resultSet.getNString(10);
					information = new Information(id, name, phoneNumber, birthDay, email, gender, createDate,
							updateDate, imgId, userId);
				}
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return information;
	}

	@Override
	public Information findInforByUserId(int userId) {
		Information information = null;
		try (Connection con = DatabaseConnection.getConnection();
				PreparedStatement statement = con.prepareStatement("select * from Information where user_id = ?");) {
			statement.setInt(1, userId);
			try (ResultSet resultSet = statement.executeQuery();) {
				if (resultSet.next()) {
					int id = resultSet.getInt(1);
					String name = resultSet.getNString(2);
					String phoneNumber = resultSet.getNString(3);
					Date birthDay = resultSet.getDate(4);
					String email = resultSet.getNString(5);
					Date createDate = resultSet.getDate(6);
					Date updateDate = resultSet.getDate(7);
					int imgId = resultSet.getInt(8);
					String gender = resultSet.getNString(10) == null ? "" : resultSet.getNString(10);
					information = new Information(id, name, phoneNumber, birthDay, email, gender, createDate,
							updateDate, imgId, userId);
				}
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return information;
	}

}
