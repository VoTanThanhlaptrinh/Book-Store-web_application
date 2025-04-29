package controller.account;

import java.io.IOException;
import java.util.Locale;
import java.util.ResourceBundle;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.Cart;
import models.User;
import service.ILoginService;
import service.LoginService;
import serviceImplement.HienThiDanhSachImp;
import serviceImplement.HienThiDonTrongGioHangImplement;

@WebServlet("/login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private ILoginService loginService;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		if (session.getAttribute("user") != null) {
			resp.sendRedirect("home");
		} else {
			String mess = (String) session.getAttribute("loginMessage");
			session.removeAttribute("loginMessage");
			req.setAttribute("loginMessage", mess);
			req.getRequestDispatcher("webPage/login/login.jsp").forward(req, resp);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String productId = req.getParameter("productId");

		User user = loginService.checkUser(username, password);
		HttpSession session = req.getSession();

		String lang = (String) session.getAttribute("lang");
		if (lang == null) {
			lang = "vi";
		}
		Locale locale = Locale.forLanguageTag(lang);
		ResourceBundle bundle = ResourceBundle.getBundle("messages", locale);
		if (user == null) {
			String mess = bundle.getString("incorrect.password");
			req.setAttribute("mess", mess);
			doGet(req, resp);
			return;
		}

		HienThiDonTrongGioHangImplement htGioHang = new HienThiDonTrongGioHangImplement(user);
		htGioHang.taoGioHang(user.getUserId());
		Cart cart = htGioHang.layGioHang(user.getUserId());
		session.setAttribute("loginService", loginService);
		session.setAttribute("cart", cart);
		session.setAttribute("user", user);

		String previousURL = (String) session.getAttribute("previousURL");
		if (previousURL != null) {
			resp.sendRedirect(previousURL);
			session.removeAttribute("previousURL");
			return;
		}
		if (user != null && !productId.equals("")) {
			HienThiDanhSachImp ds = new HienThiDanhSachImp();
			req.setAttribute("product", ds.hienThiSachTheoId(Integer.parseInt(productId)));
			resp.sendRedirect("chi-tiet-sach?id=" + productId);
		} else if (user != null && productId.equals("")) {
			resp.sendRedirect("home");
		}
	}

	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		loginService = new LoginService();
	}

}
