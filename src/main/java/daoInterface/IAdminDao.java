package daoInterface;

import java.util.List;

import models.Admin;


public interface IAdminDao {
	List<Admin> getAdmins();

	Admin findByAdminId(int adminId);

	void saveAdmin(Admin admin);

	void updateAdmin(Admin admin);
	
}
