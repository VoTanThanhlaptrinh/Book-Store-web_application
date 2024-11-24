package daoInterface;

import java.util.List;

import models.Admin;
import models.Image;
import models.Product;

public interface IProductDao {
	List<Product> getProducts();

	Product findByProductId(int productId);

	int saveProduct(Product product, Admin admin);

	void updateProduct(Product product, Admin admin, Image img);

	void deleteProduct(Product product);
}
