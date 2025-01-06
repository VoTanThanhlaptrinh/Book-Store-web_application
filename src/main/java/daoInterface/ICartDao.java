package daoInterface;

import java.sql.Date;

import models.Cart;

public interface ICartDao {
	Cart getCartByUserId(int userId);
	void createCart(int userId);
	void saveCart(Cart cart, int userId);

	void updateCart(int cartId, String status, Date update_date);
}
