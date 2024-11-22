package models;

import java.util.Date;

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
	public Comment() {
		
	}
    
}
