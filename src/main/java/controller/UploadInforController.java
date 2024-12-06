package controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import models.Image;
import models.Information;
import models.User;
import service.LoginService;

@WebServlet("/upload")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 1, // 1MB
		maxFileSize = 1024 * 1024 * 10, // 10MB
		maxRequestSize = 1024 * 1024 * 50 // 50MB
)
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
		Part part = req.getPart("file");

		infor.setName(name);
		infor.setPhoneNumber(phone);
		infor.setAddress(address);
		infor.setCccd(cccd);
		infor.setEmail(email);
		infor.setBirth(Date.valueOf(birth));

		if ("update".equals(command)) {
			infor.setUpdateDate(new Date(System.currentTimeMillis()));
			Image img = loginService.getImageByImgId(infor.getImgId());
			if (part != null) {
				byte[] bytes = new byte[(int) part.getSize()];
				try (InputStream ips = part.getInputStream()) {
					ips.read(bytes);
				} catch (Exception e) {
					// TODO: handle exception
				}
				img.setFileName(part.getSubmittedFileName());
				img.setData(bytes);
				loginService.updateImage(img);
				loginService.updateInfor(infor);
			}
		}
		if ("insert".equals(command)) {
			infor.setCreateDate(new Date(System.currentTimeMillis()));
			if (part != null) {
				byte[] bytes = new byte[(int) part.getSize()];
				try (InputStream ips = part.getInputStream()) {
					ips.read(bytes);
				} catch (Exception e) {
					// TODO: handle exception
				}
				Image img = new Image(part.getSubmittedFileName(),
						part.getSubmittedFileName().substring(part.getSubmittedFileName().lastIndexOf(".") + 1),
						"ảnh đại diện", new Date(System.currentTimeMillis()), new Date(System.currentTimeMillis()),
						bytes);
				int imgId = loginService.saveImage(img);
				infor.setImgId(imgId);
				loginService.saveInfor(infor, user);
			}
		}
		resp.sendRedirect("infor");
	}
}
