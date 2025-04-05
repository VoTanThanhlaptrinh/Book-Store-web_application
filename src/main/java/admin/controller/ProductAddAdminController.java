package admin.controller;

import java.io.IOException;
import java.util.List;

import daoImp.FilterDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Category;
@WebServlet("/admin/product-add")
public class ProductAddAdminController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private FilterDAO filterDAO;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// tìm và truyền danh sách category
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
