package daoInterface;

import java.util.List;

import models.Admin;
import models.Product;

public interface IProductDao {
	List<Product> getProducts();

	Product findByProductId(int productId);

	int saveProduct(Product product, Admin admin);

	void updateProduct(Product product);

	void deleteProduct(Product product);
}
