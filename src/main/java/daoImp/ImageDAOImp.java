package daoImp;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import daoInterface.IImageDao;
import models.Image;
import service.DatabaseConnection;

public class ImageDAOImp implements IImageDao {

	@Override
	public Image findByImageId(int imageId) {
		// TODO Auto-generated method stub
		Image img = null;
		try (Connection con = DatabaseConnection.getConnection();
				PreparedStatement statement = con.prepareStatement("select * from Image where img_id = ?");) {

			statement.setInt(1, imageId);
			try (ResultSet resultSet = statement.executeQuery();) {
				while (resultSet.next()) {
					int id = resultSet.getInt(1);
					String fileName = resultSet.getNString(2);
					String file_type = resultSet.getNString(3);
					String desciption = resultSet.getNString(4);
					Date createDate = resultSet.getDate(5);
					Date updateDate = resultSet.getDate(6);
					byte[] data = resultSet.getBytes(7);
					img = new Image(id, fileName, file_type, desciption, createDate, updateDate, data);
				}
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return img;
	}

	@Override
	public void updateImage(Image image) {
		// TODO Auto-generated method stub
		try (Connection con = DatabaseConnection.getConnection();
				PreparedStatement preparedStatement = con.prepareStatement(
						"update Image set file_name = ? ,file_type = ?,description = ?,update_date = ?, data = ? where img_id = ?");) {

			preparedStatement.setNString(1, image.getFileName());
			preparedStatement.setNString(2, image.getFileType());
			preparedStatement.setNString(3, image.getDescription());
			preparedStatement.setDate(4, new Date(System.currentTimeMillis()));
			preparedStatement.setBytes(5, image.getData());
			preparedStatement.setInt(6, image.getImgId());
			preparedStatement.executeUpdate();
			preparedStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public void deleteImage(Image image) {
		// TODO Auto-generated method stub
		try (Connection con = DatabaseConnection.getConnection();
				PreparedStatement preparedStatement = con.prepareStatement("delete Image where img_id = ?");) {

			preparedStatement.setInt(1, image.getImgId());
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public int saveImageForProduct(Image image) {
		int imageId = 0;
		try (Connection con = DatabaseConnection.getConnection();
				PreparedStatement preparedStatement = con.prepareStatement(
						"insert into Image (file_name,file_type,description,create_date,update_date,data) values(?,?,?,?,?,?)",
						Statement.RETURN_GENERATED_KEYS);) {

			preparedStatement.setNString(1, image.getFileName());
			preparedStatement.setNString(2, image.getFileType());
			preparedStatement.setNString(3, image.getDescription());
			preparedStatement.setDate(4, new java.sql.Date(System.currentTimeMillis()));
			preparedStatement.setDate(5, new java.sql.Date(System.currentTimeMillis()));
			preparedStatement.setBytes(6, image.getData());
			preparedStatement.executeUpdate();

			try (ResultSet re = preparedStatement.getGeneratedKeys();) {
				while (re.next()) {
					imageId = re.getInt(1);
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return imageId;
	}

	@Override
	public int saveImage(Image image) {
		int imageId = 0;
		try (Connection con = DatabaseConnection.getConnection();
				PreparedStatement preparedStatement = con.prepareStatement(
						"insert into Image (file_name,file_type,description,create_date,update_date,data) values(?,?,?,?,?,?)",
						Statement.RETURN_GENERATED_KEYS);) {

			preparedStatement.setNString(1, image.getFileName());
			preparedStatement.setNString(2, image.getFileType());
			preparedStatement.setNString(3, image.getDescription());
			preparedStatement.setDate(4, new Date(System.currentTimeMillis()));
			preparedStatement.setDate(5, new Date(System.currentTimeMillis()));
			preparedStatement.setBytes(6, image.getData());
			preparedStatement.executeUpdate();

			try (ResultSet re = preparedStatement.getGeneratedKeys();) {
				if (re.next()) {
					imageId = re.getInt(1);
				}
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return imageId;
	}
}
