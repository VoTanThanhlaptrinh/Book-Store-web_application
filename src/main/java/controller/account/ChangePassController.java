package controller.account;

import java.io.IOException;
import java.util.Locale;
import java.util.ResourceBundle;

import org.mindrot.jbcrypt.BCrypt;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.User;
import service.ILoginService;
import service.LoginService;

@WebServlet("/changePass")
public class ChangePassController extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ILoginService loginService;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("webPage/login/changePass.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");
		// lấy ra thông tin mật khẩu cũ, mới và xác nhận
		String oldPass = req.getParameter("oldPass");
		String pass = req.getParameter("pass");
		String rePass = req.getParameter("rePass");

		// kiểm tra ngôn ngữ có null hay không
		String lang = (String) session.getAttribute("lang");
		if (lang == null) {
			lang = "vi";
		}
		Locale locale = Locale.forLanguageTag(lang);
		ResourceBundle bundle = ResourceBundle.getBundle("messages", locale);

		// kiểm tra xem người dùng có nhập thiếu thông tin không
		if (oldPass == null || oldPass.isEmpty() || pass == null || pass.isEmpty() || rePass == null
				|| rePass.isEmpty()) {
			String mess = bundle.getString("missing.information");
			req.setAttribute("mess", mess);
			doGet(req, resp);
			return;
		}
		// kiểm tra mật khẩu cũ với mật khẩu người dùng nhập có khớp không
		if (!BCrypt.checkpw(oldPass, user.getPassword())) {
			String mess = bundle.getString("oldPass.notmatch");
			req.setAttribute("mess", mess);
			doGet(req, resp);
			return;
		}
		// kiểm tra mật khẩu mới có 8 ký tự không
		if (pass.trim().length() < 8) {
			String mess = bundle.getString("password.length.required");
			req.setAttribute("mess", mess);
			doGet(req, resp);
			return;
		}
		// kiểm tra xác nhận mật khẩu và mật khẩu
		if (pass.equals(rePass)) {
			user.setPassword(loginService.hashPass(pass));
			loginService.updateUser(user);
			resp.sendRedirect("logout");
		} else {
			String mess = bundle.getString("password.confirmation.mismatch2");
			req.setAttribute("mess", mess);
			doGet(req, resp);
		}
	}

	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		loginService = new LoginService();
	}

}
