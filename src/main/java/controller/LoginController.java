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

@WebServlet("/login")
public class LoginController extends HttpServlet {
	private ILoginService loginService;
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("webPage/login/login.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		User user = loginService.checkUser(username, password);
		if (user != null) {
			HttpSession session = req.getSession();
			session.setAttribute("loginService", loginService);
			session.setAttribute("user", user);
			resp.sendRedirect("home");
		} else {
			String mess = "Sai mật khẩu";
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
