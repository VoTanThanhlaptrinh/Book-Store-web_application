package service;

import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Date;

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
		if (user != null && user.hasSamePass(password)) {
			return user;
		}
		return null;
	}

	@Override
	public boolean register(String username, String password, String email) throws SqlException {
		User user = new User(username, password, email, new Date(System.currentTimeMillis()),
				new Date(System.currentTimeMillis()));

		int i = 0;
		try {
			i = daoImp.saveUser(user);
		} catch (Exception e) {
			// TODO: handle exception
			throw new SqlException("user đã tồn tại");
		}
		return i > 0;
	}

	@Override
	public Information getInforOfUser(int infoId) {
		return infoDao.findInfoByInfoId(infoId);
	}

	@Override
	public void updateInfor(Information infor) {
		// TODO Auto-generated method stub
		infoDao.updateInfor(infor);
	}

	public void saveInfor(Information infor, User user) {
		// TODO Auto-generated method stub
		int inforId = infoDao.saveInfor(infor);
		user.setInfoId(inforId);
		daoImp.updateUser(user);
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
}
