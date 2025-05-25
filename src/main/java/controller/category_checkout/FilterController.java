package controller.category_checkout;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.json.JSONObject;
import org.json.JSONArray;

import controller.product.ProductCache;
import daoImp.*;
import models.*;

@WebServlet("/FilterServlet")
public class FilterController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	
	
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    processRequest(request, response);
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    processRequest(request, response);
	}
	

	private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   
				int currentPage = 1;
				try { currentPage = Integer.parseInt(request.getParameter("page")); } catch (NumberFormatException e) {}

				int productsPerPage = 8;
				int offset = (currentPage - 1) * productsPerPage;

				Integer categoryId = null;
				Integer categoryParentId = null;
				Double minPrice = null;
				Double maxPrice = null;
				String parentName =null;
				String subName = null;
				String[] yearFilters = request.getParameterValues("yearFilter");
				String s = "";
				
				
				if (yearFilters != null && yearFilters.length > 0) {
				    StringBuilder sb = new StringBuilder();
				    sb.append(yearFilters[0]); // phần đầu không có prefix
				    for (int i = 1; i < yearFilters.length; i++) {
				    	
				        sb.append("&yearFilter=").append(yearFilters[i]);
				    }
				    s = sb.toString();
				}
					
			
				List<String> selectedYears = new ArrayList<>();
				if (yearFilters != null && !yearFilters[0].equals("undefined")) {
					System.out.println(Arrays.toString(yearFilters));
				    selectedYears = Arrays.asList(yearFilters);
				}
		
				String categoryIdStr = request.getParameter("categoryId");
				if (categoryIdStr != null && !categoryIdStr.isEmpty()) {
				    try {
				        categoryId = Integer.parseInt(categoryIdStr);
				        System.out.println("category id:" + categoryIdStr);
				    } catch (NumberFormatException e) {}
				}
				String categoryNameStr = request.getParameter("parentcategoryName");
				if (categoryNameStr != null && !categoryNameStr.isEmpty()) {
				    try {
				    	parentName = categoryNameStr;
				        System.out.println("category parent name:" + parentName);
				    } catch (NumberFormatException e) {}
				}
				String categorySubNameStr = request.getParameter("subcategoryName");
				if (categorySubNameStr != null && !categorySubNameStr.isEmpty()) {
				    try {
				    	subName = categorySubNameStr;
				        System.out.println("category parent name:" + subName);
				    } catch (NumberFormatException e) {}
				}
				try { categoryId = Integer.parseInt(request.getParameter("categoryId")); } catch (NumberFormatException e) {}
				try { categoryParentId = Integer.parseInt(request.getParameter("categoryParentId")); } catch (NumberFormatException e) {}
				try { parentName = request.getParameter("parentcategoryName"); } catch (NumberFormatException e) {}
				try { subName = request.getParameter("subcategoryName"); } catch (NumberFormatException e) {}
				try { minPrice = request.getParameter("minPrice") != null ? Double.parseDouble(request.getParameter("minPrice")) : null; } catch (NumberFormatException e) {}
				try { maxPrice = request.getParameter("maxPrice") != null ? Double.parseDouble(request.getParameter("maxPrice")) : null; } catch (NumberFormatException e) {}
		
				// Lấy danh sách sản phẩm
				NewProductDao productDAO = new NewProductDao();
				int totalProducts = productDAO.getTotalProducts(categoryId, categoryParentId, minPrice, maxPrice, selectedYears);
				int totalPages = (int) Math.ceil((double) totalProducts / productsPerPage);
				
				List<String> filterTagsList = new ArrayList<>();
				
				if (parentName != null && !parentName.equals("") ) {
					filterTagsList.add(parentName);
				}
				if (subName != null && !subName.equals("") ) {
					filterTagsList.add(subName);
				}
				if (yearFilters != null) {
					for (String str : yearFilters) {
						if (!str.equals("undefined")) {
							filterTagsList.add(str);
						}
						
					}
					
				}
				if (minPrice != null  && maxPrice != null) {
					filterTagsList.add(minPrice + " to " + maxPrice);
				}
				for (String string : filterTagsList) {
					
					System.out.println(string);
				}
				
				List<FilterProduct> productList = productDAO.getProducts(productsPerPage, offset, categoryId, categoryParentId, minPrice, maxPrice, selectedYears);

				request.setAttribute("filterTagsList", filterTagsList);
				request.setAttribute("yearFilters", s);
				request.setAttribute("parentcategory", categoryParentId);
				request.setAttribute("subcategory", categoryId);
				request.setAttribute("parentcategoryName", parentName);
				request.setAttribute("subcategoryName", subName);
				request.setAttribute("products", productList);
				request.setAttribute("currentPage", currentPage);
				request.setAttribute("totalPages", totalPages);
				request.setAttribute("minPrice", minPrice);
				request.setAttribute("maxPrice", maxPrice);

	
				String isAjax = request.getHeader("X-Requested-With");
				
				if ("XMLHttpRequest".equals(isAjax)) {
				
				
					request.getRequestDispatcher("webPage/categoryAndSingle/ajaxProductList.jsp").forward(request, response);
				} else {
					System.out.println("this");
					request.getRequestDispatcher("webPage/categoryAndSingle/filter.jsp").forward(request, response);
				}
	}
}



