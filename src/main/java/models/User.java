package models;

import java.util.Date;

public class User {
	private int userId;
	private String username;
	private String password;
	private Date createDate;
	private Infomation info;

	public User(int userId, String username, String password, Date createDate, Infomation info) {
		super();
		this.userId = userId;
		this.username = username;
		this.password = password;
		this.createDate = createDate;
		this.info = info;
	}

	public User(int userId, String username, String password, Date createDate) {
		super();
		this.userId = userId;
		this.username = username;
		this.password = password;
		this.createDate = createDate;
	}

	public User() {
		super();
	}

	public int getUserId() {
		return userId;
	}

	public String getUsername() {
		return username;
	}

	public String getPassword() {
		return password;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public Infomation getInfo() {
		return info;
	}

	public boolean hasSameId(int id) {
		return Integer.compare(userId, id) == 0;
	}
}
