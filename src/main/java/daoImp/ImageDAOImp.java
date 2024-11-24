package daoImp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

import models.Image;
import service.DatabaseConnection;
import daoInterface.IImageDao;

public class ImageDAOImp implements IImageDao {

	@Override
	public Image findByImageId(int imageId) {
		// TODO Auto-generated method stub
		Connection con = null;
		Image img = null;
		try {
			con = DatabaseConnection.getConnection();
			Statement statement = con.createStatement();
			ResultSet resultSet = statement.executeQuery("select * from Image where img_id = " + imageId);
			while (resultSet.next()) {
				int id = resultSet.getInt(1);
				String fileName = resultSet.getNString(2);
				String url = resultSet.getNString(3);
				String file_type = resultSet.getNString(4);
				String desciption = resultSet.getNString(5);
				Date createDate = resultSet.getDate(6);
				Date updateDate = resultSet.getDate(7);
				String objectType = resultSet.getString(8);
				img = new Image(id, fileName, url, file_type, desciption, createDate, updateDate, objectType);
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
		return img;
	}

	@Override
	public void updateImage(Image image) {
		// TODO Auto-generated method stub
		Connection con = null;
		try {
			con = DatabaseConnection.getConnection();
			PreparedStatement preparedStatement = con.prepareStatement(
					"update Image set file_name = ? ,file_type = ?,description = ?,update_date = ?, object_type = ?");
			preparedStatement.setNString(1, image.getFileName());
			preparedStatement.setNString(2, image.getFileType());
			preparedStatement.setNString(3, image.getDescription());
			preparedStatement.setDate(4, new java.sql.Date(System.currentTimeMillis()));
			preparedStatement.setNString(5, image.getObjectType());
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
	public void deleteImage(Image image) {
		// TODO Auto-generated method stub
		Connection con = null;
		try {
			con = DatabaseConnection.getConnection();
			PreparedStatement preparedStatement = con
					.prepareStatement("delete Image where img_id =" + image.getImgId());
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
	public int saveImageForProduct(Image image) {
		Connection con = null;
		int imageId = 0;
		try {
			con = DatabaseConnection.getConnection();
			PreparedStatement preparedStatement = con.prepareStatement(
					"insert into Image (file_name,url,file_type,description,create_date,update_date,object_type) values(?,?,?,?,?,?,?)");
			preparedStatement.setNString(1, image.getFileName());
			preparedStatement.setNString(2, image.getUrl());
			preparedStatement.setNString(3, image.getFileType());
			preparedStatement.setNString(4, image.getDescription());
			preparedStatement.setDate(5, new java.sql.Date(System.currentTimeMillis()));
			preparedStatement.setDate(6, new java.sql.Date(System.currentTimeMillis()));
			preparedStatement.setNString(7, "product");
			preparedStatement.executeUpdate();

			ResultSet re = preparedStatement.getGeneratedKeys();
			while (re.next()) {
				imageId = re.getInt(0);
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
		return imageId;
	}

	@Override
	public int saveImageForInfomation(Image image) {
		Connection con = null;
		int imageId = 0;
		try {
			con = DatabaseConnection.getConnection();
			PreparedStatement preparedStatement = con.prepareStatement(
					"insert into Image (file_name,url,file_type,description,create_date,update_date,object_type) values(?,?,?,?,?,?,?)");
			preparedStatement.setNString(1, image.getFileName());
			preparedStatement.setNString(2, image.getUrl());
			preparedStatement.setNString(3, image.getFileType());
			preparedStatement.setNString(4, image.getDescription());
			preparedStatement.setDate(5, new java.sql.Date(System.currentTimeMillis()));
			preparedStatement.setDate(6, new java.sql.Date(System.currentTimeMillis()));
			preparedStatement.setNString(7, "infomation");
			preparedStatement.executeUpdate();

			ResultSet re = preparedStatement.getGeneratedKeys();
			while (re.next()) {
				imageId = re.getInt(0);
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
		return imageId;
	}
}
