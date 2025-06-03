package controller.account;

import java.io.IOException;
import java.io.InputStream;
import java.util.Locale;
import java.util.ResourceBundle;

import org.mindrot.jbcrypt.BCrypt;

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

@WebServlet("/changePass")
public class ChangePassController extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ILoginService loginService;
	private ILogService logService;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("webPage/login/changePass.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");

		// kiểm tra ngôn ngữ có null hay không
		String lang = (String) session.getAttribute("lang");
		if (lang == null) {
			lang = "vi";
		}
		Locale locale = Locale.forLanguageTag(lang);
		ResourceBundle bundle = ResourceBundle.getBundle("messages", locale);
		try (InputStream ips = req.getInputStream(); 
			JsonReader reader = Json.createReader(ips);) {
			JsonObject jsonObject = reader.readObject();
			// lấy ra thông tin mật khẩu cũ, mới và xác nhận
			String oldPass = jsonObject.getString("currentPassword");
			String pass = jsonObject.getString("newPassword");
			String rePass = jsonObject.getString("confirmPassword");
			// Xác thực dữ liệu
			validation(oldPass, pass, rePass, user, resp, bundle);
			logService.info(new Log(user.getUserId(), "info", "User", "/changePass", "Thay đổi mật khẩu thành công"));
			resp.sendRedirect("home");
		} catch (Exception e) {
			e.printStackTrace();
			logService.error(new Log(user.getUserId(), "error",  "User", "/changePass", "Thay đổi mật khẩu không thành công"));

		}
	}

	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		loginService = new LoginService();
		logService = new LogServiceImpl();
	}

	private void sendResponse(HttpServletResponse response,String message, String status) throws IOException {
		JsonObjectBuilder errorResponse = Json.createObjectBuilder();
		errorResponse.add("status", status);
		errorResponse.add("message", message);

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(errorResponse.build().toString());
	}

	private void validation(String oldPass, String pass, String rePass, User user, HttpServletResponse resp, ResourceBundle bundle) throws IOException {
		String mess;
		// kiểm tra xem người dùng có nhập thiếu thông tin không
		if (oldPass == null || oldPass.isEmpty() || pass == null || pass.isEmpty() || rePass == null
				|| rePass.isEmpty()) {
			mess = bundle.getString("missing.information");
			sendResponse(resp, mess, "error");
			return;
		}
		// kiểm tra mật khẩu cũ với mật khẩu người dùng nhập có khớp không
		if (!BCrypt.checkpw(oldPass, user.getPassword())) {
			mess = bundle.getString("oldPass.notmatch");
			sendResponse(resp, mess, "error");
			return;
		}
		// kiểm tra mật khẩu mới có 8 ký tự không
		if (pass.trim().length() < 8) {
			mess = bundle.getString("password.length.required");
			sendResponse(resp, mess, "error");
			return;
		}
		// kiểm tra xác nhận mật khẩu và mật khẩu
		if (!pass.equals(rePass)) {
			mess = bundle.getString("password.confirmation.mismatch2");
			sendResponse(resp, mess, "error");
			return;
		}
		mess = bundle.getString("change.pass.success"); 
		user.setPassword(loginService.hashPass(pass));
		loginService.updateUser(user);
		sendResponse(resp, mess, "success");
	}
}
