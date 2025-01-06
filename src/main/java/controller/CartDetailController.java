package controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.Cart;
import models.CartItem;
import models.User;
import serviceImplement.HienThiDonTrongGioHangImplement;
@WebServlet("/add-to-cart")
public class CartDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		String id =  request.getParameter("id");
		User user = (User) session.getAttribute("user");
		
		String title = request.getParameter("title");
		String quantity = request.getParameter("amount");
		String pdQuantity = request.getParameter("pdQuantity");
		
		if (user == null) {
			String loginMessage = "bạn chưa đăng nhập, đăng nhập để tiếp tục";
			request.setAttribute("productId", id);
			request.setAttribute("loginMessage", loginMessage);
			request.getRequestDispatcher("webPage/login/login.jsp").forward(request, response);
		}
		else {
		HienThiDonTrongGioHangImplement htDon = new HienThiDonTrongGioHangImplement(user);
		Date currentDate = new Date(System.currentTimeMillis());
		if (Integer.parseInt(pdQuantity) < Integer.parseInt(quantity)) {
			String noticeMess = "đặt quá số lượng quy định";
			request.setAttribute("noMess", noticeMess);
			request.getRequestDispatcher("webPage/categoryAndSingle/single.jsp").forward(request, response);
		}  
		
		CartItem item;
		try {
			Cart cart = htDon.layGioHang(user.getUserId());
		item = new CartItem(cart.getCartId(), Integer.parseInt(quantity),Integer.parseInt(id) , currentDate, currentDate);
		if (cart.getStatus().equals("empty")) {
			String status = "active"; 		
			htDon.themVaoGioHang(item);
			htDon.capNhatTrangThaiGioHang(cart.getCartId(), status,currentDate);
		}	
		else {
			htDon.themVaoGioHang(item);
		}
		} catch (NumberFormatException e) {
			// TODO: handle exception
			String failedMessage = "Số nhập vào không hợp lệ, mời nhập lại";
			request.setAttribute("failedMess", failedMessage);
			request.getRequestDispatcher("webPage/categoryAndSingle/single.jsp").forward(request, response);
		}
		
		
	
		
		request.setAttribute("title", title);
		String successMessage = "Đã thêm '" + title + "' vào giỏ hàng thành công!--số lượng: " + quantity ;
		request.setAttribute("message", successMessage);
		request.getRequestDispatcher("webPage/categoryAndSingle/categories.jsp").forward(request, response);
		}
		
	}

}
