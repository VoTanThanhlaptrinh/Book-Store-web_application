package serviceImplement;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import daoImp.ProductDAOImp;
import modelServiceInterface.HienThiSachService;
import models.Product;

public class HienThiDanhSachImp implements HienThiSachService{

	ProductDAOImp productDao = new ProductDAOImp();
	
	List<Product> products = productDao.getProducts();
	
	
	@Override
	public List<Product> hienthidanhsachtatcasach() {
        return new ArrayList<>(products);
    }

	@Override
    public Product hienThiSachTheoId(int id) {
        return productDao.findByProductId(id);
    }

	@Override
    public List<Product> hienThiSachTheoTen(String title) {
        return productDao.getProductsByName(title);
    }

	@Override
    public List<Product> hienThiSachTheoTheLoai(String type) {
		return productDao.getProductsByType(type);
    }
	
	@Override
	public List<Product> hienThiNgauNhienSoSanPham(int num) {
		return productDao.getRandomProducts(num);
	}
	@Override
	public List<Product> hienthisachtheoGia(double gia, int duoi_tren, int phamvi) {
	    List<Product> sortedProducts = new ArrayList<>();

	    
	    for (Product product : products) {
	        if ((duoi_tren == 0 && product.getPrice() >= gia) || 
	            (duoi_tren == 1 && product.getPrice() <= gia)) {
	            sortedProducts.add(product);
	        }
	    }

	   
	    if (duoi_tren == 0) {
	     
	        Collections.sort(sortedProducts, new Comparator<Product>() {
	            @Override
	            public int compare(Product p1, Product p2) {
	                return Double.compare(p1.getPrice(), p2.getPrice());
	            }
	        });
	    } else {
	       
	        Collections.sort(sortedProducts, new Comparator<Product>() {
	            @Override
	            public int compare(Product p1, Product p2) {
	                return Double.compare(p2.getPrice(), p1.getPrice());
	            }
	        });
	    }
	    List<Product> result = new ArrayList<>();
	    for (int i = 0; i < phamvi && i < sortedProducts.size(); i++) {
	        result.add(sortedProducts.get(i));
	    }

	    return result;
	}

	@Override
	public List<Product> getTopProductsById(int num) {
		// TODO Auto-generated method stub
		return productDao.getTopProductsById(num);
	}

	@Override
	public List<Product> hienThiDanhSachTrongTheLoai(String category, String titleKeyword, int pageNum, int quantity) {
		// TODO Auto-generated method stub
		return productDao.getListOfTitleByCategory(category, titleKeyword, pageNum, quantity);
	}

	@Override
	public List<Product> hienThiSachTheoTheLoaiVaTen(String type, String title) {
		// TODO Auto-generated method stub
		return productDao.getProductsByTypeAndTitle(type, title);
	}


	
}
