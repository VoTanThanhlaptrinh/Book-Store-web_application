package service;

import models.Log;

public interface ILogService {
	public void info(Log log);
	public void warning(Log log);
	public void error(Log log);
}
