package admin.controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.User;
import service.ILoginService;
import service.LoginService;
@WebServlet("/admin/role-list")
public class RoleAdminListController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ILoginService loginService;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String pageNum = req.getParameter("pageNum");
        int page = 1;
        int pageSize = 10; // Số sản phẩm mỗi trang

        if (pageNum != null && !pageNum.isEmpty()) {
            page = Integer.parseInt(pageNum);
        }

        // Lấy danh sách sản phẩm theo trang
        List<User> users = loginService.getListUser(page, pageSize);
        List<Integer> imgIds = loginService.getListImgIds(users);

        // Tính tổng số user 
        int totalUser = loginService.getTotalUsers(); 
        int totalPages = (int) Math.ceil((double) totalUser / pageSize); // Tính tổng số trang

        // Truyền dữ liệu sang JSP
        req.setAttribute("users", users);
        req.setAttribute("imgIds", imgIds);
        req.setAttribute("currentPage", page);
        req.setAttribute("totalPages", totalPages);
		req.getRequestDispatcher("/webPage/admin/role-list.jsp").forward(req, resp);
	}
	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		loginService = new LoginService();
	}
}
