package controller;

import java.io.IOException;
import java.io.PrintWriter;
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

@WebServlet("/getCode")
public class GetCodeController extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ISendMailService mailService;
	private ILoginService loginService;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.setCharacterEncoding("utf-8");
		req.setCharacterEncoding("utf-8");
		resp.setContentType("application/json");
		String email = req.getParameter("email");
		HttpSession session = req.getSession();
		
		  String lang = (String) session.getAttribute("lang");
		    if (lang == null) {
		        lang = "vi";
		    }
		    Locale locale = Locale.forLanguageTag(lang);
		    ResourceBundle bundle = ResourceBundle.getBundle("messages", locale);
		PrintWriter writer = resp.getWriter();
		if (email == null || email.trim().isEmpty()) {
			writer.print("{\"status\": \"error\",\"message\": \"Email không được để trống.\"}");
			writer.flush();
			return;
		}
		if (loginService.checkEmail(email)) {
			String code = RandomStringUtils.randomAlphanumeric(6);
			String content = bundle.getString("verification.code") + code;
			mailService.sendMail(email, content, bundle.getString("account.registration.verification"));
		
			session.setAttribute("checkCode", code);
			session.setAttribute("checkEmail", email);
			String re = (" \"" + code + "\"" + "}");
			writer.print(
					"{\"status\": \"success\",\"message\": \"Mã xác nhận đã được gửi đến email của bạn.\",\"code\":"+re);
		} else {
			writer.print("{\"status\": \"error\",\"message\": \"Email không tồn tại trong hệ thống.\"}");
		}
		writer.flush();
	}

	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		String from = "vtthanh32004@gmail.com";
		String password = "rldl qiwm hkuw nety";
		mailService = new SendMailImp(from, password);
		loginService = new LoginService();
	}
}
