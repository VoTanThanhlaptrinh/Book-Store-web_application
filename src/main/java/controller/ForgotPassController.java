package controller;

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

@WebServlet("/forgotPass")
public class ForgotPassController extends HttpServlet {
	/**
	 * 
	 */
	private ILoginService loginService;
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.getRequestDispatcher("webPage/login/forgot-pass.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String code = req.getParameter("code");
		String email = req.getParameter("email");
		HttpSession session = req.getSession();
		String checkCode = (String) session.getAttribute("checkCode");
		String checkEmail = (String) session.getAttribute("checkEmail");
		if (checkCode.equals(code) && checkEmail.equals(email)) {
			User user = loginService.getUserByMail(email);
			session.setAttribute("user", user);
			resp.sendRedirect("reset");
		} else {
			req.setAttribute("mess", "Hành động thất bại, hãy làm lại");
			doGet(req, resp);
		}
	}

	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		loginService = new LoginService();
	}
}
