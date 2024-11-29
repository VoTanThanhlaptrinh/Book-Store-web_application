package models;

import java.sql.Date;

public class User {
	private int userId;
	private String username;
	private String password;
	private String email;
	private Date createDate;
	private Date updateDate;
	private int infoId;

	public User(int userId, String username, String password, String email, Date createDate, int infoId,
			Date updaDate) {
		super();
		this.userId = userId;
		this.username = username;
		this.password = password;
		this.email = email;
		this.createDate = createDate;
		this.infoId = infoId;
		this.updateDate = updaDate;
	}

	public User(int userId, String username, String password, String email, Date createDate) {
		super();
		this.userId = userId;
		this.username = username;
		this.password = password;
		this.email = email;
		this.createDate = createDate;
	}

	public User(String username, String password, String email, Date createDate, Date updateDate) {
		this.username = username;
		this.password = password;
		this.email = email;
		this.createDate = createDate;
		this.updateDate = updateDate;
	}

	public User() {
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

	public boolean hasSamePass(String password) {
		// TODO Auto-generated method stub
		return this.password.equals(password);
	}

	public String getEmail() {
		return email;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

}
