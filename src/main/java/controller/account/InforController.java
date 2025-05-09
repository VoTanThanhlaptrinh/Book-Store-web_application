package controller.account;

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
		LoginService loginService = (LoginService) session.getAttribute("loginService");
		if(loginService == null) {
			loginService = new LoginService();
		}
		if (user == null) {
			resp.sendRedirect("home");
		} else {
			
			Information information = loginService.getInforOfUser(user.getUserId());
			String path;
			if (information == null) {
				path = "webPage/img/avatar/avatar.jpg";
			} else {
				path = "getImage?img_id=" + information.getImgId();
			}
			req.setAttribute("accountImg", path);
			req.setAttribute("infor", information);
			req.getRequestDispatcher("/webPage/login/infor.jsp").forward(req, resp);
		}
	}
}
