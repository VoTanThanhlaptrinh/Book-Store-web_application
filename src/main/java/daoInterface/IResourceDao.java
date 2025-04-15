package daoInterface;

import java.util.List;
import java.util.Set;

import models.Resource;

public interface IResourceDao {
	public List<Resource> getListResources();

	public void grantPermissions(int userId, Set<Resource> toAdd);

	public void revokePermissions(int userId, Set<Resource> toRemove);
}
