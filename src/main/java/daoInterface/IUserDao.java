package daoInterface;

import java.sql.SQLException;
import java.util.List;

import exeption.SqlException;
import models.User;

public interface IUserDao {
	List<User> getUsers();

	User findByUserId(int userId);

	int saveUser(User user) throws SqlException, SQLException;
	
	void deleteUser(User user);
	
	void updateUser(User user);
	
	User findByUserName(String username);
}
