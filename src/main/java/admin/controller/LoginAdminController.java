package admin.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.User;
import service.ILoginService;
import service.LoginService;
@WebServlet("/admin/login")
public class LoginAdminController extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ILoginService loginService;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.getRequestDispatcher("/webPage/admin/auth-signin.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession();
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		User user = loginService.checkUser(username, password);
		session.setAttribute("user", user);
		String previousUrl = (String) session.getAttribute("previousUrl");
		if(previousUrl == null) {
			session.removeAttribute("previousUrl");
			doGet(req, resp);
			return;
		}
		resp.sendRedirect(previousUrl);
		session.removeAttribute("previousUrl");
	}
	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		loginService = new LoginService();
	}
}
