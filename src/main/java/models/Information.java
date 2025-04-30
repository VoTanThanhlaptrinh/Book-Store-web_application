package models;

import java.sql.Date;

public class Information {
	private int infoId;
	private String name;
	private String phoneNumber;
	private Date birth;
	private String email;
	private String gender;
	private Date createDate;
	private Date updateDate;
	private int imgId;
	private int userId;

	

	public Information(int infoId, String name, String phoneNumber, Date birth, String email, String gender,
			Date createDate, Date updateDate, int imgId, int userId) {
		super();
		this.infoId = infoId;
		this.name = name;
		this.phoneNumber = phoneNumber;
		this.birth = birth;
		this.email = email;
		this.gender = gender;
		this.createDate = createDate;
		this.updateDate = updateDate;
		this.imgId = imgId;
		this.userId = userId;
	}

	public Information(String name, String phoneNumber, Date birth, String email, String gender, Date createDate,
			Date updateDate, int imgId, int userId) {
		super();
		this.name = name;
		this.phoneNumber = phoneNumber;
		this.birth = birth;
		this.email = email;
		this.gender = gender;
		this.createDate = createDate;
		this.updateDate = updateDate;
		this.imgId = imgId;
		this.userId = userId;
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

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
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

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

}
