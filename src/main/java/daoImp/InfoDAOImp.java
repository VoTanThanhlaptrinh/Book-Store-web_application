package daoImp;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import daoInterface.IInfoDao;
import models.Information;
import service.DatabaseConnection;

public class InfoDAOImp implements IInfoDao {
	@Override
	public int saveInfor(Information info) {
		// TODO Auto-generated method stub
		Connection con = null;
		int infoId = 0;
		try {
			con = DatabaseConnection.getConnection();
			PreparedStatement preparedStatement = con.prepareStatement(
					"insert into Information (name,address,phone_number,cccd,birth,email,create_date, update_date) values(?,?,?,?,?,?,?,?)",
					PreparedStatement.RETURN_GENERATED_KEYS);
			preparedStatement.setNString(1, info.getName());
			preparedStatement.setNString(2, info.getAddress());
			preparedStatement.setNString(3, info.getPhoneNumber());
			preparedStatement.setNString(4, info.getCccd());
			preparedStatement.setDate(5, info.getBirth());
			preparedStatement.setNString(6, info.getEmail());
			preparedStatement.setDate(7, info.getCreateDate());
			preparedStatement.setDate(8, info.getUpdateDate());
			preparedStatement.executeUpdate();

			ResultSet re = preparedStatement.getGeneratedKeys();
			if (re.next()) {
				infoId = re.getInt(1);
			}
			re.close();
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
		return infoId;
	}

	@Override
	public void deleteInfor(Information info) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateInfor(Information info) {
		// TODO Auto-generated method stub
		Connection con = null;
		try {
			con = DatabaseConnection.getConnection();
			PreparedStatement preparedStatement = con.prepareStatement(
					"update Information set name = ?,address = ?,phone_number = ?,cccd = ?,birth = ?,email = ?, update_date = ? where info_id = ?");
			preparedStatement.setNString(1, info.getName());
			preparedStatement.setNString(2, info.getAddress());
			preparedStatement.setNString(3, info.getPhoneNumber());
			preparedStatement.setNString(4, info.getCccd());
			preparedStatement.setDate(5, info.getBirth());
			preparedStatement.setNString(6, info.getEmail());
			preparedStatement.setDate(7, new Date(System.currentTimeMillis()));
			preparedStatement.setInt(8, info.getInfoId());
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
	public Information findInfoByInfoId(int infoId) {
		Connection con = null;
		Information information = null;
		try {
			con = DatabaseConnection.getConnection();
			PreparedStatement statement = con.prepareStatement("select * from Information where info_id = ?");
			statement.setInt(1, infoId);
			ResultSet resultSet = statement.executeQuery();
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
						updateDate, imgId);
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
		return information;
	}

}
