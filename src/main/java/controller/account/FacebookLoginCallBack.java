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
import java.util.HashSet;
import java.util.Locale;
import java.util.ResourceBundle;
import java.util.Set;

import daoImp.SocialLoginDAOImpl;
import daoInterface.ISocialLoginDAO;
import jakarta.json.Json;
import jakarta.json.JsonObject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.Cart;
import models.SocialLogin;
import models.User;
import service.ILoginService;
import service.LoginService;
import serviceImplement.HienThiDonTrongGioHangImplement;

@WebServlet("/facebookCallBack")
public class FacebookLoginCallBack extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static String FACEBOOK_APP_ID;
	private static String FACEBOOK_APP_SECRET;
	private ILoginService loginService;
	private ISocialLoginDAO socialLoginDAO;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String lang = (String) session.getAttribute("lang");
		if (lang == null) {
			lang = "vi";
		}
		Locale locale = Locale.forLanguageTag(lang);
		ResourceBundle bundle = ResourceBundle.getBundle("messages", locale);
		String code = request.getParameter("code");
		if (code == null || code.isEmpty()) {
			session.setAttribute("loginMessage", bundle.getObject("login.social.fail"));
			response.sendRedirect("login");
			return;
		}
		// Đổi mã `code` thành Access Token
		try {
			String accessToken = getAccessToken(code);
			if (accessToken == null) {
				session.setAttribute("loginMessage", bundle.getObject("login.social.fail"));
				response.sendRedirect("login");
				return;
			}

			// Lấy thông tin người dùng từ Google
			User user = getUserInfo(accessToken);
			if (user == null) {
				session.setAttribute("loginMessage", bundle.getObject("login.social.fail"));
				response.sendRedirect("login");
				return;
			}
			HienThiDonTrongGioHangImplement htGioHang = new HienThiDonTrongGioHangImplement(user);
			htGioHang.taoGioHang(user.getUserId());
			Cart cart = htGioHang.layGioHang(user.getUserId());
			session.setAttribute("loginService", loginService);
			session.setAttribute("cart", cart);
			session.setAttribute("user", user);
			// Lưu vào session để đăng nhập thay người dùng
			session.setAttribute("user", user);

			// Chuyển hướng về trang chính
			response.sendRedirect("home");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private String getAccessToken(String code) throws URISyntaxException, IOException {
		String tokenUrl = "https://graph.facebook.com/v2.12/oauth/access_token?client_id=" + FACEBOOK_APP_ID
				+ "&redirect_uri=http://localhost:8080/BOOK_STORE/facebookCallBack&client_secret=" + FACEBOOK_APP_SECRET
				+ "&code=" + code;
		URL url = new URI(tokenUrl).toURL();
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
		conn.setDoOutput(true);

		// Gửi request
		OutputStream os = conn.getOutputStream();
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
				"https://graph.facebook.com/me?fields=id,name,email&access_token=" + accessToken).toURL()
				.openConnection();
		conn.setRequestMethod("GET");

		try (BufferedReader br = new BufferedReader(
				new InputStreamReader(conn.getInputStream(), StandardCharsets.UTF_8))) {
			JsonObject jsonObject = Json.createReader(br).readObject();
			String email = jsonObject.getString("email");
			String id = jsonObject.getString("id");
			User user;
			// nếu user đã tồn tại thì người dùng được phép đăng nhập
			if (loginService.checkEmail(email)) {
				user = loginService.getUserByMail(email);
			}else {
				user = createUser(email);
			}
			if (!socialLoginDAO.checkIdSocialLogin(id)) {
				SocialLogin socialLogin = new SocialLogin(id, user.getUserId(), "Facebook",
						new Date(System.currentTimeMillis()));
				socialLoginDAO.save(socialLogin);
			}
			return user;
		} catch (Exception e) {
			e.printStackTrace();
			throw new IOException("Lỗi hệ thống");
		}
	}

	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		FACEBOOK_APP_ID = getServletContext().getInitParameter("FACEBOOK_APP_ID");
		FACEBOOK_APP_SECRET = getServletContext().getInitParameter("FACEBOOK_APP_SECRET");
		loginService = new LoginService();
		socialLoginDAO = new SocialLoginDAOImpl();
	}

	// Hàm tạo người dùng
	private User createUser(String username) throws SQLException {
		User user = new User();
		Set<String> roles = new HashSet<>();
		roles.add("user");
		user.setUsername(username);
		user.setEmail(username);
		user.setStatus("Alive");
		user.setCreateDate(new Date(System.currentTimeMillis()));
		user.setUpdateDate(new Date(System.currentTimeMillis()));
		user.setRoles(roles);
		user.setActivate(true);
		user.setSocialLogin(true);
		loginService.register(user);
		return user;
	}
}
