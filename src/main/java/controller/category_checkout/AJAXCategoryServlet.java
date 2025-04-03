package controller.category_checkout;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Category;
import models.FilterModel;

import java.io.IOException;
import java.util.ArrayList;
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
        // Lấy thông tin từ request (categoryParentId, minPrice, maxPrice)
    	 // Lấy thông tin từ request
    	  String categoryParentIdParam = request.getParameter("categoryParentId");
    	  
    	    int categoryParentId = 0; // Giá trị mặc định là 0 (ALL CATEGORIES)
    	    
    	    if (categoryParentIdParam != null && !categoryParentIdParam.trim().isEmpty()) {
    	        try {
    	            categoryParentId = Integer.parseInt(categoryParentIdParam);
    	        } catch (NumberFormatException e) {
    	            // Nếu có lỗi khi chuyển đổi, giữ nguyên giá trị mặc định (0)
    	            System.err.println("Invalid categoryParentId: " + categoryParentIdParam);
    	        }
    	    }
    	    
      
        String jsonResponse = "";
        List<Category> subCategories = new ArrayList<>();
        if (categoryParentId == 0) {
           	
            subCategories.addAll(new FilterDAO().getTopCategories());
            Gson gson = new Gson();
            jsonResponse = gson.toJson(subCategories);
        
        } else {
        	 

            subCategories = new FilterDAO().getSubCategories(categoryParentId);
            Gson gson = new Gson();
            jsonResponse = gson.toJson(subCategories);
        }
      
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonResponse);
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
