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
import models.User;
import service.ILoginService;
import service.LoginService;

@WebServlet("/confirm")
public class ConfirmEmailController extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ILoginService loginService;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.getRequestDispatcher("webPage/login/confirm.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();

		User user = (User) session.getAttribute("user"); // Lấy ra thông tin user đã đăng nhập
		String code = req.getParameter("conCode"); // lấy code từ input của người dùng
		String confirmCode = (String) session.getAttribute("confirmCode"); // lấy code được gửi từ mail đặt trong session

		String lang = (String) session.getAttribute("lang");
		if (lang == null) {
			lang = "vi";
		}
		Locale locale = Locale.forLanguageTag(lang);
		ResourceBundle bundle = ResourceBundle.getBundle("messages", locale);

		// Tránh người dùng đi vào confirm nhập code khi gmail chưa gửi
		// gây ra lỗi null poiter exception khi confirmCode gọi phương thức equal
		if (confirmCode == null) {
			req.setAttribute("mess", bundle.getString("confirmCode.error"));
			doGet(req, resp);
			return;
		}
		// mã xác thực giống nhau thì xác thực tài khoản và quay trở về trang trước đó.
		if (confirmCode.equals(code)) {
			user.setActivate(true);
			loginService.activateUser(user);
			session.setAttribute("user", user);
			session.removeAttribute("confirmCode");
			String previousURL = (String) session.getAttribute("previousURL");
			if (previousURL != null) {
				resp.sendRedirect(previousURL);
				session.removeAttribute("previousURL");
				return;
			}
			resp.sendRedirect("login");
		} else {
			req.setAttribute("mess", bundle.getString("auth.code.invalid"));
			doGet(req, resp);
			return;
		}
	}

	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		loginService = new LoginService();
	}
}
