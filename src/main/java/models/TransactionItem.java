package models;

import java.util.Date;

public class TransactionItem {
	private int transactionItemId;
    private int transactionId;
    private int orderItemId;
    private int quantity;
    private double price;
    private Date createDate;
    private Date updateDate;
	public TransactionItem(int transactionItemId, int transactionId, int orderItemId, int quantity, double price,
			Date createDate, Date updateDate) {
		super();
		this.transactionItemId = transactionItemId;
		this.transactionId = transactionId;
		this.orderItemId = orderItemId;
		this.quantity = quantity;
		this.price = price;
		this.createDate = createDate;
		this.updateDate = updateDate;
	}
	public TransactionItem() {
		super();
	}
    
}
