package models;

import java.util.Date;

public class User {
	private int userId;
	private String username;
	private String password;
	private Date createDate;
	private int infoId;

	public User(int userId, String username, String password, Date createDate, int infoId) {
		super();
		this.userId = userId;
		this.username = username;
		this.password = password;
		this.createDate = createDate;
		this.infoId = infoId;
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

	public int getInfoId() {
		return infoId;
	}

	public void setInfoId(int infoId) {
		this.infoId = infoId;
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

	public boolean hasSameId(int id) {
		return Integer.compare(userId, id) == 0;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}
