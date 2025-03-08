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

@WebServlet("/register")
public class RegisterController extends HttpServlet {
	private ILoginService loginService;
	private ISendMailService mailService;
	/**
	 *
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/webPage/login/register.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession();
		String username = req.getParameter("username");
		String pass = req.getParameter("password");
		String email = req.getParameter("email");
		String rePassword = req.getParameter("rePassword");
		loginService = (ILoginService) session.getAttribute("loginService");
		if (loginService == null) {
			loginService = new LoginService();
		}
		String lang = (String) session.getAttribute("lang");
		if (lang == null) {
			lang = "vi";
		}
		Locale locale = Locale.forLanguageTag(lang);
		ResourceBundle bundle = ResourceBundle.getBundle("messages", locale);
		String mess = null;
		if (pass.trim().length() < 8) {
			mess = bundle.getString("password.length.required");
			req.setAttribute("mess", mess);
			doGet(req, resp);
			return;
		}
		if (!rePassword.equals(pass)) {
			mess = bundle.getString("password.confirmation.mismatch");
			req.setAttribute("mess", mess);
			doGet(req, resp);
			return;
		}
		if(loginService.checkEmail(email)) {
			req.setAttribute("mess", "Email đã tồn tại trong hệ thống");
			doGet(req, resp);
			return;
		}
		
		session.setAttribute("username", username);
		session.setAttribute("password", pass);
		session.setAttribute("email", email);
		String code = RandomStringUtils.randomAlphanumeric(6);
		session.setAttribute("confirmCode", code);
		resp.sendRedirect("confirm");
		String content = bundle.getString("verification.code") + code;
		mailService.sendMail(email, content, bundle.getString("account.registration.verification"));

	}

	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		loginService = new LoginService();
		String from = "vtthanh32004@gmail.com";
		String password = "rldl qiwm hkuw nety";
		mailService = new SendMailImp(from, password);
	}
}
