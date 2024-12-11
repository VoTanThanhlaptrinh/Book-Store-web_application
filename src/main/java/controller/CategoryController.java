package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Product;
import service.CategoriesServiceImp;
import service.ICategoriesService;

@WebServlet("/tim-sach")
public class CategoryController extends HttpServlet {
	private ICategoriesService categoriesService;
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String pageNum = req.getParameter("pageNum");
		int page = 1;
		if (pageNum != null) {
			page = Integer.valueOf(pageNum);
		}
		List<Product> products = categoriesService.getProductByPage(page, 4);
		int row = products.size() / 4;
		int elementsLastRow = products.size() % 4;
		if (elementsLastRow == 0) {
			row--;
			elementsLastRow = 4;
		}
		if(products.size() < 4) {
			elementsLastRow = products.size();
		}
		req.setAttribute("lastRow", elementsLastRow);
		req.setAttribute("row", row);
		req.setAttribute("products", products);

		req.getRequestDispatcher("webPage/categoryAndSingle/categories.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub

	}

	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		categoriesService = new CategoriesServiceImp();
	}
}
