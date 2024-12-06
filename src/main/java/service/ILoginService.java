package service;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;

import com.microsoft.sqlserver.jdbc.SQLServerException;

import exeption.SqlException;
import models.Image;
import models.Information;
import models.User;

public interface ILoginService {
	User checkUser(String username, String password);

	boolean register(String username, String password, String email)
			throws SQLServerException, SqlException, SQLException;

	Information getInforOfUser(int infoId);

	void updateInfor(Information infor);

	void saveInfor(Information infor, User user);

	Image getImageByImgId(int inforId);

	int saveImage(Image img);

	void updateImage(Image img);

	void loadImage(Image img, String path) throws FileNotFoundException, IOException;
}
