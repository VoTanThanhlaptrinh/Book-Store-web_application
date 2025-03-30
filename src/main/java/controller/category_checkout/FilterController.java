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
        // Lấy thông tin trang hiện tại từ URL
        int currentPage = 1; // Trang mặc định là 1
        try {
            currentPage = Integer.parseInt(request.getParameter("page"));
        } catch (NumberFormatException e) {
            // Nếu không có tham số page hoặc giá trị không hợp lệ, sử dụng trang mặc định
        }

        // Số sản phẩm hiển thị mỗi trang
        int productsPerPage = 8;

        // Tính toán offset cho câu truy vấn SQL
        int offset = (currentPage - 1) * productsPerPage;

        // Lấy thông tin lọc (categoryId hoặc categoryParentId)
        Integer categoryId = null;
        Integer categoryParentId = null;
        try {
            categoryId = Integer.parseInt(request.getParameter("categoryId"));
        } catch (NumberFormatException e) {
            // Không có categoryId
        }
        try {
            categoryParentId = Integer.parseInt(request.getParameter("categoryParentId"));
        } catch (NumberFormatException e) {
            // Không có categoryParentId
        }

        // Lấy tổng số sản phẩm dựa trên điều kiện lọc
        NewProductDao productDAO = new NewProductDao();
        int totalProducts = productDAO.getTotalProducts(categoryId, categoryParentId);
        int totalPages = (int) Math.ceil((double) totalProducts / productsPerPage);

        // Lấy danh sách sản phẩm theo phân trang và điều kiện lọc
        List<FilterProduct> productList = productDAO.getProducts(productsPerPage, offset, categoryId, categoryParentId);

        // Đưa dữ liệu vào request
        request.setAttribute("products", productList);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("totalPages", totalPages);

        // Forward sang JSP để hiển thị
        request.getRequestDispatcher("webPage/categoryAndSingle/filter.jsp").forward(request, response);
    }
}
