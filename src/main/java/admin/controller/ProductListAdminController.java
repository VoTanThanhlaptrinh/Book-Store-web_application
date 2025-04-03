package admin.controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Product;
import service.CategoriesServiceImp;
import service.ICategoriesService;
@WebServlet("/admin/product-list")
public class ProductListAdminController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ICategoriesService categoriesService;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String pageNum = req.getParameter("pageNum");
        int page = 1;
        int pageSize = 12; // Số sản phẩm mỗi trang

        if (pageNum != null && !pageNum.isEmpty()) {
            page = Integer.parseInt(pageNum);
        }

        // Lấy danh sách sản phẩm theo trang
        List<Product> products = categoriesService.getProductByPage(page, pageSize);

        // Tính tổng số sản phẩm (giả sử service có phương thức này)
        int totalProducts = categoriesService.getTotalProducts(); // Bạn cần thêm phương thức này trong service
        int totalPages = (int) Math.ceil((double) totalProducts / pageSize); // Tính tổng số trang

        // Truyền dữ liệu sang JSP
        req.setAttribute("products", products);
        req.setAttribute("currentPage", page);
        req.setAttribute("totalPages", totalPages);

        req.getRequestDispatcher("/webPage/admin/product-list.jsp").forward(req, resp);
	}
	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		categoriesService = new CategoriesServiceImp();
	}
}
