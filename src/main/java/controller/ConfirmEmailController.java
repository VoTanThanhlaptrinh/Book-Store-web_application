package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomStringUtils;

import com.microsoft.sqlserver.jdbc.SQLServerException;

import service.ILoginService;
import service.ISendMailService;
import service.LoginService;
import service.SendMailImp;

@WebServlet("/confirm")
public class ConfirmEmailController extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ILoginService loginService;
	private ISendMailService mailService;

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
		String code = req.getParameter("conCode");
		String confirmCode = (String) session.getAttribute("confirmCode");
		if (confirmCode == null) {
			confirmCode = RandomStringUtils.randomAlphanumeric(6);
			String content = "Mã xác thực của bạn là:" + confirmCode;
			mailService.sendMail(email, content, "Xác thực đăng ký tài khoản");
			session.setAttribute("confirmCode", confirmCode);
			doGet(req, resp);
			return;
		}
		try {
			if (confirmCode.equals(code)) {
				loginService.register(username, password, email);
				resp.sendRedirect("login");
			} else {
				req.setAttribute("mess", "Sai mã xác thực");
				doGet(req, resp);
				return;
			}
		} catch (SQLServerException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			req.setAttribute("mess", e.getMessage());
			doGet(req, resp);
			return;
		}

	}

	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		loginService = new LoginService();
		String from = "vtthanh32004@gmail.com";
		String password = "loab yyfr gcpo fcqz";
		mailService = new SendMailImp(from, password);
	}
}
