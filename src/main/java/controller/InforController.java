package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.Information;
import models.User;
import service.LoginService;

@WebServlet("/infor")
public class InforController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.setCharacterEncoding("UTF-8");
		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");
		if (user == null) {
			resp.sendRedirect("home");
		} else {
			LoginService loginService = (LoginService) session.getAttribute("loginService");
			Information information = loginService.getInforOfUser(user.getInfoId());
			if (information == null) {
				information = new Information();
				session.setAttribute("command", "insert");
			} else {
				session.setAttribute("command", "update");
			}
			session.setAttribute("infor", information);
			req.getRequestDispatcher("webPage/login/infor.jsp").forward(req, resp);
		}

	}
}