package service;

import java.sql.Date;

import daoImp.InfoDAOImp;
import daoImp.UserDAOImp;
import daoInterface.IInfoDao;
import daoInterface.IUserDao;
import exeption.SqlException;
import models.Information;
import models.User;

public class LoginService implements ILoginService {
	private IUserDao daoImp;
	private IInfoDao infoDao;

	public LoginService() {
		daoImp = new UserDAOImp();
		infoDao = new InfoDAOImp();
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
}
