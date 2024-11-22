package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
	private static String driverClass = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	private static String url = "jdbc:sqlserver://localhost\\SQLEXPRESS;databaseName=book_store;encrypt=true;trustServerCertificate=true";
	private static String username = "user_login";
	private static String password = "123";

	public static Connection getConnection() throws SQLException {
		try {
			Class.forName(driverClass);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return DriverManager.getConnection(url, username, password);
	}
}
