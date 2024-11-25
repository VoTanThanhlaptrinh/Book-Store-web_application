package models;

import java.sql.Date;

public class CartItem {
	private int cartItemId;
    private int cartId;
    private int quantity;
    private int productId;
    private Date createDate;
    private Date updateDate;
	public CartItem(int cartItemId, int cartId, int quantity, int productId, Date createDate, Date updateDate) {
		super();
		this.cartItemId = cartItemId;
		this.cartId = cartId;
		this.quantity = quantity;
		this.productId = productId;
		this.createDate = createDate;
		this.updateDate = updateDate;
	}
	
	public CartItem(int cartId, int quantity, int productId, Date createDate, Date updateDate) {
		super();
		this.cartId = cartId;
		this.quantity = quantity;
		this.productId = productId;
		this.createDate = createDate;
		this.updateDate = updateDate;
	}

	public CartItem() {
		
	}
	public int getCartItemId() {
		return cartItemId;
	}
	public int getCartId() {
		return cartId;
	}
	public int getQuantity() {
		return quantity;
	}
	public int getProductId() {
		return productId;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	
}
