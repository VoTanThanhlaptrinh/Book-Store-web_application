package controller;


import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		
	}

}
