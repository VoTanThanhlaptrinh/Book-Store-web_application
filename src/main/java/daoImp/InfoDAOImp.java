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
						"insert into Information (name,address,phone_number,cccd,birth,email,create_date, update_date,img_id,user_id) values(?,?,?,?,?,?,?,?,?,?)",
						Statement.RETURN_GENERATED_KEYS);) {

			preparedStatement.setNString(1, info.getName());
			preparedStatement.setNString(2, info.getAddress());
			preparedStatement.setNString(3, info.getPhoneNumber());
			preparedStatement.setNString(4, info.getCccd());
			preparedStatement.setDate(5, info.getBirth());
			preparedStatement.setNString(6, info.getEmail());
			preparedStatement.setDate(7, new Date(System.currentTimeMillis()));
			preparedStatement.setDate(8, new Date(System.currentTimeMillis()));
			preparedStatement.setInt(9, info.getImgId());
			preparedStatement.setInt(10, info.getUserId());
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
						"update Information set name = ?,address = ?,phone_number = ?,cccd = ?,birth = ?,email = ?, update_date = ?, img_id = ? where info_id = ?");) {

			preparedStatement.setNString(1, info.getName());
			preparedStatement.setNString(2, info.getAddress());
			preparedStatement.setNString(3, info.getPhoneNumber());
			preparedStatement.setNString(4, info.getCccd());
			preparedStatement.setDate(5, info.getBirth());
			preparedStatement.setNString(6, info.getEmail());
			preparedStatement.setDate(7, new Date(System.currentTimeMillis()));
			preparedStatement.setInt(8, info.getImgId());
			preparedStatement.setInt(9, info.getInfoId());
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public Information findInfoByInfoId(int infoId) {
		Information information = null;
		try(Connection con = DatabaseConnection.getConnection();
			PreparedStatement statement = con.prepareStatement("select * from Information where info_id = ?");) {
			statement.setInt(1, infoId);
			try(ResultSet resultSet = statement.executeQuery();) {
				if (resultSet.next()) {
					int id = resultSet.getInt(1);
					String name = resultSet.getNString(2);
					String address = resultSet.getNString(3);
					String phoneNumber = resultSet.getNString(4);
					String cccd = resultSet.getString(5);
					Date birthDay = resultSet.getDate(6);
					String email = resultSet.getNString(7);
					Date createDate = resultSet.getDate(8);
					Date updateDate = resultSet.getDate(9);
					int imgId = resultSet.getInt(10);
					int userId = resultSet.getInt(11);
					information = new Information(id, name, address, phoneNumber, cccd, birthDay, email, createDate,
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
		try(Connection con = DatabaseConnection.getConnection();
			PreparedStatement statement = con.prepareStatement("select * from Information where user_id = ?");) {
			statement.setInt(1, userId);
			try(ResultSet resultSet = statement.executeQuery();) {
				if (resultSet.next()) {
					int id = resultSet.getInt(1);
					String name = resultSet.getNString(2);
					String address = resultSet.getNString(3);
					String phoneNumber = resultSet.getNString(4);
					String cccd = resultSet.getString(5);
					Date birthDay = resultSet.getDate(6);
					String email = resultSet.getNString(7);
					Date createDate = resultSet.getDate(8);
					Date updateDate = resultSet.getDate(9);
					int imgId = resultSet.getInt(10);
					information = new Information(id, name, address, phoneNumber, cccd, birthDay, email, createDate,
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
