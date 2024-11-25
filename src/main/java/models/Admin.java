package models;

import java.sql.Date;

public class Admin {
	private int adminId;
	private String username;
	private String password;
	private String status;
	private int infoId;
	private Date createDate;
	private Date updateDate;

	public Admin(int adminId, String username, String password, String status, int infoId, Date createDate,
			Date updateDate) {
		super();
		this.adminId = adminId;
		this.username = username;
		this.password = password;
		this.status = status;
		this.infoId = infoId;
		this.createDate = createDate;
		this.updateDate = updateDate;
	}

	public Admin() {
	}

	public int getAdminId() {
		return adminId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getInfoId() {
		return infoId;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public void setAdminId(int adminId) {
		this.adminId = adminId;
	}
}
