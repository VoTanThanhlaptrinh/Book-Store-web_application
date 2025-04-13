package controller.category_checkout;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.FilterProduct;
import utils.ElasticsearchConfig;

import java.io.IOException;
import java.util.List;

import org.apache.http.HttpHost;
import org.apache.http.nio.client.HttpAsyncClient;
import org.elasticsearch.client.RestClient;

import co.elastic.clients.elasticsearch.ElasticsearchClient;
import co.elastic.clients.json.JsonpMapper;

import co.elastic.clients.json.jackson.JacksonJsonpMapper;
import co.elastic.clients.transport.rest_client.RestClientTransport;
import daoImp.NewProductDao;
import daoImp.SearchProductDAO;

@WebServlet("/SearchServlet")
public class SearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String keyword = request.getParameter("keyword");
		try { keyword = request.getParameter("keyword") != null ? request.getParameter("keyword") : null; } catch (NumberFormatException e) {}
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
		// Tạo ElasticsearchClient (có thể tách ra dùng Singleton trong thực tế)
	
	
			ElasticsearchClient client = ElasticsearchConfig.getClient();
	

		// Gọi DAO với client
		SearchProductDAO productDAO = new SearchProductDAO(client);
	//	productDAO.createProductsIndexIfNotExists();
		int totalProducts = productDAO.getTotalSearchProducts(categoryId, categoryParentId, minPrice, maxPrice, keyword);
		int totalPages = (int) Math.ceil((double) totalProducts / productsPerPage);

		List<FilterProduct> productList = productDAO.getSearchProducts(productsPerPage, offset, categoryId, categoryParentId, minPrice, maxPrice, keyword);

		request.setAttribute("parentcategory", categoryParentId);
		request.setAttribute("subcategory", categoryId);
		request.setAttribute("products", productList);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("keyword", keyword);
		request.setAttribute("totalPages", totalPages);
		request.setAttribute("minPrice", minPrice);
		request.setAttribute("maxPrice", maxPrice);

		// 🧠 Kiểm tra có phải AJAX không (dựa vào header hoặc tham số tùy ý)
		String isAjax = request.getHeader("X-Requested-With");
		System.out.println(currentPage + " trang hien tai");
		if ("XMLHttpRequest".equals(isAjax)) {
			// ✅ Trả về danh sách HTML sản phẩm
			request.getRequestDispatcher("webPage/categoryAndSingle/search-product-list.jsp").forward(request, response);
		} else {
			// ✅ Trả về trang đầy đủ nếu là truy cập bình thường
			request.getRequestDispatcher("webPage/categoryAndSingle/search-result.jsp").forward(request, response);
		}
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
