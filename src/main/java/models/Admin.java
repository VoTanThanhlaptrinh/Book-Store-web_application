package models;

import java.sql.Date;

public class Admin {
	private int adminId;
	private String username;
	private String password;
	private String status;
	private Infomation info;
	private Date createDate;
	private Date updateDate;

	public Admin(int adminId, String username, String password, String status, Infomation info, Date createDate,
			Date updateDate) {
		super();
		this.adminId = adminId;
		this.username = username;
		this.password = password;
		this.status = status;
		this.info = info;
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

	public Infomation getInfo() {
		if (info == null)
			info = new Infomation();
		return info;
	}

	public void setInfo(Infomation info) {
		this.info = info;
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

	@Override
	public String toString() {
		return "Admin [adminId=" + adminId + ", username=" + username + ", password=" + password + ", status=" + status
				+ ", info=" + info + ", createDate=" + createDate + ", updateDate=" + updateDate + "]";
	}

}
