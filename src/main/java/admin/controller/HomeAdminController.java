package admin.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.Information;
import models.User;
import service.ILoginService;
import service.LoginService;
@WebServlet("/admin/home")
public class HomeAdminController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ILoginService loginService;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession();
		
		String mess = (String) session.getAttribute("mess");
		if(mess != null) {
			session.removeAttribute("mess");
			req.setAttribute("mess", mess);
		}
		User user = (User) session.getAttribute("user");
		
		Information information = loginService.getInforOfUser(user.getUserId());
		String path;
		if (information == null) {
			path = "../webPage/img/avatar/avatar.jpg";
		} else {
			path = "../getImage?img_id=" + information.getImgId();
		}
		session.setAttribute("accountImg", path);
		req.getRequestDispatcher("/webPage/admin/index.jsp").forward(req, resp);
	}
	@Override
	public void init() throws ServletException {
		loginService = new LoginService();
	}
}
