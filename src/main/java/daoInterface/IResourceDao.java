package daoInterface;

import java.util.List;
import java.util.Set;

import models.Resource;

public interface IResourceDao {
	public List<Resource> getListResources();

	public void grantPermissionAndUpdateRole(int userId, Set<Resource> toAdd, Set<Resource> toRemove, int allow);
}
