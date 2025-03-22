package daoInterface;

import java.sql.SQLException;
import java.util.List;

import models.User;
public interface IUserDao {
	List<User> getUsers();

	User findByUserId(int userId);

	void saveUser(User user) throws SQLException;
	
	void deleteUser(User user);
	
	void updateUser(User user);
	
	User findByUserName(String username);
	
	boolean checkEmail(String email);

	User getUserByMail(String mail);

	void activateUser(User user);
}
