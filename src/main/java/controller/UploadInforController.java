package controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.sql.Date;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import models.Image;
import models.Information;
import models.User;
import net.coobird.thumbnailator.Thumbnails;
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
		Information infor = loginService.getInforOfUser(user.getUserId());
		if (infor == null) {
			infor = new Information();
		}
		String name = req.getParameter("name");
		String phone = req.getParameter("phone");
		String address = req.getParameter("address");
		String cccd = req.getParameter("cccd");
		String birth = req.getParameter("birth");
		String email = req.getParameter("email");
		Part part = req.getPart("file");
		if (name.trim().length() > 100) {
			String mess = "Tên chữ được lưu giới hạn 100 ký tự";
			req.setAttribute("mess", mess);
			doGet(req, resp);
			return;
		}
		if (phone.trim().length() != 10 && phone.trim().length() != 11) {
			String mess = "Số điện thoại 10 hoặc 11 chữ số";
			req.setAttribute("mess", mess);
			doGet(req, resp);
			return;
		}
		if (cccd.trim().length() != 12) {
			String mess = "Căn cước công dân phải chính xác 12 số";
			req.setAttribute("mess", mess);
			doGet(req, resp);
			return;
		}
		infor.setName(name);
		infor.setPhoneNumber(phone);
		infor.setAddress(address);
		infor.setCccd(cccd);
		infor.setEmail(email);
		infor.setBirth(Date.valueOf(birth));
		byte[] bytes = null;
		if (part != null) {
			String mimeType = part.getContentType();
			if (!"image/png".equals(mimeType) && !"image/jpg".equals(mimeType)) {
				String mess = "Không hỗ trợ đuôi khác .png, .jpg";
				req.setAttribute("mess", mess);
				doGet(req, resp);
				return;
			}
			try {
				// Dùng để đưa vào thumbnails để lấy byte[] dữ liệu
				ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
				// Chỉnh lại kích thức các ảnh khớp với 100x100 px.
				Thumbnails.of(part.getInputStream()).size(130, 400).toOutputStream(outputStream);
				bytes = outputStream.toByteArray();
			} catch (Exception e) {
				req.setAttribute("mess", "Đã xảy ra lỗi khi upload ảnh");
				doGet(req, resp);
				return;
			}
		}
		if ("update".equals(command)) {
			Image img = loginService.getImageByImgId(infor.getImgId());
			if (bytes != null) {
				img.setFileName(part.getSubmittedFileName());
				img.setData(bytes);
			}
			loginService.updateImage(img);
			loginService.updateInfor(infor);
		}
		if ("insert".equals(command)) {
			if (bytes != null) {
				Image img = new Image(part.getSubmittedFileName(),
						part.getSubmittedFileName().substring(part.getSubmittedFileName().lastIndexOf(".") + 1),
						"ảnh đại diện", new Date(System.currentTimeMillis()), new Date(System.currentTimeMillis()),
						bytes);
				int imgId = loginService.saveImage(img);
				infor.setImgId(imgId);
			} else {
				infor.setImgId(37);
			}
			loginService.saveInfor(infor, user);
		}
		resp.sendRedirect("infor");
	}
}
