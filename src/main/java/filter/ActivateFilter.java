package filter;

import java.io.IOException;
import java.util.Locale;
import java.util.ResourceBundle;

import org.apache.commons.lang3.RandomStringUtils;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.User;
import service.ISendMailService;
import service.SendMailImp;

@WebFilter(value = { "/checkout", "/reset" })
public class ActivateFilter extends HttpFilter {

	/**
	 * 
	 */

	private static final long serialVersionUID = 1L;
	private ISendMailService sendMailService;

	public ActivateFilter() {
		sendMailService = new SendMailImp();
	}

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
		
		if (!user.isActivate()) {
			// gửi thông báo người dùng cần kích hoạt tài khoản để sử dụng dịch vụ này
			String mess = bundle.getString("activate.message");
			req.setAttribute("mess", mess);
			// Lấy ra url trước đó, nếu user xác thực thành công thì sẽ trở về trang trước đó
			previousURL = req.getRequestURL().toString();
			req.setAttribute("previousURL", previousURL);
			
			req.getRequestDispatcher("webPage/login/confirm.jsp").forward(req, res); // di chuyển tới trang xác thực
			
			String code = RandomStringUtils.randomAlphanumeric(6); // tạo random mã để gửi email xác thực
			session.setAttribute("confirmCode", code);
			
			// gọi service gửi email là mã xác thực cho user
			String content = bundle.getString("verification.code") + code;
			sendMailService.sendMail(user.getEmail(), content, bundle.getString("account.registration.verification"));
			return;
		}
		chain.doFilter(req, res);
	}

}
