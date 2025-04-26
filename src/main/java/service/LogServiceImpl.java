package service;

import java.util.Date;

import daoImp.LogDAOImpl;
import daoInterface.ILogDAO;
import models.Log;

public class LogServiceImpl implements ILogService {
	private ILogDAO logDAO;
	public static final String RESET = "\u001B[0m"; // Reset về mặc định
	public static final String RED = "\u001B[31m"; // Màu đỏ
	public static final String GREEN = "\u001B[32m"; // Màu xanh lá
	public static final String YELLOW = "\u001B[33m"; // Màu vàng
	public static final String BLUE = "\u001B[34m"; // Màu xanh dương
 
	public LogServiceImpl() {
		logDAO = new LogDAOImpl();
	}

	@Override
	public void info(Log log) {
		// TODO Auto-generated method stub
		StringBuilder res = new StringBuilder();
		res.append(GREEN);
		String time = new Date(System.currentTimeMillis()).toString();
		res.append(time + " ");
		res.append("[INFOR]: ");
		res.append(log.getMessage());
		res.append(RESET);
		System.out.println(res.toString());
		logDAO.saveLog(log);
		
	}

	@Override
	public void warning(Log log) {
		// TODO Auto-generated method stub
		String time = new Date(System.currentTimeMillis()).toString();
		StringBuilder res = new StringBuilder();
		res.append(YELLOW);
		res.append(time + " ");
		res.append("[WARNING]: ");
		res.append(log.getMessage());
		res.append(RESET);
		System.out.println(res.toString());
		logDAO.saveLog(log);
	}

	@Override
	public void error(Log log) {
		// TODO Auto-generated method stub
		StringBuilder res = new StringBuilder();
		String time = new Date(System.currentTimeMillis()).toString();
		res.append(RED);
		res.append(time + " ");
		res.append("[ERROR]: ");
		res.append(log.getMessage());
		res.append(RESET);
		System.out.println(res.toString());
		logDAO.saveLog(log);
	}

	public static void main(String[] args) {
		ILogService logService = new LogServiceImpl();
		Log log = new Log(8, "info",null, "User", "/login", null, null, "Đăng nhập thất bại");
		logService.info(log);
	}
}
