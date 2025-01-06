package daoInterface;

import java.util.List;

import models.Product;
import models.User;

public interface IProductDao {
	List<Product> getProducts();

	Product findByProductId(int productId);

	int saveProduct(Product product, User user);

	void updateProduct(Product product);

	void deleteProduct(Product product);

	List<Product> getProductFollowPage(int pageNumber, int quantity);

	int getQuantityOfProduct();

	List<Product> getProductsByName(String name);

	List<Product> getProductsByType(String type);

	List<Product> getProductsByTypeAndTitle(String type, String title);

	List<Product> getListOfTitleByCategory(String category, String titleKeyword, int pageNum, int quantity);
}
