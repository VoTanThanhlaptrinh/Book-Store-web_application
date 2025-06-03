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
import models.Log;
import models.User;
import service.EmailSpamService;
import service.ILogService;
import service.ILoginService;
import service.LogServiceImpl;
import service.LoginService;

@WebServlet("/confirm")
public class ConfirmEmailController extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ILoginService loginService;
	private ILogService logService;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String mess = (String) session.getAttribute("loginMessage");
		if(mess != null) {
			session.removeAttribute("loginMessage");
			req.setAttribute("loginMessage", mess);
		}
		req.getRequestDispatcher("webPage/login/confirm.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();

		User user = (User) session.getAttribute("userConfirm"); // Lấy ra thông tin user đã đăng ký
		String code = req.getParameter("conCode"); // lấy code từ input của người dùng

		// lấy code được gửi từ mail đặt trong session
		String confirmCode = EmailSpamService.getCode(String.valueOf(session.getAttribute("checkEmail")));

		String lang = (String) session.getAttribute("lang");
		if (lang == null) {
			lang = "vi";
		}
		Locale locale = Locale.forLanguageTag(lang);
		ResourceBundle bundle = ResourceBundle.getBundle("messages", locale);

		// Tránh người dùng đi vào confirm nhập code khi gmail chưa gửi
		// gây ra lỗi null poiter exception khi confirmCode gọi phương thức equal
		if (confirmCode == null) {
			sendResponse(resp, bundle.getString("confirmCode.error"), "error");
			return;
		}
		// mã xác thực giống nhau thì xác thực tài khoản và quay trở về trang trước đó.
		if (!confirmCode.equals(code)) {
			req.setAttribute("mess", bundle.getString("auth.code.invalid"));
			doGet(req, resp);
			return;
		}
		// nếu đi vào trang này từ trang forgotPass thì sẽ được di chuyển tới trang reset
		boolean acceptChangePass = (session.getAttribute("acceptChangePass") == null ? false : true);
		if(acceptChangePass) {
			resp.sendRedirect("reset");
			return;
		}
		user.setActivate(true);
		loginService.activateUser(user);
		// ghi log
		logService.info(new Log(user.getUserId(), "info", "User", "/confirm", "Xác thực tài khoản thành công"));
		// xoá mã khỏi spam
		EmailSpamService.removeCode(confirmCode);
		
		session.setAttribute("user", user);
		session.removeAttribute("userConfirm");
		String previousURL = (String) session.getAttribute("previousURL");

		if (previousURL != null) {
			resp.sendRedirect(previousURL);
			session.removeAttribute("previousURL");
			return;
		}
		resp.sendRedirect("home");
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
