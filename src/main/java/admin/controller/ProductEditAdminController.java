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
import models.Product;
import service.CategoriesServiceImp;
import service.ICategoriesService;

@WebServlet("/admin/product-edit")
public class ProductEditAdminController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ICategoriesService categoriesService;
	private FilterDAO filterDAO;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// lấy id của product
		int productId = Integer.valueOf(req.getParameter("productId"));
		// lấy thông tin product từ db
		Product p = categoriesService.getProductByProductId(productId);
		// lấy danh sách các category
		List<Category> categories = filterDAO.getTopCategories();
		// gửi category của product
		Category category = findCategory(p.getCategory_parent(), categories);
		req.setAttribute("itsCategory", category);
		// xoá category của product trong danh sách
		categories.remove(category);
		// gửi danh sách category mới
		req.setAttribute("categories", categories);
		req.setAttribute("product", p);

		// list sub-category
		List<Category> subCategories = filterDAO.getSubCategories(category.getId());
		// tìm sub-category của product
		Category subCategory = findCategory(p.getCategory_id(), subCategories);
		// xoá và gửi sub-category mới
		subCategories.remove(subCategory);
		req.setAttribute("subCategories", subCategories);
		req.setAttribute("itsSubCategory", subCategory);
		req.getRequestDispatcher("/webPage/admin/product-edit.jsp").forward(req, resp);
	}

	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		categoriesService = new CategoriesServiceImp();
		filterDAO = new FilterDAO();
	}

	private Category findCategory(int id, List<Category> categories) {
		for (Category category : categories) {
			if (category.getId() == id)
				return category;
		}
		return categories.get(0);
	}
}
