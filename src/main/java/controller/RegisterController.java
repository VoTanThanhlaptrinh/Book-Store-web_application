package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomStringUtils;

import service.ILoginService;
import service.ISendMailService;
import service.LoginService;
import service.SendMailImp;

@WebServlet("/register")
public class RegisterController extends HttpServlet {
	private ILoginService loginService;
	private ISendMailService mailService;
	/**
	 *
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/webPage/login/register.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession();
		String username = req.getParameter("username");
		String pass = req.getParameter("password");
		String email = req.getParameter("email");
		String rePassword = req.getParameter("rePassword");
		loginService = (ILoginService) session.getAttribute("loginService");
		if (loginService == null) {
			loginService = new LoginService();
		}
		String mess = null;
		if (pass.trim().length() < 8) {
			mess = "Mật khẩu phải có ít nhất 8 ký tự";
			req.setAttribute("mess", mess);
			doGet(req, resp);
		} else {
			if (!rePassword.equals(pass)) {
				mess = "Mật khẩu nhập lại cần phải giống với mật khẩu";
				req.setAttribute("mess", mess);
				doGet(req, resp);
			} else {
				session.setAttribute("username", username);
				session.setAttribute("password", pass);
				session.setAttribute("email", email);
				String code = RandomStringUtils.randomAlphanumeric(6);
				mailService.sendMail(email, code);
				session.setAttribute("checkCode", code);
				resp.sendRedirect("confirm");
			}
		}
	}
	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		String from = "vtthanh32004@gmail.com";
		String password = "loab yyfr gcpo fcqz";
		mailService = new SendMailImp(from, password);
	}
}
