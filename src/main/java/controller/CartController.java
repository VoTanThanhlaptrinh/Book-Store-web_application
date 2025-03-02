package controller;


import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.Cart;
import models.CartProductDetail;
import models.User;
import serviceImplement.HienThiDonTrongGioHangImplement;

@WebServlet("/cart")

public class CartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		
		User user = (User) session.getAttribute("user");
		Cart cart = (Cart) session.getAttribute("cart");
		HienThiDonTrongGioHangImplement htDon = new HienThiDonTrongGioHangImplement(user);
		List<CartProductDetail> ls = htDon.hienThiGioHang(cart.getCartId(), "pending");
		
		session.setAttribute("cartProduct", ls);
		request.setAttribute("sumCart", ls.size());
		request.getRequestDispatcher("webPage/giohang/cart.jsp").forward(request, response);
	}
}
