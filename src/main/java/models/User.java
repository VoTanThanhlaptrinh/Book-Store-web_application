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
	private boolean isSocialLogin;
	private String socialLoginName;
	private String status;
	private boolean isActivate;
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
	
	public User(String username, String password, String email, Date createDate, Date updateDate, List<String> roles,
			boolean isSocialLogin, String socialLoginName, String status, boolean isActivate) {
		super();
		this.username = username;
		this.password = password;
		this.email = email;
		this.createDate = createDate;
		this.updateDate = updateDate;
		this.roles = roles;
		this.isSocialLogin = isSocialLogin;
		this.socialLoginName = socialLoginName;
		this.status = status;
		this.isActivate = isActivate;
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

	public boolean isSocialLogin() {
		return isSocialLogin;
	}

	public void setSocialLogin(boolean isSocialLogin) {
		this.isSocialLogin = isSocialLogin;
	}

	public String getSocialLoginName() {
		return socialLoginName;
	}

	public void setSocialLoginName(String socialLoginName) {
		this.socialLoginName = socialLoginName;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public boolean isActivate() {
		return isActivate;
	}

	public void setActivate(boolean isActivate) {
		this.isActivate = isActivate;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

}
