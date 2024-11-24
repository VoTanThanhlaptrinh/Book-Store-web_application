package models;

import java.util.Date;

public class Image {
	private int imgId;
	private String fileName;
	private String url;
	private String fileType;
	private String description;
	private Date createDate;
	private Date updateDate;
	private String objectType;

	public Image(int imgId, String fileName, String url, String fileType, String description, Date createDate,
			Date updateDate, String objectType) {
		super();
		this.imgId = imgId;
		this.fileName = fileName;
		this.url = url;
		this.fileType = fileType;
		this.description = description;
		this.createDate = createDate;
		this.updateDate = updateDate;
		this.objectType = objectType;
	}

	public Image() {
	}
	
	public int getImgId() {
		return imgId;
	}

	public String getFileName() {
		return fileName;
	}

	public String getUrl() {
		return url;
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

	public String getAsoluteUrl() {
		return "webPage/" + url;
	}

	public String getObjectType() {
		return objectType;
	}
	
}
