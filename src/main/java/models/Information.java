package models;

import java.sql.Date;

public class Information {
	private int infoId;
	private String name;
	private String address;
	private String phoneNumber;
	private String cccd;
	private Date birth;
	private String email;
	private Date createDate;
	private Date updateDate;
	private int imgId;

	public Information(int infoId, String name, String address, String phoneNumber, String cccd, Date birth,
			String email, Date createDate, Date updateDate, int imgId) {
		super();
		this.infoId = infoId;
		this.name = name;
		this.address = address;
		this.phoneNumber = phoneNumber;
		this.cccd = cccd;
		this.birth = birth;
		this.email = email;
		this.createDate = createDate;
		this.setUpdateDate(updateDate);
		this.imgId = imgId;
	}

	public Information(String name, String address, String phoneNumber, String cccd, Date birth, String email,
			Date createDate, Date updateDate, int imgId) {
		super();
		this.name = name;
		this.address = address;
		this.phoneNumber = phoneNumber;
		this.cccd = cccd;
		this.birth = birth;
		this.email = email;
		this.createDate = createDate;
		this.updateDate = updateDate;
		this.imgId = imgId;
	}

	public Information() {
		super();
	}

	public int getInfoId() {
		return infoId;
	}

	public void setInfoId(int infoId) {
		this.infoId = infoId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getCccd() {
		return cccd;
	}

	public void setCccd(String cccd) {
		this.cccd = cccd;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public int getImgId() {
		return imgId;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public void setImgId(int imgId) {
		this.imgId = imgId;
	}
	
}
