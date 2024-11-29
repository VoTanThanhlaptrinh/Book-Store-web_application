package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import exeption.SqlException;
import service.ILoginService;
import service.LoginService;

@WebServlet("/register")
public class RegisterController extends HttpServlet {
	private ILoginService loginService;
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("webPage/login/register.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		boolean success = false;
		HttpSession session = req.getSession();
		String username = req.getParameter("username");
		String pass = req.getParameter("password");
		String email = req.getParameter("email");
		String rePassword = req.getParameter("rePassword");
		String accept = req.getParameter("agreeTerm");
		loginService = (ILoginService) session.getAttribute("loginService");
		if (loginService == null) {
			loginService = new LoginService();
		}
		String mess, warning;
		if (!pass.trim().isEmpty() && pass.equals(rePassword) && !username.trim().isEmpty() && !email.trim().isEmpty()
				&& !accept.trim().isEmpty()) {
			try {
				success = loginService.register(username, pass, email);
			} catch (SQLException | SqlException e) {
				// TODO Auto-generated catch block
				success = false;
				mess = e.getMessage();
				req.setAttribute("mess", mess);
				doGet(req, resp);
			}
		} else {
			warning = "nhập thiếu thông tin";
			req.setAttribute("warn", warning);
			doGet(req, resp);
		}

		req.setAttribute("success", success);
		if (success)
			resp.sendRedirect("login");
	}
}
