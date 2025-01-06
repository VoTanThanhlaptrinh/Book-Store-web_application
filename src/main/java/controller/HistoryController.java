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

@WebServlet("/history")
public class HistoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HistoryController() {
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
		HienThiDonTrongGioHangImplement htGioHang = new HienThiDonTrongGioHangImplement(user);
		
		System.out.println("id gio hang: " +  cart.getCartId());
		List<CartProductDetail> ls  = htGioHang.hienThiGioHang(cart.getCartId(), "checked");
		
		System.out.println("so luong hang da mua: " + ls.size());
		
		request.setAttribute("history", ls);
		request.getRequestDispatcher("webPage/giohang/history.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
