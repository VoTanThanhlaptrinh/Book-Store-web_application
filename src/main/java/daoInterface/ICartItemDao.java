package daoInterface;

import java.util.List;

import models.CartItem;

public interface ICartItemDao {
	List<CartItem> getCartItemsByCartId(int cartId);
	
	void saveCartItem(CartItem cartItem);
	
	void updateCartItem(CartItem cartItem);
}
