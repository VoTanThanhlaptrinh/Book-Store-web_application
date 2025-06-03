package controller.account;

import java.io.IOException;
import java.sql.Date;
import java.util.HashSet;
import java.util.Locale;
import java.util.ResourceBundle;
import java.util.Set;

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
import models.User;
import service.ILogService;
import service.ILoginService;
import service.LogServiceImpl;
import service.LoginService;
import service.SendMailQueueService;

@WebServlet("/register")
public class RegisterController extends HttpServlet {
	private ILoginService loginService;
	/**
	 *
	 */
	private static final long serialVersionUID = 1L;
	private ILogService logService;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String mess = (String) session.getAttribute("loginMessage");
		if(mess != null) {
			session.removeAttribute("loginMessage");
			req.setAttribute("loginMessage", mess);
		}
		req.getRequestDispatcher("/webPage/login/register.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// gọi session
		HttpSession session = req.getSession();

		String username = req.getParameter("username"); // lấy username từ form
		String pass = req.getParameter("password"); // lấy password từ form
		String email = req.getParameter("email"); // lấy email từ form
		String rePassword = req.getParameter("rePassword"); // lấy rePassword từ form

		// Set ngôn ngữ mặc định trên web là tiếng việt.
		String lang = (String) session.getAttribute("lang");
		if (lang == null) {
			lang = "vi";
		}
		Locale locale = Locale.forLanguageTag(lang);
		ResourceBundle bundle = ResourceBundle.getBundle("messages", locale);
		String mess = null;
		// kiểm tra xem mật khẩu có rỗng không
		if (pass == null || pass.isBlank()) {
			mess = bundle.getString("password.null"); // thông báo cho người dùng
			req.setAttribute("loginMessage", mess);
			doGet(req, resp);
			return;
		}
		// kiểm tra xem xác nhận mật khẩu có rỗng không
		if (rePassword == null || rePassword.isBlank()) {
			mess = bundle.getString("rePassword.null"); // thông báo cho người dùng
			req.setAttribute("loginMessage", mess);
			doGet(req, resp);
			return;
		}
		// kiểm tra xem tên người dùng có rỗng không
		if (username == null || username.isBlank()) {
			mess = bundle.getString("username.null"); // thông báo cho người dùng
			req.setAttribute("loginMessage", mess);
			doGet(req, resp);
			return;
		}
		// kiểm tra xem email có rỗng không
		if (email == null || email.isBlank()) {
			mess = bundle.getString("email.null"); // thông báo cho người dùng
			req.setAttribute("loginMessage", mess);
			doGet(req, resp);
			return;
		}
		// kiểm tra xem mật khẩu có ít hơn 8 kĩ tự không
		if (pass.trim().length() < 8) {
			mess = bundle.getString("password.length.required"); // thông báo cho người dùng
			req.setAttribute("loginMessage", mess);
			doGet(req, resp);
			return;
		}
		// kiểm tra xem mật khẩu có khớp không
		if (!rePassword.equals(pass)) {
			mess = bundle.getString("password.confirmation.mismatch"); // thông báo cho người dùng
			req.setAttribute("loginMessage", mess);
			doGet(req, resp);
			return;
		}
		// kiểm tra xem email đã tồn tại trong hệ thống hay chưa
		if (loginService.checkEmail(email)) {
			mess = bundle.getString("email.exist");
			req.setAttribute("loginMessage", mess); // thông báo cho người dùng
			doGet(req, resp);
			return;
		}
		User user = createUser(username, rePassword, email); // tạo đối tượng user sau khi validate dữ liệu

		session.setAttribute("userConfirm", user); // bỏ user vào session để chuyển đi nơi khác

		int userId = loginService.register(user); // lưu user xuống db
		logService.info(new Log(userId, "infor", "User", "/register", "Đăng ký tài khoản thành công"));
		String code = RandomStringUtils.randomAlphanumeric(6); // tạo random mã để gửi email xác thực
		
		// gửi mail
		mess = bundle.getString("email.send");
		session.setAttribute("checkEmail", email);
		String content = bundle.getString("verification.code") + code;
		SendMailQueueService.getInstance().sendMail(email, content,
				bundle.getString("account.registration.verification"), code);
		sendResponse(resp, mess, "success");
		
		resp.sendRedirect("confirm"); // di chuyển sang trang confirm

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

	private User createUser(String username, String password, String email) {
		User user = new User();
		Set<String> roles = new HashSet<>();
		roles.add("user");
		user.setUsername(username);
		user.setPassword(password);
		user.setEmail(email);
		user.setStatus("Alive");
		user.setCreateDate(new Date(System.currentTimeMillis()));
		user.setUpdateDate(new Date(System.currentTimeMillis()));
		user.setRoles(roles);
		return user;
	}
}
