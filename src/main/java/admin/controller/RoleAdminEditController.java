package admin.controller;

import java.io.IOException;

import daoImp.ResourceDAOImpl;
import daoInterface.IResourceDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.User;
import service.ILoginService;
import service.LoginService;

@WebServlet("/admin/role-edit")
public class RoleAdminEditController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ILoginService loginService;
	private User user;
	private IResourceDao resourceDao;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int userId = Integer.valueOf(req.getParameter("user_id"));
		user = loginService.getUserByUserId(userId);
		req.setAttribute("user", user);
		req.setAttribute("resources", resourceDao.getListResources());
		req.getRequestDispatcher("/webPage/admin/role-edit.jsp").forward(req, resp);
	}

	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		loginService = new LoginService();
		resourceDao = new ResourceDAOImpl();
	}

}
