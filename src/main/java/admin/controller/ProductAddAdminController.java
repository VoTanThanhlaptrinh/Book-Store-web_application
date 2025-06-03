package admin.controller;

import java.io.IOException;
import java.util.List;
import java.util.Locale;
import java.util.ResourceBundle;

import daoImp.FilterDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.Category;
import models.User;
@WebServlet("/admin/product-add")
public class ProductAddAdminController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private FilterDAO filterDAO;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// tìm và truyền danh sách category
		HttpSession session = req.getSession();
		String lang = (String) session.getAttribute("lang");
		if (lang == null) {
			lang = "vi";
		}
		Locale locale = Locale.forLanguageTag(lang);
		ResourceBundle bundle = ResourceBundle.getBundle("messages", locale);
		
		User user = (User) session.getAttribute("user");
		if(!user.getResources().stream().anyMatch(t ->t.getUrl().contains("/api/add"))) {
			session.setAttribute("mess", bundle.getObject("error.access_denied"));
			resp.sendRedirect("home");
			return;
		}
		List<Category> categories = filterDAO.getTopCategories();
		req.setAttribute("categories", categories);
		req.getRequestDispatcher("/webPage/admin/product-add.jsp").forward(req, resp);
			
	}
	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		filterDAO = new FilterDAO();
	}
}
