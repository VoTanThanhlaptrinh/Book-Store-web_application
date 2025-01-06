package service;

import java.util.List;

import daoImp.ProductDAOImp;
import daoInterface.IProductDao;
import models.Product;

public class CategoriesServiceImp implements ICategoriesService {
	private IProductDao productDao;

	public CategoriesServiceImp() {
		productDao = new ProductDAOImp();
	}

	@Override
	public List<Product> getProductByPage(int pageNum, int quantity) {
		return productDao.getProductFollowPage(pageNum, quantity);
	}

	@Override
	public Product getProductByProductId(int id) {
		return productDao.findByProductId(id);
	}

	@Override
	public void saveProduct(Product p) {
		// TODO Auto-generated method stub
		productDao.saveProduct(p);
	}
}
