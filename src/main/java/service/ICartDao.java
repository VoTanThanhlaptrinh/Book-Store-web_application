package service;

import java.util.List;

import models.Cart;

public interface ICartDao {
	List<Cart> getCartByUserId(int userId);
	
	void saveCart(Cart cart);
	
	void updateCart(Cart cart);
}
