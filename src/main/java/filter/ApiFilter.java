package filter;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;
import java.util.ResourceBundle;

import jakarta.json.Json;
import jakarta.json.JsonObjectBuilder;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.User;

@WebFilter(filterName = "apiFilter", urlPatterns = { "/api/*" })
public class ApiFilter extends HttpFilter {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doFilter(HttpServletRequest req, HttpServletResponse res, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");
		String lang = (String) session.getAttribute("lang");
		if (lang == null) {
			lang = "vi";
		}
		Locale locale = Locale.forLanguageTag(lang);
		ResourceBundle bundle = ResourceBundle.getBundle("messages", locale);

		// lấy ra uri hiện tại
		String uri = req.getRequestURI();
		String contextPath = req.getContextPath(); // lấy phần context
		String path = uri.substring(contextPath.length()); // bỏ phần context ra khỏi uri

		// khởi tạo các api được phép vượt qua filter
		List<String> acceptUrl = Arrays.asList(
				"/api/getSubCategory"
				);
		
		// lọc list xem có url nào khớp với url hiện tại không
		// nếu có thì count sẽ lớn hơn không và vượt qua được filter
		if (acceptUrl.stream().filter(t -> t.equals(path)).count() > 0) {
			chain.doFilter(req, res);
			return;
		}
		if (!user.hasPermissionWithUrl(path)) {
			sendErrorResponse(res, bundle.getString("error.access_denied"));
			return;
		}
		chain.doFilter(req, res);
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
