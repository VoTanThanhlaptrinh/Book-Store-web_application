package models;

import java.sql.Date;

public class Comment {
	private int commentId;
    private int evaluateId;
    private String content;
    private Date createDate;
    private Date updateDate;
	public Comment(int commentId, int evaluateId, String content, Date createDate, Date updateDate) {
		super();
		this.commentId = commentId;
		this.evaluateId = evaluateId;
		this.content = content;
		this.createDate = createDate;
		this.updateDate = updateDate;
	}
	
	public Comment(int evaluateId, String content, Date createDate, Date updateDate) {
		super();
		this.evaluateId = evaluateId;
		this.content = content;
		this.createDate = createDate;
		this.updateDate = updateDate;
	}

	public Comment() {
		
	}
	public int getCommentId() {
		return commentId;
	}
	public int getEvaluateId() {
		return evaluateId;
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
    
}
