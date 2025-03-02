package controller;

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

@WebServlet("/reset")
public class ResetPassController extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ILoginService loginService;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		if (session.getAttribute("user") != null) {
			req.getRequestDispatcher("webPage/login/reset-pass.jsp").forward(req, resp);
		} else {
			String mess = "Hãy đăng nhập để có thể đổi mật khẩu";
			req.setAttribute("mess", mess);
			req.getRequestDispatcher("webPage/login/login.jsp").forward(req, resp);
		}

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");
		String pass = req.getParameter("pass");
		String rePass = req.getParameter("rePass");
		  String lang = (String) session.getAttribute("lang");
		    if (lang == null) {
		        lang = "vi";
		    }
		    Locale locale = Locale.forLanguageTag(lang);
		    ResourceBundle bundle = ResourceBundle.getBundle("messages", locale);
		if(pass.trim().length() < 8) {
			String mess =  bundle.getString("password.length.required");
			req.setAttribute("mess", mess);
			doGet(req, resp);
		}
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
