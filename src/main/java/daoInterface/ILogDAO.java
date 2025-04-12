package daoInterface;

import java.util.List;

import models.Log;
import models.User;

public interface ILogDAO {
	public void saveLog(Log log);
	List<Log> getLogsByUserId(User user);

}
