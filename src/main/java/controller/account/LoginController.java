package controller.account;

import java.io.IOException;
import java.util.Locale;
import java.util.ResourceBundle;

import org.apache.commons.lang3.RandomStringUtils;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.Cart;
import models.Log;
import models.User;
import service.ILogService;
import service.ILoginService;
import service.LogServiceImpl;
import service.LoginService;
import service.LoginSpamService;
import service.SendMailQueueService;
import serviceImplement.HienThiDanhSachImp;
import serviceImplement.HienThiDonTrongGioHangImplement;

@WebServlet("/login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private ILoginService loginService;
	private ILogService logService;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		if (session.getAttribute("user") != null) {
			resp.sendRedirect("home");
			return;
		}
		String mess = (String) session.getAttribute("loginMessage");
		session.removeAttribute("loginMessage");
		req.setAttribute("loginMessage", mess);
		req.getRequestDispatcher("webPage/login/login.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession();

		String lang = (String) session.getAttribute("lang");
		if (lang == null) {
			lang = "vi";
		}
		Locale locale = Locale.forLanguageTag(lang);
		ResourceBundle bundle = ResourceBundle.getBundle("messages", locale);

		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String productId = req.getParameter("productId");

		// kiểm tra username có rỗng không
		if (username == null || username.trim().isEmpty()) {
			session.setAttribute("loginMessage", bundle.getString("email.null"));
			doGet(req, resp);
			return;
		}
		// kiểm tra password có rỗng không
		if (password == null || password.trim().isEmpty()) {
			session.setAttribute("loginMessage", bundle.getString("password.null"));
			doGet(req, resp);
			return;
		}
		// kiểm tra spam đăng nhập
		if (LoginSpamService.checkSpam(username)) {
			logService.warning(new Log(13, "warning", "/admin/login", "User",
					String.format("Có ai đó cố gắng truy cập vào tài khoản có email: %s", username)));
			session.setAttribute("loginMessage", bundle.getString("login.spam"));
			doGet(req, resp);
			return;
		}
		User user = loginService.checkUser(username, password);

		// kiểm tra username và password có khớp hay không
		if (user == null) {
			session.setAttribute("loginMessage", bundle.getString("incorrect.password"));
			doGet(req, resp);
			return;
		}
		if (!user.isActivate()) {
			session.setAttribute("loginMessage", bundle.getString("inactivated"));
			sendCodeConfirm(session,bundle,user);
			resp.sendRedirect("confirm"); // di chuyển sang trang confirm
			return;
		}
		LoginSpamService.removeUser(username);

		HienThiDonTrongGioHangImplement htGioHang = new HienThiDonTrongGioHangImplement(user);
		htGioHang.taoGioHang(user.getUserId());
		Cart cart = htGioHang.layGioHang(user.getUserId());
		session.setAttribute("loginService", loginService);
		session.setAttribute("cart", cart);
		session.setAttribute("user", user);

//		String previousURL = (String) session.getAttribute("previousURL");
//		if (previousURL != null) {
//			resp.sendRedirect(previousURL);
//			session.removeAttribute("previousURL");
//			return;
//		}
		logService.info(new Log(user.getUserId(), "info", "User", "/login", "đăng nhập thành công"));

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
		loginService = new LoginService();
		logService = new LogServiceImpl();
	}

	private void sendCodeConfirm(HttpSession session, ResourceBundle bundle, User user) {
		String code = RandomStringUtils.randomAlphanumeric(6); // tạo random mã để gửi email xác thực
		session.setAttribute("checkEmail", user.getEmail());
		String content = bundle.getString("verification.code") + code;
		SendMailQueueService.getInstance().sendMail(user.getEmail(), content,
				bundle.getString("account.registration.verification"), code);
	}
}
