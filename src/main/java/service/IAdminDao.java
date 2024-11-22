package service;

import java.util.List;

import models.Admin;


public interface IAdminDao {
	List<Admin> getUsers();

	Admin findByUserId(int adminId);

	void saveUser(Admin admin);

	void updateUser(Admin admin);
	
}
