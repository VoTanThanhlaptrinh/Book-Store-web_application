package models;

import java.sql.Date;
import java.util.Objects;

public class CartProductDetail {
	int cartItemId;
	int productId;
	String name;
	int quantity;
	Date createDate;
	double price;
	int imgId;
	int pd_Quantity;

	public CartProductDetail(int cartItemId, int productId, String name, int quantity, Date createDate, double price,
			int imgId,int pd_Quantity) {
		super();
		this.cartItemId = cartItemId;
		this.productId = productId;
		this.name = name;
		this.quantity = quantity;
		this.createDate = createDate;
		this.price = price;
		this.imgId = imgId;
		this.pd_Quantity = pd_Quantity;
	}

	public CartProductDetail(int cartItemId, int productId, String name, int quantity, double price,
			int imgId) {
		super();
		this.cartItemId = cartItemId;
		this.productId = productId;
		this.name = name;
		this.quantity = quantity;
		this.price = price;
		this.imgId = imgId;
	}
	public CartProductDetail() {
		// TODO Auto-generated constructor stub
	}


	public int getCartItemId() {
		return cartItemId;
	}


	public void setCartItemId(int cartItemId) {
		this.cartItemId = cartItemId;
	}


	public int getPd_Quantity() {
		return pd_Quantity;
	}


	public void setPd_Quantity(int pd_Quantity) {
		this.pd_Quantity = pd_Quantity;
	}


	public int getProductId() {
		return productId;
	}


	public void setProductId(int productId) {
		this.productId = productId;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public int getQuantity() {
		return quantity;
	}


	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}


	public Date getCreateDate() {
		return createDate;
	}


	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}


	public double getPrice() {
		return price;
	}


	public void setPrice(double price) {
		this.price = price;
	}


	public int getImgId() {
		return imgId;
	}


	public void setImgId(int imgId ) {
		this.imgId = imgId;
	}


	@Override
	public String toString() {
		return "CartProductDetail [cartItemId=" + cartItemId + ", productId=" + productId + ", name=" + name
				+ ", quantity=" + quantity + ", createDate=" + createDate + ", price=" + price + ", imgId=" + imgId
				+ "]"; 
	}

	@Override
	public int hashCode() {
		return Objects.hash(cartItemId, createDate, imgId, name, pd_Quantity, price, productId, quantity);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CartProductDetail other = (CartProductDetail) obj;
		return cartItemId == other.cartItemId && Objects.equals(createDate, other.createDate) && imgId == other.imgId
				&& Objects.equals(name, other.name) && pd_Quantity == other.pd_Quantity
				&& Double.doubleToLongBits(price) == Double.doubleToLongBits(other.price)
				&& productId == other.productId && quantity == other.quantity;
	}
	
	
	
}
