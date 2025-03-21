package controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.apache.jasper.tagplugins.jstl.core.Url;
import org.apache.tomcat.util.buf.UriUtil;

import jakarta.json.Json;
import jakarta.json.JsonArray;
import jakarta.json.JsonObject;
import jakarta.json.JsonReader;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.User;

@WebServlet("/callback")
public class GoogleLoginCallback extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static final String CLIENT_SECRET = "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";
	private static final String CLIENT_ID = "53880802995-cgfj4oa7d0a868nvkjqjn8v9pdeiqvn8.apps.googleusercontent.com";
	private static final String REDIRECT_URI = "http://localhost:8080/BOOK_STORE/callback";

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

			// Lấy thông tin người dùng từ Google
			User user = getUserInfo(accessToken);
			List<String> role = new ArrayList<String>();
//			role.add("user");
//			user.setRoles(role);
			// Lưu vào session
			HttpSession session = request.getSession();
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
			String id = jsonObject.getString("id");
			String name = jsonObject.getString("name");
			String email = jsonObject.getString("email");
			System.out.println("Google ID: " + id);
			System.out.println("User Name: " + name);
			System.out.println("User Email: " + email);
			User user = new User();
			user.setUsername(email);
			return user;
		} catch (Exception e) {
			e.printStackTrace();
			throw new IOException("Lỗi hệ thống");
		}

		// Trích xuất thông tin user

	}
}
