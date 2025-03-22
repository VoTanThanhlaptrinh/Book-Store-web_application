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
@WebFilter(value = {"/checkout","/confirm"})
public class LoginFilter extends HttpFilter {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Override
	protected void doFilter(HttpServletRequest req, HttpServletResponse res, FilterChain chain)
			throws IOException, ServletException {
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");
		String lang = (String) session.getAttribute("lang");
		if (lang == null) {
			lang = "vi";
		}
		Locale locale = Locale.forLanguageTag(lang);
		ResourceBundle bundle = ResourceBundle.getBundle("messages", locale);
		String previousURL = req.getRequestURL().toString();
		if (user == null) {
			String loginMessage = bundle.getString("error.notLoggedIn");
			session.setAttribute("loginMessage", loginMessage);
			req.setAttribute("previousURL", previousURL);
			req.getRequestDispatcher("webPage/login/login.jsp").forward(req, res);
			return;
		}
		chain.doFilter(req, res);
	}
}
