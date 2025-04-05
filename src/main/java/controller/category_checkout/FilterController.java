package controller.category_checkout;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import daoImp.*;
import models.*;

@WebServlet("/FilterServlet")
public class FilterController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Lấy thông tin phân trang và lọc (giữ nguyên phần này)
		int currentPage = 1;
		try { currentPage = Integer.parseInt(request.getParameter("page")); } catch (NumberFormatException e) {}

		int productsPerPage = 8;
		int offset = (currentPage - 1) * productsPerPage;

		Integer categoryId = null;
		Integer categoryParentId = null;
		Double minPrice = null;
		Double maxPrice = null;
		
		try { categoryId = Integer.parseInt(request.getParameter("categoryId")); } catch (NumberFormatException e) {}
		try { categoryParentId = Integer.parseInt(request.getParameter("categoryParentId")); } catch (NumberFormatException e) {}
		try { minPrice = request.getParameter("minPrice") != null ? Double.parseDouble(request.getParameter("minPrice")) : null; } catch (NumberFormatException e) {}
		try { maxPrice = request.getParameter("maxPrice") != null ? Double.parseDouble(request.getParameter("maxPrice")) : null; } catch (NumberFormatException e) {}
			
		// Lấy danh sách sản phẩm
		NewProductDao productDAO = new NewProductDao();
		int totalProducts = productDAO.getTotalProducts(categoryId, categoryParentId, minPrice, maxPrice);
		int totalPages = (int) Math.ceil((double) totalProducts / productsPerPage);

		List<FilterProduct> productList = productDAO.getProducts(productsPerPage, offset, categoryId, categoryParentId, minPrice, maxPrice);

		request.setAttribute("parentcategory", categoryParentId);
		request.setAttribute("subcategory", categoryId);
		request.setAttribute("products", productList);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("totalPages", totalPages);
		request.setAttribute("minPrice", minPrice);
		request.setAttribute("maxPrice", maxPrice);

		// 🧠 Kiểm tra có phải AJAX không (dựa vào header hoặc tham số tùy ý)
		String isAjax = request.getHeader("X-Requested-With");
		System.out.println(currentPage + " trang hien tai");
		if ("XMLHttpRequest".equals(isAjax)) {
			// ✅ Trả về danh sách HTML sản phẩm
			request.getRequestDispatcher("webPage/categoryAndSingle/ajaxProductList.jsp").forward(request, response);
		} else {
			// ✅ Trả về trang đầy đủ nếu là truy cập bình thường
			request.getRequestDispatcher("webPage/categoryAndSingle/filter.jsp").forward(request, response);
		}
	}
}



