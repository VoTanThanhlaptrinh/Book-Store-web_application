package service;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import org.mindrot.jbcrypt.BCrypt;

import daoImp.ImageDAOImp;
import daoImp.InfoDAOImp;
import daoImp.UserDAOImp;
import daoInterface.IImageDao;
import daoInterface.IInfoDao;
import daoInterface.IUserDao;
import models.Image;
import models.Information;
import models.Log;
import models.User;

public class LoginService implements ILoginService {
	private IUserDao daoImp;
	private IInfoDao infoDao;
	private IImageDao imageDao;
	private ILogService logService; 
	public LoginService() {
		daoImp = new UserDAOImp();
		infoDao = new InfoDAOImp();
		imageDao = new ImageDAOImp();
		logService = new LogServiceImpl();
	}

	@Override
	public User checkUser(String username, String password) {
		User user = daoImp.findByUserName(username);
		if (user == null) {
			return user;
		}
		String storedHash = user.getPassword();
		if (BCrypt.checkpw(password, storedHash)) {
			logService.info(new Log(user.getUserId(), "info", "User", "/login", "Đăng nhập thành công"));
			return user;
		}
		logService.info(new Log(user.getUserId(), "info", "User", "/login", "Đăng nhập thất bại. Lý do: sai mật khẩu"));
		LoginSpamService.putUsername(username);
		return null;
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

	@Override

	public void activateUser(User user) {
		// TODO Auto-generated method stub
		daoImp.activateUser(user);
	}

	@Override
	public int register(User user) {
		String passHash = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
		user.setPassword(passHash);
		return daoImp.saveUser(user);
	}

	@Override
	public List<User> getListUser(int page, int pageSize) {
		// TODO Auto-generated method stub
		return daoImp.getUsers(page,pageSize);
	}

	@Override
	public int getTotalUsers() {
		// TODO Auto-generated method stub
		return daoImp.getTotalUsers();
	}

	@Override
	public List<Integer> getListImgIds(List<User> users) {
		// TODO Auto-generated method stub
		return daoImp.getListImgIds(users);
	}

	@Override
	public User getUserByUserId(int userId) {
		// TODO Auto-generated method stub
		return daoImp.findByUserId(userId);
	}

}
