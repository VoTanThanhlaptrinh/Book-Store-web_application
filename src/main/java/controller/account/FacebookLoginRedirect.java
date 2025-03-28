package controller.account;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/facebookRedirect")
public class FacebookLoginRedirect extends HttpServlet {
	/**
	* 
	*/
	private static final long serialVersionUID = 1L;
	private static String FACEBOOK_APP_ID;
	private static String FACEBOOK_APP_SECRET;
	public static String FACEBOOK_REDIRECT_URL = "https://localhost:8080/BOOK_STORE/facebookCallBack";
	public static String FACEBOOK_LINK_GET_TOKEN = "https://graph.facebook.com/oauth/access_token?client_id=%s&client_secret=%s&redirect_uri=%s&code=%s";

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String url = "https://www.facebook.com/v12.0/dialog/oauth?client_id=" + FACEBOOK_APP_ID
				+ "&redirect_uri=http://localhost:8080/BOOK_STORE/facebookCallBack&scope=email,public_profile&response_type=code";
		resp.sendRedirect(url);
	}
	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		FACEBOOK_APP_ID = getServletContext().getInitParameter("FACEBOOK_APP_ID");
		FACEBOOK_APP_SECRET = getServletContext().getInitParameter("FACEBOOK_APP_SECRET");
	}
}
