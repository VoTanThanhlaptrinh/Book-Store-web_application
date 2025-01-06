package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.User;
import models.Cart;
import service.ILoginService;
import service.LoginService;
import serviceImplement.HienThiDanhSachImp;
import serviceImplement.HienThiDonTrongGioHangImplement;

import java.io.IOException;

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
		if (user == null) {
			String mess = "Sai mật khẩu";
			req.setAttribute("mess", mess);
			doGet(req, resp);
		}
		HttpSession session = req.getSession();
		HienThiDonTrongGioHangImplement htGioHang = new HienThiDonTrongGioHangImplement(user);
		htGioHang.taoGioHang(user.getUserId());
		Cart cart = htGioHang.layGioHang(user.getUserId());
		session.setAttribute("loginService", loginService);
		session.setAttribute("cart", cart);
		session.setAttribute("user", user);

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
