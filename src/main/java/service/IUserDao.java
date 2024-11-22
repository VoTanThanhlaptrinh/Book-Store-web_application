package service;

import java.util.List;

import models.User;

public interface IUserDao {
	List<User> getUsers();

	User findByUserId(int userId);

	void saveUser(User user);

	void changePassword(User user, String password);
	
	void deleteUser(User user);
	
}
