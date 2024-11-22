package models;

import java.util.Date;

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

}
