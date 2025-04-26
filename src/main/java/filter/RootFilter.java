package filter;

import java.io.IOException;
import java.util.Locale;
import java.util.ResourceBundle;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.User;

@WebFilter(filterName = "rootFilter")
public class RootFilter extends HttpFilter {

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
		
		if (user == null ||  !user.isRoot()) {
			session.setAttribute("mess", bundle.getObject("error.access_denied"));
			session.removeAttribute("user");
			res.sendRedirect("../admin/login");
			return;
		}
		chain.doFilter(req, res);
	}
}
