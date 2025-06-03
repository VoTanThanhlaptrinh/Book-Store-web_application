package controller.account;

import java.io.IOException;
import java.io.InputStream;
import java.util.Locale;
import java.util.ResourceBundle;

import jakarta.json.Json;
import jakarta.json.JsonObject;
import jakarta.json.JsonObjectBuilder;
import jakarta.json.JsonReader;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.Log;
import models.User;
import service.ILogService;
import service.ILoginService;
import service.LogServiceImpl;
import service.LoginService;

@WebServlet("/reset")
public class ResetPassController extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ILoginService loginService;
	private ILogService logService;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("webPage/login/reset-pass.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");
		String lang = (String) session.getAttribute("lang");
		if (lang == null) {
			lang = "vi";
		}
		Locale locale = Locale.forLanguageTag(lang);
		ResourceBundle bundle = ResourceBundle.getBundle("messages", locale);
		String mess;
		try (InputStream ips = req.getInputStream(); JsonReader reader = Json.createReader(ips);) {
			JsonObject jsonObject = reader.readObject();
			// lấy ra thông tin mật khẩu mới, xác nhận mật khẩu mới
			String pass = jsonObject.getString("pass");
			String rePass = jsonObject.getString("rePass");
			// Xác thực dữ liệu
			if (pass.trim().length() < 8) {
				mess = bundle.getString("password.length.required");
				sendResponse(resp, mess, "error");
				return;
			}
			if (!pass.equals(rePass)) {
				mess = bundle.getString("password.confirmation.mismatch2");
				sendResponse(resp, mess, "error");
				return;
			}
			user.setPassword(loginService.hashPass(pass));
			loginService.updateUser(user);

			mess = bundle.getString("reset.pass.success");
			sendResponse(resp, mess, "success");
			session.removeAttribute("acceptChangePass");
			logService.info(new Log(user.getUserId(), "info", "User", "/reset", "cài đặt lại mật khẩu thành công"));
		} catch (Exception e) {
			e.printStackTrace();
			logService.error(new Log(user.getUserId(), "error", "User", "/reset", "lỗi không cài lại mật khẩu được"));
		}
		
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
