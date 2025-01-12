package service;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;

import com.microsoft.sqlserver.jdbc.SQLServerException;

import models.Image;
import models.Information;
import models.User;

public interface ILoginService {
	User checkUser(String username, String password);

	boolean register(String username, String password, String email) throws SQLException, SQLServerException;

	Information getInforOfUser(int userId);

	void updateInfor(Information infor);

	void saveInfor(Information infor, User user);

	Image getImageByImgId(int inforId);

	int saveImage(Image img);

	void updateImage(Image img);

	void loadImage(Image img, String path) throws FileNotFoundException, IOException;

	String getUsername(int userId);
	
	byte[] resizeImg(byte[] bytes);
	
	boolean checkEmail(String email);
	
	User getUserByMail(String mail);
	
	String hashPass(String pass);

	void updateUser(User user);
}
