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

	public int getInfoId() {
		return infoId;
	}

	public boolean hasSameId(int id) {
		return Integer.compare(userId, id) == 0;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", username=" + username + ", password=" + password + ", createDate="
				+ createDate + ", infoId=" + infoId + "]";
	}
	
}
