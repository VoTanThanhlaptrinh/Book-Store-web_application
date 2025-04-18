package daoInterface;

import java.util.List;

import models.User;
public interface IUserDao {
	List<User> getUsers(int page, int pageSize);

	User findByUserId(int userId);


	int saveUser(User user);
	
	void deleteUser(User user);
	
	void updateUser(User user);
	
	User findByUserName(String username);
	
	boolean checkEmail(String email);

	User getUserByMail(String mail);

	void activateUser(User user);

	int getTotalUsers();

	List<Integer> getListImgIds(List<User> users);
}
