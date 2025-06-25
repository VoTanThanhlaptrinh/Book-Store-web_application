package models;

import java.util.Date;

public class OrderItem {
	private int orderItemId;
    private int orderId;
    private int productId;
    private int quantity;
    private double price;
    private Date createDate;
    private Date updateDate;
	public OrderItem(int orderItemId, int orderId, int productId, int quantity, double price, Date createDate,
			Date updateDate) {
		super();
		this.orderItemId = orderItemId;
		this.orderId = orderId;
		this.productId = productId;
		this.quantity = quantity;
		this.price = price;
		this.createDate = createDate;
		this.updateDate = updateDate;
	}
	public OrderItem() {
		super();
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	

}
