package service;

import java.util.List;

import models.Product;


public interface IProductDao {
	List<Product> getUsers();

	Product findByProductId(int productId);

	void saveProduct(Product product);

	void updateProduct(Product product);
	
	
}
