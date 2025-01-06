package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.microsoft.sqlserver.jdbc.SQLServerException;

import exeption.SqlException;
import service.ILoginService;
import service.LoginService;

@WebServlet("/confirm")
public class ConfirmEmailController extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ILoginService loginService;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.getRequestDispatcher("webPage/login/confirm.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String username = (String) session.getAttribute("username");
		String password = (String) session.getAttribute("password");
		String email = (String) session.getAttribute("email");
		String code = (String) req.getAttribute("code");
		try {
			if (session.getAttribute("checkCode").equals(code)) {
				loginService.register(username, password, email);
			}else {
				req.setAttribute("mess", "Sai mã xác thực");
				doGet(req, resp);
			}
		} catch (SQLServerException | SqlException e) {
			req.setAttribute("mess", e.getMessage());
			doGet(req, resp);
		}
	}

	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		loginService = new LoginService();
	}
}
