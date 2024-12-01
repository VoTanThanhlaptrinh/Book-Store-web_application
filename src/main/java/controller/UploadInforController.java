package controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.Information;
import models.User;
import service.LoginService;

@WebServlet("/upload")
public class UploadInforController extends HttpServlet {
	private String command;
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");
		if (user == null) {
			resp.sendRedirect("home");
		} else {
			command = (String) session.getAttribute("command");
			System.out.println(command);
			req.getRequestDispatcher("webPage/login/upload.jsp").forward(req, resp);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");
		LoginService loginService = (LoginService) session.getAttribute("loginService");
		Information infor = (Information) session.getAttribute("infor");
		String name = req.getParameter("name");
		String phone = req.getParameter("phone");
		String address = req.getParameter("address");
		String cccd = req.getParameter("cccd");
		String birth = req.getParameter("birth");
		String email = req.getParameter("email");
		if (!name.trim().isEmpty() || !phone.trim().isEmpty() || !address.trim().isEmpty() || !cccd.trim().isEmpty()
				|| !birth.trim().isEmpty() || !email.trim().isEmpty()) {
			if (!name.trim().isEmpty())
				infor.setName(name);
			if (!phone.trim().isEmpty())
				infor.setPhoneNumber(phone);
			if (!address.trim().isEmpty())
				infor.setAddress(address);
			if (!cccd.trim().isEmpty())
				infor.setCccd(cccd);
			if (!email.trim().isEmpty())
				infor.setEmail(email);
			if (!birth.trim().isEmpty())
				infor.setBirth(Date.valueOf(birth));
			infor.setCreateDate(new Date(System.currentTimeMillis()));
			if ("update".equals(command)) {
				loginService.updateInfor(infor);
			}
			if ("insert".equals(command)) {
				loginService.saveInfor(infor, user);
			}
			resp.sendRedirect("infor");
		}

	}
}
