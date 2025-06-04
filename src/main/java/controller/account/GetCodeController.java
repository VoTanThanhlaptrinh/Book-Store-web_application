package controller.account;

import java.io.IOException;
import java.util.Locale;
import java.util.ResourceBundle;

import org.apache.commons.lang3.RandomStringUtils;

import jakarta.json.Json;
import jakarta.json.JsonObjectBuilder;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.Log;
import service.EmailSpamService;
import service.ILogService;
import service.ILoginService;
import service.LogServiceImpl;
import service.LoginService;
import service.SendMailQueueService;

@WebServlet("/getCode")
public class GetCodeController extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ILoginService loginService;
	private ILogService logService;
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
		
		String mess;
		// kiểm tra mail rỗng
		if (email == null || email.trim().isEmpty()) {
			mess = bundle.getString("email.required");
			sendResponse(resp,mess , "error");
			return;
		}
		// kiểm tra mail tồn tại trong hệ thống không
		if (!loginService.checkEmail(email)) {
			mess = bundle.getString("email.not.exist");
			sendResponse(resp, mess, "error");
			return;
		}
		if(EmailSpamService.checkSpam(email)) {
			mess = bundle.getString("email.spam");
			logService.warning(new Log(13, "info", "User", "/getCode", String.format("%s bị đưa vào danh sách spam tạm thời", email)));
			sendResponse(resp, mess, "error");
			return;
		}
		// gửi mail
		mess = bundle.getString("email.send");
		// tạo ra code
		session.setAttribute("checkEmail", email);
		String code = RandomStringUtils.randomAlphanumeric(6);
		String content = bundle.getString("verification.code") + code;
		SendMailQueueService.getInstance().sendMail(email, content, bundle.getString("account.registration.verification"), code);
		sendResponse(resp, mess, "success");
	}

	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		loginService = new LoginService();
		logService = new LogServiceImpl();
	}
	private void sendResponse(HttpServletResponse response, String message, String status) throws IOException {
		JsonObjectBuilder errorResponse = Json.createObjectBuilder();
		errorResponse.add("status", status);
		errorResponse.add("message", message);

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(errorResponse.build().toString());
	}
}
