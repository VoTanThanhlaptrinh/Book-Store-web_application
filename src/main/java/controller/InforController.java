package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
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
			Information information = loginService.getInforOfUser(user.getUserId());
			String path;
			if (information == null) {
				path = "webPage/img/avatar/avatar.jpg";
				session.setAttribute("command", "insert");
			} else {
				path = "getImage?img_id=" + information.getImgId();
				session.setAttribute("command", "update");
			}
			req.setAttribute("accountImg", path);
			req.setAttribute("infor", information);
			req.getRequestDispatcher("/webPage/login/infor.jsp").forward(req, resp);
		}
	}
}
