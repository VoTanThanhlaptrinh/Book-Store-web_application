package models;

import java.sql.Date;

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
	

	public Cart(int userId, String status, Date createDate, Date updateDate) {
		super();
		this.userId = userId;
		this.status = status;
		this.createDate = createDate;
		this.updateDate = updateDate;
	}


	public Cart() {
		super();
	}
	public int getCartId() {
		return cartId;
	}
	public int getUserId() {
		return userId;
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
    
}
