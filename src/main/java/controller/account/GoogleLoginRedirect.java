package controller.account;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/googleLoginRedirect")
public class GoogleLoginRedirect extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static final String CLIENT_ID = "53880802995-cgfj4oa7d0a868nvkjqjn8v9pdeiqvn8.apps.googleusercontent.com";
    private static final String REDIRECT_URI = "http://localhost:8080/BOOK_STORE/callback";
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 String googleAuthURL = "https://accounts.google.com/o/oauth2/auth" +
	                "?scope=email%20profile" +
	                "&response_type=code" +
	                "&client_id=" + CLIENT_ID +
	                "&redirect_uri=" + REDIRECT_URI +
	                "&access_type=offline";
		 resp.sendRedirect(googleAuthURL);
	}
}