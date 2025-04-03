package service;

import java.util.List;

import models.Product;

public interface ICategoriesService {
	List<Product> getProductByPage(int pageNum, int quantity);

	Product getProductByProductId(int id);
	
	void saveProduct(Product p);
	
	List<Product> getProducts();

	int getTotalProducts();
}
