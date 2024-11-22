package models;

import java.util.Date;

public class Transaction {
	private int transactionId;
	private int orderId;
	private int userId;
	private String currency;
	private String transactionType;
	private String status;
	private String paymentMethod;
	private String description;
	private Date createDate;
	private Date updateDate;
	public Transaction(int transactionId, int orderId, int userId, String currency, String transactionType,
			String status, String paymentMethod, String description, Date createDate, Date updateDate) {
		super();
		this.transactionId = transactionId;
		this.orderId = orderId;
		this.userId = userId;
		this.currency = currency;
		this.transactionType = transactionType;
		this.status = status;
		this.paymentMethod = paymentMethod;
		this.description = description;
		this.createDate = createDate;
		this.updateDate = updateDate;
	}
	public Transaction() {
		super();
	}
	
}
