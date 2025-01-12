package controller;

import java.io.IOException;
import java.io.PrintWriter;

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

@WebServlet("/getCode")
public class GetCodeController extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ISendMailService mailService;
	private ILoginService loginService;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.setCharacterEncoding("utf-8");
		req.setCharacterEncoding("utf-8");
		resp.setContentType("application/json");

		String email = req.getParameter("email");
		PrintWriter writer = resp.getWriter();
		if (email == null || email.trim().isEmpty()) {
			writer.print("{\"status\": \"error\",\"message\": \"Email không được để trống.\"}");
			writer.flush();
			return;
		}
		if (loginService.checkEmail(email)) {
			String code = RandomStringUtils.randomAlphanumeric(6);
			String content = "Mã xác thực của bạn là:" + code;
			mailService.sendMail(email, content, "Xác thực quên mật khẩu");
			HttpSession session = req.getSession();
			session.setAttribute("checkCode", code);
			session.setAttribute("checkEmail", email);
			String re = (" \"" + code + "\"" + "}");
			writer.print(
					"{\"status\": \"success\",\"message\": \"Mã xác nhận đã được gửi đến email của bạn.\",\"code\":"+re);
		} else {
			writer.print("{\"status\": \"error\",\"message\": \"Email không tồn tại trong hệ thống.\"}");
		}
		writer.flush();
	}

	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		String from = "vtthanh32004@gmail.com";
		String password = "loab yyfr gcpo fcqz";
		mailService = new SendMailImp(from, password);
		loginService = new LoginService();
	}
}
