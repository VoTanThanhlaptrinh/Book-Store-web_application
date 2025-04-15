package service;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;

import models.Image;
import models.Information;
import models.User;

public interface ILoginService {
	User checkUser(String username, String password);

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

	void activateUser(User user);

	int register(User user);
	
	List<User> getListUser(int page, int pageSize);

	int getTotalUsers();

	List<Integer> getListImgIds(List<User> users);
	
	User getUserByUserId(int userId);
}
