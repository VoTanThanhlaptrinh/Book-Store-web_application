package daoInterface;

import java.util.List;

import models.User;

public interface IUserDao {
	List<User> getUsers();

	User findByUserId(int userId);

	int saveUser(User user);
	
	void deleteUser(User user);
	
	void updateUser(User user);
}
