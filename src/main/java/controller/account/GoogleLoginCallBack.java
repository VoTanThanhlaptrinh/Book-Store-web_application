package controller.account;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.sql.Date;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.Locale;
import java.util.ResourceBundle;

import jakarta.json.Json;
import jakarta.json.JsonObject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.User;
import service.ILoginService;
import service.LoginService;

@WebServlet("/callback")
public class GoogleLoginCallBack extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static final String CLIENT_SECRET = "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";
	private static final String CLIENT_ID = "53880802995-cgfj4oa7d0a868nvkjqjn8v9pdeiqvn8.apps.googleusercontent.com";
	private static final String REDIRECT_URI = "http://localhost:8080/BOOK_STORE/callback";
	private ILoginService loginService;
	private boolean error;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String code = request.getParameter("code");
		if (code == null || code.isEmpty()) {
			response.getWriter().println("Lỗi khi đăng nhập Google!");
			return;
		}
		// Đổi mã `code` thành Access Token
		try {
			String accessToken = getAccessToken(code);
			if (accessToken == null) {
				response.getWriter().println("Không lấy được Access Token!");
				return;
			}
			HttpSession session = request.getSession();
			String lang = (String) session.getAttribute("lang");
			if (lang == null) {
				lang = "vi";
			}
			Locale locale = Locale.forLanguageTag(lang);
			ResourceBundle bundle = ResourceBundle.getBundle("messages", locale);

			// Lấy thông tin người dùng từ Google
			User user = getUserInfo(accessToken);
			if(user == null) {
				String mess = bundle.getString("email.exist");
				request.setAttribute("mess", mess);
				request.getRequestDispatcher("webPage/login/login.jsp").forward(request, response);
				return;
			}
			// Lưu vào session để đăng nhập thay người dùng
			session.setAttribute("user", user);
			
			// Chuyển hướng về trang chính
			response.sendRedirect("home");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// Hàm đổi code thành Access Token
	private String getAccessToken(String code) throws IOException, URISyntaxException {
		String tokenUrl = "https://oauth2.googleapis.com/token";
		URL url = new URI(tokenUrl).toURL();
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("POST");
		conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
		conn.setDoOutput(true);

		// Gửi request
		String params = "code=" + code + "&client_id=" + CLIENT_ID + "&client_secret=" + CLIENT_SECRET
				+ "&redirect_uri=" + REDIRECT_URI + "&grant_type=authorization_code";

		OutputStream os = conn.getOutputStream();
		os.write(params.getBytes());
		os.flush();
		os.close();
		// Đọc response
		try (BufferedReader brr = new BufferedReader(
				new InputStreamReader(conn.getInputStream(), StandardCharsets.UTF_8))) {
			JsonObject jsonObject = Json.createReader(brr).readObject();
			return jsonObject.getString("access_token");
		} catch (Exception e) {
			e.printStackTrace();
			throw new IOException("Lỗi hệ thống");
		}
	}

	// Hàm lấy thông tin người dùng
	private User getUserInfo(String accessToken) throws IOException, URISyntaxException {
		HttpURLConnection conn = (HttpURLConnection) new URI(
				"https://www.googleapis.com/oauth2/v1/userinfo?access_token=" + accessToken).toURL().openConnection();
		conn.setRequestMethod("GET");

		try (BufferedReader br = new BufferedReader(
				new InputStreamReader(conn.getInputStream(), StandardCharsets.UTF_8))) {
			JsonObject jsonObject = Json.createReader(br).readObject();
			String email = jsonObject.getString("email");
			if (loginService.checkEmail(email)) {
				return null;
			}
			return createUser(email);
		} catch (Exception e) {
			e.printStackTrace();
			throw new IOException("Lỗi hệ thống");
		}
	}

	private User createUser(String username) throws SQLException {
		User user = new User();
		user.setUsername(username);
		user.setEmail(username);
		user.setStatus("Alive");
		user.setCreateDate(new Date(System.currentTimeMillis()));
		user.setUpdateDate(new Date(System.currentTimeMillis()));
		user.setRoles(Arrays.asList("user"));
		user.setActivate(true);
		user.setSocialLogin(true);
		user.setSocialLoginName("Google");
		loginService.register(user);
		return user;
	}

	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		loginService = new LoginService();
	}
}