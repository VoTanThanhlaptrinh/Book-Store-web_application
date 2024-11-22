package models;

import java.util.Date;

public class Order {
	private int orderId;
	private int userId;
	private double totalAmount;
	private String status;
	private Date createDate;
	private Date updateDate;

	public Order(int orderId, int userId, double totalAmount, String status, Date createDate, Date updateDate) {
		super();
		this.orderId = orderId;
		this.userId = userId;
		this.totalAmount = totalAmount;
		this.status = status;
		this.createDate = createDate;
		this.updateDate = updateDate;
	}

	public Order() {
		super();
	}

}
