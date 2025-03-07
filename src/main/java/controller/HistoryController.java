package controller;

import java.io.IOException;
import java.util.List;
import java.util.Locale;
import java.util.ResourceBundle;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.Cart;
import models.CartProductDetail;
import models.User;
import service.EvaluateService;
import service.IEvaluateService;
import serviceImplement.HienThiDonTrongGioHangImplement;

@WebServlet("/history")
public class HistoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	private IEvaluateService evaluateService;

	public HistoryController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		String lang = (String) session.getAttribute("lang");
		if (lang == null) {
			lang = "vi";
		}
		Locale locale = Locale.forLanguageTag(lang);
		ResourceBundle bundle = ResourceBundle.getBundle("messages", locale);
		if (user == null) {
			String loginMessage = bundle.getString("error.notLoggedIn");
			session.setAttribute("loginMessage", loginMessage);
			response.sendRedirect("login");
			return;
		} else {
			Cart cart = (Cart) session.getAttribute("cart");
			HienThiDonTrongGioHangImplement htGioHang = new HienThiDonTrongGioHangImplement(user);
			System.out.println("id gio hang: " + cart.getCartId());
			List<CartProductDetail> ls = htGioHang.hienThiGioHang(cart.getCartId(), "checked");
			System.out.println("so luong hang da mua: " + ls.size());
			request.setAttribute("evaluate", evaluateService);
			request.setAttribute("history", ls);
			request.getRequestDispatcher("webPage/giohang/history.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		evaluateService = new EvaluateService();
	}
}
