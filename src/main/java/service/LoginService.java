package service;

import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Date;

import org.mindrot.jbcrypt.BCrypt;

import daoImp.ImageDAOImp;
import daoImp.InfoDAOImp;
import daoImp.UserDAOImp;
import daoInterface.IImageDao;
import daoInterface.IInfoDao;
import daoInterface.IUserDao;
import exeption.SqlException;
import models.Image;
import models.Information;
import models.User;

public class LoginService implements ILoginService {
	private IUserDao daoImp;
	private IInfoDao infoDao;
	private IImageDao imageDao;

	public LoginService() {
		daoImp = new UserDAOImp();
		infoDao = new InfoDAOImp();
		imageDao = new ImageDAOImp();
	}

	@Override
	public User checkUser(String username, String password) {
		User user = daoImp.findByUserName(username);
		String storedHash = user.getPassword();
		if (user != null && BCrypt.checkpw(password, storedHash)) {
			return user;
		}
		return null;
	}

	@Override
	public boolean register(String username, String password, String email) throws SqlException {
		String passHash = BCrypt.hashpw(password, BCrypt.gensalt());
		User user = new User(username, passHash, email, new Date(System.currentTimeMillis()),
				new Date(System.currentTimeMillis()));

		int i = 0;
		try {
			i = daoImp.saveUser(user);
		} catch (Exception e) {
			// TODO: handle exception
			throw new SqlException("user đã tồn tại");
		}
		if(daoImp.checkEmail(email)) {
			throw new SqlException("email đã tồn tại");
		}
		return i > 0;
	}

	@Override
	public Information getInforOfUser(int userId) {
		return infoDao.findInforByUserId(userId);
	}

	@Override
	public void updateInfor(Information infor) {
		// TODO Auto-generated method stub
		infoDao.updateInfor(infor);
	}

	@Override
	public void saveInfor(Information infor, User user) {
		// TODO Auto-generated method stub
		infor.setUserId(user.getUserId());
		infoDao.saveInfor(infor);
	}

	@Override
	public Image getImageByImgId(int imgId) {
		Image img = imageDao.findByImageId(imgId);
		return img;
	}

	@Override
	public int saveImage(Image img) {
		return imageDao.saveImage(img);
	}

	@Override
	public void updateImage(Image img) {
		// TODO Auto-generated method stub
		imageDao.updateImage(img);
	}

	@Override
	public void loadImage(Image img, String path) throws IOException {
		byte[] bytes = img.getData();
		FileOutputStream fos = new FileOutputStream(path);
		fos.write(bytes);
		fos.flush();
		fos.close();
	}

	@Override
	public String getUsername(int userId) {
		// TODO Auto-generated method stub
		return daoImp.findByUserId(userId).getUsername();
	}

	@Override
	public byte[] resizeImg(byte[] bytes) {
		return bytes;
		// TODO Auto-generated method stub

	}

	@Override
	public boolean checkEmail(String email) {
		// TODO Auto-generated method stub
		return daoImp.checkEmail(email);
	}

	@Override
	public User getUserByMail(String mail) {
		// TODO Auto-generated method stub
		return daoImp.getUserByMail(mail);
	}

	@Override
	public String hashPass(String pass) {
		// TODO Auto-generated method stub
		return BCrypt.hashpw(pass, BCrypt.gensalt());
	}

	@Override
	public void updateUser(User user) {
		// TODO Auto-generated method stub
		daoImp.updateUser(user);
	}
}
