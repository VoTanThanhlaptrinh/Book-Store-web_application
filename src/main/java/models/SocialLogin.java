package models;

import java.sql.Date;

public class SocialLogin {
	private String id;
	private int userId;
	private String name;
	private Date createAt;
	public SocialLogin(String id, int userId, String name, Date createAt) {
		super();
		this.id = id;
		this.userId = userId;
		this.name = name;
		this.createAt = createAt;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getCreateAt() {
		return createAt;
	}
	public void setCreateAt(Date createAt) {
		this.createAt = createAt;
	}
	
}
