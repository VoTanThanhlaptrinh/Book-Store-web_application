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
@WebFilter(filterName = "verifyFilter")
public class VerifyFilter extends HttpFilter {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Override
	protected void doFilter(HttpServletRequest req, HttpServletResponse res, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession();
		String lang = (String) session.getAttribute("lang");
		if (lang == null) {
			lang = "vi";
		}
		Locale locale = Locale.forLanguageTag(lang);
		ResourceBundle bundle = ResourceBundle.getBundle("messages", locale);
		// khi người dùng xác thực mail thành công thì sẽ set vào trong session một biến 
		// acceptChangePass cho phép người dùng truy cập trang reset
		boolean acceptChangePass = (session.getAttribute("acceptChangePass") == null ? false : true);
		// kiểm tra xem người dùng đã xác thực email trước khi vào reset không
		if(!acceptChangePass) {
			String mess = bundle.getString("verify.required");
			session.setAttribute("mess", mess);
			res.sendRedirect("forgotPass");
			return;
		}
		chain.doFilter(req, res);
	}
}
