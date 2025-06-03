package admin.controller;

import java.io.IOException;
import java.util.Locale;
import java.util.ResourceBundle;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.Log;
import models.User;
import service.ILogService;
import service.ILoginService;
import service.LogServiceImpl;
import service.LoginService;
import service.LoginSpamService;

@WebServlet("/admin/login")
public class LoginAdminController extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ILoginService loginService;
	private ILogService logService;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.getRequestDispatcher("/webPage/admin/auth-signin.jsp").forward(req, resp);
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
		// kiểm tra username có rỗng không
		if (username == null || username.trim().isEmpty()) {
			session.setAttribute("mess", bundle.getString("email.null"));
			doGet(req, resp);
			return;
		}
		// kiểm tra password có rỗng không
		if (password == null || password.trim().isEmpty()) {
			session.setAttribute("mess", bundle.getString("password.null"));
			doGet(req, resp);
			return;
		}
		// kiểm tra spam đăng nhập
		if (LoginSpamService.checkSpam(username)) {
			logService.warning(new Log(0, "warning", "/admin/login", "User",
					String.format("Có ai đó cố gắng truy cập vào tài khoản có email: %s", username)));
			session.setAttribute("messs", bundle.getString("login.spam"));
			doGet(req, resp);
			return;
		}
		User user = loginService.checkUser(username, password);

		if (user == null) {
			req.setAttribute("mess", bundle.getObject("incorrect.password"));
			doGet(req, resp);
			return;
		}
		if (!user.isRoot() && !user.isAdmin() && !user.isActivate()) {
			req.setAttribute("mess", bundle.getObject("error.access_denied"));
			doGet(req, resp);
			return;
		}
		session.setAttribute("user", user);
		String previousUrl = (String) session.getAttribute("previousUrl");
		if (previousUrl == null) {
			resp.sendRedirect("home");
			return;
		}
		resp.sendRedirect(previousUrl);
		session.removeAttribute("previousUrl");
	}

	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		loginService = new LoginService();
		logService = new LogServiceImpl();
	}
}
