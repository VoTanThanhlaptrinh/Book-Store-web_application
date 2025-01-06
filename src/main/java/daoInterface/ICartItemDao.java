package daoInterface;

import java.sql.Date;
import java.util.List;

import models.CartItem;
import models.CartProductDetail;

public interface ICartItemDao {
	List<CartItem> getCartItemsByCartId(int cartId);
	
	void saveCartItem(CartItem cartItem);
	List<CartProductDetail> getCartProductDetails(int cartId, String status) ;
	void updateCartItem(int quatity, Date updateDate, int productId, int cart_id);
	boolean updateStatusCartItem(int cartItemId, String status);
	boolean updateQuantityProduct(int minusValue, int productId);
}
