package admin.api;

import java.io.IOException;
import java.util.List;
import java.util.Locale;
import java.util.ResourceBundle;

import daoImp.FilterDAO;
import jakarta.json.Json;
import jakarta.json.JsonArray;
import jakarta.json.JsonArrayBuilder;
import jakarta.json.JsonObjectBuilder;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.Category;

@WebServlet("/admin/api/getSubCategory")
public class GetSubCategoryAPI extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private FilterDAO filterDAO;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession();

		String lang = (String) session.getAttribute("lang");
		if (lang == null) {
			lang = "vi";
		}
		Locale locale = Locale.forLanguageTag(lang);
		ResourceBundle bundle = ResourceBundle.getBundle("messages", locale);
		try {
			// lấy id từ url và tìm dưới db
			int id = Integer.valueOf(req.getParameter("categoryId"));
			List<Category> subCategory = filterDAO.getSubCategories(id);
			JsonObjectBuilder response = Json.createObjectBuilder();
			response.add("status", "success");
			JsonArrayBuilder dataArray = Json.createArrayBuilder();
			subCategory.parallelStream().forEach(t -> {
				dataArray.add(Json.createObjectBuilder().add("id", t.getId()).add("name", t.getName()).build());
			});
			JsonArray data = dataArray.build();
			response.add("data", data);
			
			resp.setContentType("application/json");
			resp.setCharacterEncoding("UTF-8");
			resp.getWriter().write(response.build().toString());
		} catch (Exception e) {
			sendErrorResponse(resp, bundle.getString("system_error"));
		}

	}

	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		filterDAO = new FilterDAO();
	}

	private void sendErrorResponse(HttpServletResponse response, String errorMessage) throws IOException {
		JsonObjectBuilder errorResponse = Json.createObjectBuilder();
		errorResponse.add("status", "error");
		errorResponse.add("error", errorMessage);

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(errorResponse.build().toString());
	}
}
