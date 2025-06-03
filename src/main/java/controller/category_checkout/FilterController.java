package controller.category_checkout;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

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
import service.ILogService;
import service.LogServiceImpl;

@WebServlet("/FilterServlet")
public class FilterController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	ILogService logService = new LogServiceImpl();
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    processRequest(request, response);
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    processRequest(request, response);
	}
	
	private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		int userId = user != null ? user.getUserId() : 0;
		String userInfo = user != null ? "User ID: " + userId + ", Username: " + user.getUsername() : "Anonymous User";
		
		try {
			// Log request start
			logService.info(new Log(userId, "info", "FilterController", "/FilterServlet", 
				"yeu cau filter thanh cong - " + userInfo + ", Method: " + request.getMethod()));
			
			// Parse pagination parameters
			int currentPage = 1;
			try { 
				currentPage = Integer.parseInt(request.getParameter("page")); 
				logService.info(new Log(userId, "info", "FilterController", "/FilterServlet", 
					"Trang: " + currentPage));
			} catch (NumberFormatException e) {
				logService.warning(new Log(userId, "warning", "FilterController", "/FilterServlet", 
					"khong phan trang thanh cong, su dung trang1"));
			}

			int productsPerPage = 8;
			int offset = (currentPage - 1) * productsPerPage;

			// Parse filter parameters
			Integer categoryId = null;
			Integer categoryParentId = null;
			Double minPrice = null;
			Double maxPrice = null;
			String parentName = null;
			String subName = null;
			String[] yearFilters = request.getParameterValues("yearFilter");
			String s = "";
			
			// Process year filters
			if (yearFilters != null && yearFilters.length > 0) {
				StringBuilder sb = new StringBuilder();
				sb.append(yearFilters[0]);
				for (int i = 1; i < yearFilters.length; i++) {
					sb.append("&yearFilter=").append(yearFilters[i]);
				}
				s = sb.toString();
				logService.info(new Log(userId, "info", "FilterController", "/FilterServlet", 
					"dap dung year filter: " + Arrays.toString(yearFilters)));
			}
				
			List<String> selectedYears = new ArrayList<>();
			if (yearFilters != null && !yearFilters[0].equals("undefined")) {
				selectedYears = Arrays.asList(yearFilters);
			}
	
			// Parse category parameters
			String categoryIdStr = request.getParameter("categoryId");
			if (categoryIdStr != null && !categoryIdStr.isEmpty()) {
				try {
					categoryId = Integer.parseInt(categoryIdStr);
					logService.info(new Log(userId, "info", "FilterController", "/FilterServlet", 
						"áp dung category filter: " + categoryId));
				} catch (NumberFormatException e) {
					logService.warning(new Log(userId, "warning", "FilterController", "/FilterServlet", 
						"categoryid khong hop le: " + categoryIdStr));
				}
			}
			
			String categoryNameStr = request.getParameter("parentcategoryName");
			if (categoryNameStr != null && !categoryNameStr.isEmpty()) {
				parentName = categoryNameStr;
				logService.info(new Log(userId, "info", "FilterController", "/FilterServlet", 
					"ap dung parentcategory thanh cong: " + parentName));
			}
			
			String categorySubNameStr = request.getParameter("subcategoryName");
			if (categorySubNameStr != null && !categorySubNameStr.isEmpty()) {
				subName = categorySubNameStr;
				logService.info(new Log(userId, "info", "FilterController", "/FilterServlet", 
					"ap dung sub category thanh cong: " + subName));
			}
			
			// Parse additional parameters with error handling
			try { 
				categoryParentId = Integer.parseInt(request.getParameter("categoryParentId")); 
				if (categoryParentId != null) {
					logService.info(new Log(userId, "info", "FilterController", "/FilterServlet", 
						"ap dung parent categoryid: " + categoryParentId));
				}
			} catch (NumberFormatException e) {
				logService.warning(new Log(userId, "warning", "FilterController", "/FilterServlet", 
					"category parentId khong hop le"));
			}
			
			// Parse price filters
			try { 
				minPrice = request.getParameter("minPrice") != null ? 
					Double.parseDouble(request.getParameter("minPrice")) : null; 
				if (minPrice != null) {
					logService.info(new Log(userId, "info", "FilterController", "/FilterServlet", 
						"gia duoi: " + minPrice));
				}
			} catch (NumberFormatException e) {
				logService.warning(new Log(userId, "warning", "FilterController", "/FilterServlet", 
					"loi gia: " + request.getParameter("minPrice")));
			}
			
			try { 
				maxPrice = request.getParameter("maxPrice") != null ? 
					Double.parseDouble(request.getParameter("maxPrice")) : null; 
				if (maxPrice != null) {
					logService.info(new Log(userId, "info", "FilterController", "/FilterServlet", 
						"gia tren: " + maxPrice));
				}
			} catch (NumberFormatException e) {
				logService.warning(new Log(userId, "warning", "FilterController", "/FilterServlet", 
					"Loi gia: " + request.getParameter("maxPrice")));
			}
	
			// Database operations
			NewProductDao productDAO = new NewProductDao();
			
			try {
				int totalProducts = productDAO.getTotalProducts(categoryId, categoryParentId, minPrice, maxPrice, selectedYears);
				int totalPages = (int) Math.ceil((double) totalProducts / productsPerPage);
				
				logService.info(new Log(userId, "info", "FilterController", "/FilterServlet", 
					"so luong san pham tong:  " + totalProducts + ", Total pages: " + totalPages));
				
				List<FilterProduct> productList = productDAO.getProducts(productsPerPage, offset, categoryId, categoryParentId, minPrice, maxPrice, selectedYears);
				
				logService.info(new Log(userId, "info", "FilterController", "/FilterServlet", 
					"so luong san pham sau khi loc:  " + productList.size() + " for page " + currentPage));
				
				// Build filter tags
				List<String> filterTagsList = new ArrayList<>();
				
				if (parentName != null && !parentName.equals("")) {
					filterTagsList.add(parentName);
				}
				if (subName != null && !subName.equals("")) {
					filterTagsList.add(subName);
				}
				if (yearFilters != null) {
					for (String str : yearFilters) {
						if (!str.equals("undefined")) {
							filterTagsList.add(str);
						}
					}
				}
				if (minPrice != null && maxPrice != null) {
					filterTagsList.add(minPrice + " to " + maxPrice);
				}
				
				if (!filterTagsList.isEmpty()) {
					logService.info(new Log(userId, "info", "FilterController", "/FilterServlet", 
						"Filter hien tai: " + String.join(", ", filterTagsList)));
				}
				
				// Set request attributes
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

				// Handle response type
				String isAjax = request.getHeader("X-Requested-With");
				
				if ("XMLHttpRequest".equals(isAjax)) {
					logService.info(new Log(userId, "info", "FilterController", "/FilterServlet", 
						"AJAx request"));
					request.getRequestDispatcher("webPage/categoryAndSingle/ajaxProductList.jsp").forward(request, response);
				} else {
					logService.info(new Log(userId, "info", "FilterController", "/FilterServlet", 
						"yeu cau thong thuong"));
					request.getRequestDispatcher("webPage/categoryAndSingle/filter.jsp").forward(request, response);
				}
				
				logService.info(new Log(userId, "info", "FilterController", "/FilterServlet", 
					"yeu cau loc thanh cong"));
					
			} catch (Exception e) {
				logService.error(new Log(userId, "error", "FilterController", "/FilterServlet", 
					"loi ket noi database: " + e.getMessage()));
				throw new ServletException("Error processing filter request", e);
			}
			
		} catch (ServletException e) {
			logService.error(new Log(userId, "error", "FilterController", "/FilterServlet", 
				"Critical error in filter processing: " + e.getMessage()));
			throw e;
		} catch (Exception e) {
			logService.error(new Log(userId, "error", "FilterController", "/FilterServlet", 
				"Unexpected error in filter processing: " + e.getMessage()));
			throw new ServletException("Unexpected error occurred", e);
		}
	}
}