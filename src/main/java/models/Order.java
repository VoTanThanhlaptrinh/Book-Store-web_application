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

	
	
	public Order(int orderId, double totalAmount, Date createDate) {
		super();
		this.orderId = orderId;
		this.totalAmount = totalAmount;
		this.createDate = createDate;
	}



	public Order() {
		super();
	}



	public int getOrderId() {
		return orderId;
	}



	public int getUserId() {
		return userId;
	}



	public double getTotalAmount() {
		return totalAmount;
	}



	public String getStatus() {
		return status;
	}



	public Date getCreateDate() {
		return createDate;
	}



	public Date getUpdateDate() {
		return updateDate;
	}



	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}



	public void setUserId(int userId) {
		this.userId = userId;
	}



	public void setTotalAmount(double totalAmount) {
		this.totalAmount = totalAmount;
	}



	public void setStatus(String status) {
		this.status = status;
	}



	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}



	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}



	@Override
	public String toString() {
		return "Order [orderId=" + orderId + ", userId=" + userId + ", totalAmount=" + totalAmount + ", status="
				+ status + ", createDate=" + createDate + ", updateDate=" + updateDate + "]";
	}
	

}
