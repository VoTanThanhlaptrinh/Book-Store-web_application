package daoInterface;

import models.Cart;

public interface ICartDao {
	Cart getCartByUserId(int userId);

	void saveCart(Cart cart, int userId);

	void updateCart(Cart cart);
}
