package models;

import java.util.List;
import com.google.gson.annotations.SerializedName;

public class CartData {
	@SerializedName("items")
	private List<CartProductDetail> cartProductDetails;
	@SerializedName("totalOrderPrice")
	private double total;

	public CartData() {
		// TODO Auto-generated constructor stub
	}

	

	public CartData(List<CartProductDetail> cartProductDetails, double total) {
		super();
		this.cartProductDetails = cartProductDetails;
		this.total = total;
	}



	public List<CartProductDetail> getCartProductDetails() {
		return cartProductDetails;
	}


	public double getTotal() {
		return total;
	}

}
