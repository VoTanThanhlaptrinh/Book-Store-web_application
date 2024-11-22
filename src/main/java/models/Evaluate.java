package models;

import java.util.Date;

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
	public Evaluate() {
		super();
	}
    
}
