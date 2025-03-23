package controller.category_checkout;

import java.io.IOException;
import java.sql.Date;
import java.util.Locale;
import java.util.ResourceBundle;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String id = request.getParameter("id");
		User user = (User) session.getAttribute("user");

		String title = request.getParameter("title");
		String quantity = request.getParameter("amount");
		String pdQuantity = request.getParameter("pdQuantity");

		// Lấy ngôn ngữ từ session hoặc mặc định là "vi"
		String lang = (String) session.getAttribute("lang");
		if (lang == null) {
			lang = "vi";
		}
		Locale locale = Locale.forLanguageTag(lang);
		ResourceBundle bundle = ResourceBundle.getBundle("messages", locale);

		if (user == null) {
			String loginMessage = bundle.getString("error.notLoggedIn");
			request.setAttribute("productId", id);
			session.setAttribute("loginMessage", loginMessage);
			response.sendRedirect("login");
			return;
		} else {
			HienThiDonTrongGioHangImplement htDon = new HienThiDonTrongGioHangImplement(user);
			Date currentDate = new Date(System.currentTimeMillis());

			if (Integer.parseInt(pdQuantity) < Integer.parseInt(quantity)) {
				String noticeMess = bundle.getString("error.exceedsQuantity");
				request.setAttribute("noMess", noticeMess);
				request.getRequestDispatcher("webPage/categoryAndSingle/single.jsp").forward(request, response);
				return;
			}
			CartItem item;
			try {
				Cart cart = htDon.layGioHang(user.getUserId());
				item = new CartItem(cart.getCartId(), Integer.parseInt(quantity), Integer.parseInt(id), currentDate,
						currentDate);
				if (cart.getStatus().equals("empty")) {
					String status = bundle.getString("cart.statusActive");
					htDon.themVaoGioHang(item);
					htDon.capNhatTrangThaiGioHang(cart.getCartId(), status, currentDate);
				} else {
					htDon.themVaoGioHang(item);
				}
			} catch (NumberFormatException e) {
				String failedMessage = bundle.getString("error.invalidInput");
				request.setAttribute("failedMess", failedMessage);
				request.getRequestDispatcher("webPage/categoryAndSingle/single.jsp").forward(request, response);
				return;
			}

			request.setAttribute("title", title);
			String successMessage = bundle.getString("success.addToCart").replace("{0}", title).replace("{1}",
					quantity);
			session.setAttribute("message1", successMessage);

			response.sendRedirect("search");
		}
	}
}
