package models;

import java.util.Date;

public class Cart {
	private int cartId;
    private int userId;
    private String status;
    private Date createDate;
    private Date updateDate;
	public Cart(int cartId, int userId, String status, Date createDate, Date updateDate) {
		super();
		this.cartId = cartId;
		this.userId = userId;
		this.status = status;
		this.createDate = createDate;
		this.updateDate = updateDate;
	}
	public Cart() {
		super();
	}
    
}
