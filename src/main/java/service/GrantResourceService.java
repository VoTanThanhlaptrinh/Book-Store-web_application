package service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import daoImp.ResourceDAOImpl;
import daoImp.UserDAOImp;
import daoInterface.IResourceDao;
import daoInterface.IUserDao;
import models.Resource;
import models.User;

public class GrantResourceService implements IGrantResourceService {
	private IResourceDao resourceDao;
	private IUserDao userDao;

	public GrantResourceService() {
		this.resourceDao = new ResourceDAOImpl();
		userDao = new UserDAOImp();
	}

	@Override
	public void grant(int userId, Map<String, ArrayList<Integer>> permission) {
		// TODO Auto-generated method stub

		User user = userDao.findByUserId(userId);
		if (user == null)
			return;
		Set<Resource> oldResource = user.getResources();
		Set<Resource> newResources = convert(permission);

		Set<Resource> toAdd = new HashSet<>(newResources);
		toAdd.removeAll(oldResource);

		Set<Resource> toRemove = new HashSet<>(oldResource);
		toRemove.removeAll(newResources);

		// Gọi DAO để cập nhật DB
		resourceDao.grantPermissions(userId, toAdd);
		resourceDao.revokePermissions(userId, toRemove);
	}

	private Set<Resource> convert(Map<String, ArrayList<Integer>> permission) {
		Set<Resource> resources = new HashSet<Resource>();
		permission.forEach((k, v) -> v.forEach(p -> resources.add(new Resource(k, p))));
		return resources;
	}

}
