package controller.category_checkout;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Category;

import java.io.IOException;
import java.util.List;

import daoImp.FilterDAO;
import com.google.gson.Gson;
@WebServlet("/AjaxCategoryServlet")
public class AJAXCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AJAXCategoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		   // Lấy ID của thể loại lớn từ tham số URL
        int categoryParentId = Integer.parseInt(request.getParameter("categoryParentId"));

        // Lấy danh sách thể loại nhỏ
        List<Category> subCategories = new FilterDAO().getSubCategories(categoryParentId);
     
        // Chuyển danh sách thể loại nhỏ thành JSON
        Gson gson = new Gson();
        String jsonResponse = gson.toJson(subCategories);

        // Trả về kết quả dưới dạng JSON
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonResponse);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
