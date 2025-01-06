package models;

import java.sql.Date;
import java.util.List;

public class User {
	private int userId;
	private String username;
	private String password;
	private String email;
	private Date createDate;
	private Date updateDate;
	private List<String> roles;

	public User(int userId, String username, String password, String email, Date createDate, Date updaDate) {
		super();
		this.userId = userId;
		this.username = username;
		this.password = password;
		this.email = email;
		this.createDate = createDate;
		this.updateDate = updaDate;
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

	public List<String> getRoles() {
		return roles;
	}

	public void setRoles(List<String> roles) {
		this.roles = roles;
	}
	

}
