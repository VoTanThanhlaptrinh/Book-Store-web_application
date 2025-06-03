package service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Map;
import java.util.ResourceBundle;
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
	private final SendMailQueueService sendMailQueueService = SendMailQueueService.getInstance();
	public GrantResourceService() {
		this.resourceDao = new ResourceDAOImpl();
		userDao = new UserDAOImp();
	}

	@Override
	public void grant(int userId, Map<String, ArrayList<Integer>> permission, ResourceBundle bundle) {
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
		int allow = 0;
		if(oldResource.size() == 0 && newResources.size() > 0) {
			allow = 1;
			String content = bundle.getString("grant.admin.content");
			sendMailQueueService.sendMailGrantPermission(user.getEmail()
					, String.format(content, user.getEmail())
					, bundle.getString("grant.admin.subject"));
		}
		if(oldResource.size() > 0 && newResources.size() == 0 ) {
			allow = -1;
			String content = bundle.getString("remove.admin.content");
			sendMailQueueService.sendMailGrantPermission(user.getEmail()
					, String.format(content, user.getEmail())
					, bundle.getString("grant.admin.subject"));
		}
		// allow định nghĩa việc được phép thêm hay xoá hay giữa lại role admin.
		// allow = 0 là giữ lại, allow bằng 1 thì thêm, allow = -1 thì xoá.
		resourceDao.grantPermissionAndUpdateRole(userId,toAdd,toRemove,allow);
	}

	private Set<Resource> convert(Map<String, ArrayList<Integer>> permission) {
		Set<Resource> resources = new HashSet<Resource>();
		permission.forEach((k, v) -> v.forEach(p -> resources.add(new Resource(k, p))));
		return resources;
	}

}
