package admin.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.CategoriesServiceImp;
import service.ICategoriesService;
@WebServlet("/admin/product-edit")
public class ProductEditAdminController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ICategoriesService categoriesService;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int productId = Integer.valueOf(req.getParameter("productId"));
		req.setAttribute("product", categoriesService.getProductByProductId(productId));
		req.getRequestDispatcher("/webPage/admin/product-edit.jsp").forward(req, resp);
	}
	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		categoriesService = new CategoriesServiceImp();
	}
}
