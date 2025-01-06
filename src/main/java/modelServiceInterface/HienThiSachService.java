package modelServiceInterface;

import java.util.List;

import models.Product;

public interface HienThiSachService {
	List<Product> hienthidanhsachtatcasach();

	Product hienThiSachTheoId(int id);

	List<Product> hienThiSachTheoTen(String title);

	List<Product> hienThiSachTheoTheLoai(String type);

	List<Product> hienthisachtheoGia(double gia, int duoi_tren, int phamvi);

	List<Product> hienThiNgauNhienSoSanPham(int num);

	List<Product> getTopProductsById(int num);

	List<Product> hienThiSachTheoTheLoaiVaTen(String type, String title);

	List<Product> hienThiDanhSachTrongTheLoai(String category, String titleKeyword, int pageNum, int quantity);
}
