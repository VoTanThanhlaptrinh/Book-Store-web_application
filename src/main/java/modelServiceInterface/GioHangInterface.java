package modelServiceInterface;

import java.sql.Date;
import java.util.List;

import models.CartItem;
import models.CartProductDetail;
import models.Cart;
public interface GioHangInterface {
	// public Cart LayGioHangBangIdNguoiDung(int userId);
	public void themVaoGioHang(CartItem item);
	public void taoGioHang(int userId);
	public List<CartProductDetail> hienThiGioHang(int cartId,String status) ; //sắp xếp theo ngày mới nhất trước (updateDate)
	public List<CartItem> hienthiDanhSachGioHangTheoNgayCuThe(Date date); 
	public void updateSoLuongHangCutheTrongGio(int cartItemId, int soluong); //cập nhật lại updateDate	
	public List<CartItem> layHangTrongGioTheoSoLuongCodinh(int soluong); //theo hienThiGioHang()
	public Cart layGioHang(int userId);
	public boolean capNhatTrangThaiHang(int cartItemId, String status);
	public void capNhatTrangThaiGioHang(int cartId, String status, Date update_date);
	public boolean capNhatSoLuongProduct(int quatity, int product_id);
}
