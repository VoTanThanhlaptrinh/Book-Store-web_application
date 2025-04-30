package controller.account;

import java.io.IOException;
import java.util.Locale;
import java.util.ResourceBundle;

import jakarta.json.Json;
import jakarta.json.JsonObjectBuilder;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.User;
import service.EmailSpamService;
import service.ILoginService;
import service.LoginService;

@WebServlet("/forgotPass")
public class ForgotPassController extends HttpServlet {
	/**
	 * 
	 */
	private ILoginService loginService;
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession();
		String mess = (String) session.getAttribute("mess");
		if(mess != null) {
			req.setAttribute("mess", mess);
			session.removeAttribute("mess");
		}
		req.getRequestDispatcher("webPage/login/forgot-pass.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String code = req.getParameter("code");
		String email = req.getParameter("email");
		HttpSession session = req.getSession();
		
		String checkEmail = (String) session.getAttribute("checkEmail");
		String checkCode = EmailSpamService.getCode(checkEmail);
		
		String lang = (String) session.getAttribute("lang");
		if (lang == null) {
			lang = "vi";
		}
		Locale locale = Locale.forLanguageTag(lang);
		ResourceBundle bundle = ResourceBundle.getBundle("messages", locale);
		String mess;
		// kiểm tra code hết hạn hay không
		if(checkCode == null) {
			mess = bundle.getString("code.expired");
			sendResponse(resp, mess, "error");
		}
		// kiểm tra có đúng code không
		if(!checkCode.equals(code)) {
			mess = bundle.getString("code.wrong");
			sendResponse(resp, mess, "error");
		}
		// kiểm tra xem email cần xác thực có khớp với email nhập không
		if (!checkEmail.equals(email)) {
			mess = bundle.getString("email.wrong");
			sendResponse(resp, mess, "error");
		}
		session.setAttribute("acceptChangePass", true);
		mess = bundle.getString("verify.success");
		
		User user = loginService.getUserByMail(email);
		session.setAttribute("user", user);
		resp.sendRedirect("reset");
	}

	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		loginService = new LoginService();
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
