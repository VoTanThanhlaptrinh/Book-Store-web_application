package models;

import java.sql.Date;

public class Image {
	private int imgId;
	private String fileName;
	private String fileType;
	private String description;
	private Date createDate;
	private Date updateDate;
	private byte[] data;

	public Image(int imgId, String fileName, String fileType, String description, Date createDate, Date updateDate,
			byte[] data) {
		super();
		this.imgId = imgId;
		this.fileName = fileName;
		this.fileType = fileType;
		this.description = description;
		this.createDate = createDate;
		this.updateDate = updateDate;
		this.data = data;
	}

	public Image(String fileName, String fileType, String description, Date createDate, Date updateDate, byte[] data) {
		super();
		this.fileName = fileName;
		this.fileType = fileType;
		this.description = description;
		this.createDate = createDate;
		this.updateDate = updateDate;
		this.data = data;
	}

	public Image() {
	}

	public int getImgId() {
		return imgId;
	}

	public String getFileName() {
		return fileName;
	}

	public String getFileType() {
		return fileType;
	}

	public String getDescription() {
		return description;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public Date getUpdateDate() {
		return updateDate;
	}


	public void setImgId(int imgId) {
		this.imgId = imgId;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public void setFileType(String fileType) {
		this.fileType = fileType;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public void setData(byte[] data) {
		this.data = data;
	}

	public byte[] getData() {
		return data;
	}
	

}
