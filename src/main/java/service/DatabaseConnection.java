package service;

import java.sql.Connection;
import java.sql.SQLException;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

public class DatabaseConnection {
	// connect cho máy ảo
	/*
	 * private static final String DRIVER_CLASS =
	 * "com.microsoft.sqlserver.jdbc.SQLServerDriver"; private static final String
	 * URL =
	 * "jdbc:sqlserver://sqlserver:1433;databaseName=book_store;encrypt=true;trustServerCertificate=true";
	 * private static final String USERNAME = "sa"; private static final String
	 * PASSWORD = "Sql@Server1"; private static final int MAX_POOL_SIZE = 100;
	 * private static final int MIN_IDLE = 10; private static final long
	 * CONNECTION_TIMEOUT = 30000; private static final long IDLE_TIMEOUT = 600000;
	 * private static final long MAX_LIFETIME = 1800000;
	 */

    private static final String DRIVER_CLASS = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    private static final String URL = "jdbc:sqlserver://127.0.0.1\\SQLEXPRESS;databaseName=book_store;encrypt=true;trustServerCertificate=true";
    private static final String USERNAME = "user_login";
    private static final String PASSWORD = "123";
    private static final int MAX_POOL_SIZE = 100;
    private static final int MIN_IDLE = 10;
    private static final long CONNECTION_TIMEOUT = 30000;
    private static final long IDLE_TIMEOUT = 600000;
    private static final long MAX_LIFETIME = 1800000;

    private static HikariDataSource dataSource;

    public static synchronized Connection getConnection() throws SQLException {
        if (dataSource == null) {
            initializeDataSource();
        }
        return dataSource.getConnection();
    }

    private static synchronized void initializeDataSource() {
        try {
            HikariConfig config = new HikariConfig();
            config.setDriverClassName(DRIVER_CLASS);
            config.setJdbcUrl(URL);
            config.setUsername(USERNAME);
            config.setPassword(PASSWORD);
            config.setMaximumPoolSize(MAX_POOL_SIZE);
            config.setMinimumIdle(MIN_IDLE);
            config.setConnectionTimeout(CONNECTION_TIMEOUT);
            config.setIdleTimeout(IDLE_TIMEOUT);
            config.setMaxLifetime(MAX_LIFETIME);
            dataSource = new HikariDataSource(config);
        } catch (Exception e) {
            throw new RuntimeException("Error initializing DataSource", e);
        }
    }

    public static synchronized void closeDataSource() {
        if (dataSource != null) {
            dataSource.close();
        }
    }
   
}
