package serviceImplement;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import daoImp.CartDAOImp;
import daoImp.CartItemDAOImp;
import modelServiceInterface.GioHangInterface;
import models.Cart;
import models.CartItem;
import models.CartProductDetail;
import models.User;

public class HienThiDonTrongGioHangImplement implements GioHangInterface{

	CartItemDAOImp cartItemDao = new CartItemDAOImp();
	CartDAOImp cartDao = new CartDAOImp();
	User user;

	Cart cart;
	
	public HienThiDonTrongGioHangImplement(User user) {
		super();
		this.user = user;
		cart = cartDao.getCartByUserId(user.getUserId());
	}

	@Override
	public void themVaoGioHang(CartItem item) {
		// TODO Auto-generated method stub
		System.out.println("id " + item.getCartId());
		
		List<CartItem> ls = new ArrayList<>();
		ls.addAll(cartItemDao.getCartItemsByCartId(cart.getCartId()));
		
		if (ls.size() == 0) {
			cartItemDao.saveCartItem(item);
			return;
		}
		
		else {
			System.out.println(ls.size());
		for (CartItem it : cartItemDao.getCartItemsByCartId(cart.getCartId())) {
			if (it.getCartId() == item.getCartId() && it.getProductId() == item.getProductId() ) {
				System.out.println("có bằng");
				System.out.println(it.getStatus());
				System.out.println(item.getStatus());
				if (it.getStatus().equals("pending")) {			
					System.out.println("that su update");
					cartItemDao.updateCartItem(item.getQuantity(), item.getUpdateDate(), item.getProductId(), item.getCartId());
					return;
					}
				}
			}
		System.out.println("that su save");
		cartItemDao.saveCartItem(item);
		}
	}

	@Override 
	public List<CartProductDetail> hienThiGioHang(int cartId, String status) {
		// TODO Auto-generated method stub
		return cartItemDao.getCartProductDetails(cartId, status);
	}

  

	@Override
	   public List<CartItem> hienthiDanhSachGioHangTheoNgayCuThe(Date date) {
			return null;
    }

	@Override
    public void updateSoLuongHangCutheTrongGio(int cartItemId, int soluong) {
        
    }

	@Override
	  public List<CartItem> layHangTrongGioTheoSoLuongCodinh(int soluong) {
        List<CartItem> result = new ArrayList<>();
        
        return result;
    }

	@Override
	public void taoGioHang(int userId) {
		// TODO Auto-generated method stub
		if (cartDao.getCartByUserId(userId) != null) {
			return;
		}
		cartDao.createCart(userId);
	}

	@Override
	public Cart layGioHang(int userId) {
		// TODO Auto-generated method stub
		return cartDao.getCartByUserId(userId);
	}

	@Override
	public boolean capNhatTrangThaiHang(int cartItemId, String status) {
		// TODO Auto-generated method stub
		 return cartItemDao.updateStatusCartItem(cartItemId, status);
	}

	@Override
	public void capNhatTrangThaiGioHang(int cartId, String status, Date update_date) {
		// TODO Auto-generated method stub
		cartDao.updateCart(cartId,  status, update_date);
	}

	@Override
	public boolean capNhatSoLuongProduct(int quatity, int product_id) {
		// TODO Auto-generated method stub
		return cartItemDao.updateQuantityProduct(quatity, product_id);
	}
	
}
