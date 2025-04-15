package models;

import java.sql.Date;
import java.util.Set;

public class User {
	private int userId;
	private String username;
	private String password;
	private String email;
	private Date createDate;
	private Date updateDate;
	private Set<String> roles;
	private boolean isSocialLogin;
	private String status;
	private boolean isActivate;
	private Set<Resource> resources;
	
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

	public User(String username, String password, String email, Date createDate, Date updateDate, Set<String> roles,
			boolean isSocialLogin, String status, boolean isActivate) {
		super();
		this.username = username;
		this.password = password;
		this.email = email;
		this.createDate = createDate;
		this.updateDate = updateDate;
		this.roles = roles;
		this.isSocialLogin = isSocialLogin;
		this.status = status;
		this.isActivate = isActivate;
	}

	public User(String username, String password, String email, Date createDate, Date updateDate, Set<String> roles,
			boolean isSocialLogin, String status, boolean isActivate, Set<Resource> resources) {
		super();
		this.username = username;
		this.password = password;
		this.email = email;
		this.createDate = createDate;
		this.updateDate = updateDate;
		this.roles = roles;
		this.isSocialLogin = isSocialLogin;
		this.status = status;
		this.isActivate = isActivate;
		this.resources = resources;
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

	public Set<String> getRoles() {
		return roles;
	}

	public void setRoles(Set<String> roles) {
		this.roles = roles;
	}

	public boolean isSocialLogin() {
		return isSocialLogin;
	}

	public void setSocialLogin(boolean isSocialLogin) {
		this.isSocialLogin = isSocialLogin;
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

	public Set<Resource> getResources() {
		return resources;
	}

	public void setResources(Set<Resource> resources) {
		this.resources = resources;
	}

	public boolean isAdmin() {
		return roles.contains("admin");
	}

	public boolean isRoot() {
		// TODO Auto-generated method stub
		return roles.contains("root");
	}

	public boolean hasPermissionWithUrl(String path) {
		// TODO Auto-generated method stub
		return resources.stream().filter(r -> r.checkPath(path)).count() > 0;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", username=" + username + ", password=" + password + ", email=" + email
				+ ", createDate=" + createDate + ", updateDate=" + updateDate + ", roles=" + roles + ", isSocialLogin="
				+ isSocialLogin + ", status=" + status + ", isActivate=" + isActivate + ", resources=" + resources
				+ "]";
	}
	
}
