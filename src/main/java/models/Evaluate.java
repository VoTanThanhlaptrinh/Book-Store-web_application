package models;

import java.sql.Date;

public class Evaluate {
	private int evaluateId;
    private int userId;
    private int productId;
    private int rating;
    private Date createDate;
    private Date updateDate;
	public Evaluate(int evaluateId, int userId, int productId, int rating, Date createDate, Date updateDate) {
		super();
		this.evaluateId = evaluateId;
		this.userId = userId;
		this.productId = productId;
		this.rating = rating;
		this.createDate = createDate;
		this.updateDate = updateDate;
	}
	
	public Evaluate(int userId, int productId, int rating, Date createDate, Date updateDate) {
		super();
		this.userId = userId;
		this.productId = productId;
		this.rating = rating;
		this.createDate = createDate;
		this.updateDate = updateDate;
	}

	public Evaluate() {
		super();
	}
	public int getEvaluateId() {
		return evaluateId;
	}
	public int getUserId() {
		return userId;
	}
	public int getProductId() {
		return productId;
	}
	public int getRating() {
		return rating;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
    
}
