package models;

import java.sql.Date;

public class Comment {
	private int commentId;
	private int rating;
	private String content;
	private Date createDate;
	private Date updateDate;

	public Comment(int commentId, int rating, String content, Date createDate, Date updateDate) {
		super();
		this.commentId = commentId;
		this.rating = rating;
		this.content = content;
		this.createDate = createDate;
		this.updateDate = updateDate;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public Comment(int rating, String content, Date createDate, Date updateDate) {
		super();
		this.rating = rating;
		this.content = content;
		this.createDate = createDate;
		this.updateDate = updateDate;
	}

	public Comment() {

	}

	public int getCommentId() {
		return commentId;
	}

	public String getContent() {
		return content;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public int getRating() {
		return rating;
	}

}
