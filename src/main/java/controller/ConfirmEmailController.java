package controller;

import java.io.IOException;
import java.util.Locale;
import java.util.ResourceBundle;

import org.apache.commons.lang3.RandomStringUtils;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import service.ILoginService;
import service.ISendMailService;
import service.LoginService;
import service.SendMailImp;

@WebServlet("/confirm")
public class ConfirmEmailController extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ILoginService loginService;
	private ISendMailService mailService;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.getRequestDispatcher("webPage/login/confirm.jsp").forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String username = (String) session.getAttribute("username");
		String password = (String) session.getAttribute("password");
		String email = (String) session.getAttribute("email");
		String code = req.getParameter("conCode");
		String confirmCode = (String) session.getAttribute("confirmCode");

		String lang = (String) session.getAttribute("lang");
		if (lang == null) {
			lang = "vi";
		}
		Locale locale = Locale.forLanguageTag(lang);
		ResourceBundle bundle = ResourceBundle.getBundle("messages", locale);

		if (confirmCode == null) {
			confirmCode = RandomStringUtils.randomAlphanumeric(6);
			String content = bundle.getString("auth.code.label") + confirmCode;
			mailService.sendMail(email, content, bundle.getString("auth.registration.title"));
			session.setAttribute("confirmCode", confirmCode);
			doGet(req, resp);
			return;
		}
		try {
			if (confirmCode.equals(code)) {
				loginService.register(username, password, email);
				resp.sendRedirect("login");
			} else {
				req.setAttribute("mess", bundle.getString("auth.code.invalid"));
				doGet(req, resp);
				return;
			}
		} catch (Exception e) {
			req.setAttribute("mess", e.getMessage());
			doGet(req, resp);
			return;
		}
	}

	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		loginService = new LoginService();
		mailService = new SendMailImp();
	}
}
