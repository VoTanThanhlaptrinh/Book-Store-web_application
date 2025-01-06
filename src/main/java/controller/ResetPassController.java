package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		if(pass.trim().length() < 8) {
			String mess = "Mật khẩu phải ít nhất 8 ký tự";
			req.setAttribute("mess", mess);
			doGet(req, resp);
		}
		if (pass.equals(rePass)) {
			user.setPassword(loginService.hashPass(pass));
			loginService.updateUser(user);
			resp.sendRedirect("logout");
		} else {
			String mess = "Mật khẩu và xác nhận mật khẩu không khớp";
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
