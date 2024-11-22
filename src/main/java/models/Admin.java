package models;

import java.util.Date;

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
	
}
