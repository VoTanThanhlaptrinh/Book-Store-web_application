package models;

import java.sql.Date;

public class HistorySearch {
	private int hisId;
	private int userId;
	private String content;
	private Date createDate;

	public HistorySearch(int hisId, int userId, String content, Date createDate) {
		super();
		this.hisId = hisId;
		this.userId = userId;
		this.content = content;
		this.createDate = createDate;
	}

	public HistorySearch() {
	}

	public int getHisId() {
		return hisId;
	}

	public int getUserId() {
		return userId;
	}

	public String getContent() {
		return content;
	}

	public Date getCreateDate() {
		return createDate;
	}

}
