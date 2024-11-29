package service;

import java.sql.Date;

import daoImp.UserDAOImp;
import exeption.SqlException;
import models.User;

public class LoginService implements ILoginService {
	private UserDAOImp daoImp;

	public LoginService() {
		daoImp = new UserDAOImp();
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
}
