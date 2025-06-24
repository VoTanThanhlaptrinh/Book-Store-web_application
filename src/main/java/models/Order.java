package models;

import java.util.Date;

public class Order {
	int orderId;
	int userId;
	double totalAmount;
	String status;
	Date createDate;
	Date updateDate;
	String signature;
	String SignatureStatus;
	double totalPrice;
	String totalFormatted;
	String publicKey;
	String hashData;//hash lưu dưới database
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



	public String getTotalFormatted() {
		return totalFormatted;
	}



	public String getHashData() {
		return hashData;
	}



	public void setHashData(String hashData) {
		this.hashData = hashData;
	}



	public Order() {
		super();
	}

	

	public String getPublicKey() {
		return publicKey;
	}



	public void setPublicKey(String publicKey) {
		this.publicKey = publicKey;
	}



	public double getTotalPrice() {
		return totalPrice;
	}



	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}

	public void setTotalFormatted(String totalFormatted) {
	    this.totalFormatted = totalFormatted;
	}

	public int getOrderId() {
		return orderId;
	}



	public String getSignatureStatus() {
		return SignatureStatus;
	}



	public void setSignatureStatus(String signatureStatus) {
		SignatureStatus = signatureStatus;
	}



	public int getUserId() {
		return userId;
	}



	public String getSignature() {
		return signature;
	}



	public void setSignature(String signature) {
		this.signature = signature;
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
