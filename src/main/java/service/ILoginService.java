package service;

import java.sql.SQLException;

import com.microsoft.sqlserver.jdbc.SQLServerException;

import exeption.SqlException;
import models.User;

public interface ILoginService {
	User checkUser(String username, String password);

	boolean register(String username, String password,String email) throws SQLServerException, SqlException, SQLException;
}
