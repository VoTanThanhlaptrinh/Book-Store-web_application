package models;

import java.util.Date;

public class Image {
	private int imgId;
	private String fileName;
	private String url;
	private String fileType;
	private Date uploadedDate;
	private String description;
	private Date createDate;
	private Date updateDate;

	public Image(int imgId, String fileName, String url, String fileType, Date uploadedDate, String description,
			Date createDate, Date updateDate) {
		super();
		this.imgId = imgId;
		this.fileName = fileName;
		this.url = url;
		this.fileType = fileType;
		this.uploadedDate = uploadedDate;
		this.description = description;
		this.createDate = createDate;
		this.updateDate = updateDate;
	}

	public Image() {
	}

}
