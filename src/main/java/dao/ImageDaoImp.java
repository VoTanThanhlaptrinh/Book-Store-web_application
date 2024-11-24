package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

import models.Image;
import service.DatabaseConnection;
import service.IImageDao;

public class ImageDaoImp implements IImageDao {

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
				img = new Image(id, fileName, url, file_type, desciption, createDate, updateDate);
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
	public void saveImage(Image image) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateImage(Image image) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteImage(Image image) {
		// TODO Auto-generated method stub

	}

}
