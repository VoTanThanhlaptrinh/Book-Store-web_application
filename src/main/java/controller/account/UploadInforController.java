package controller.account;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.sql.Date;

import jakarta.json.Json;
import jakarta.json.JsonObjectBuilder;
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
	/**
	 *
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		// Tạo isInsert biến để xác định việc cập nhật lại hay insert cái mới.
		boolean isInsert = false;
		// Tạo biến hasImage để xác định có ảnh hay không.
		boolean hasImage = false;
		
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");
		LoginService loginService = (LoginService) session.getAttribute("loginService");
		Information infor = loginService.getInforOfUser(user.getUserId());
		if (infor == null) {
			infor = new Information();
			isInsert = true;
		}
		String name = req.getParameter("fullname");
		String phone = req.getParameter("phone");
		String email = req.getParameter("email");
		String birth = req.getParameter("birth");
		String gender = req.getParameter("gender");

		// xử lý validation cho các input cần thiết phải lưu
		validation(name, email, phone, resp);
		Part part = req.getPart("file");

		infor.setName(name);
		infor.setPhoneNumber(phone);
		infor.setEmail(email);
		if (birth != null && !birth.trim().isEmpty())
			infor.setBirth(Date.valueOf(birth));
		if (gender != null && !gender.trim().isEmpty())
			infor.setGender(gender);
		byte[] bytes = null;
		if (part != null) {
			hasImage = true;
			String mimeType = part.getContentType();
			if (!"image/png".equals(mimeType) && !"image/jpeg".equals(mimeType)) {
			    String mess = "Không hỗ trợ đuôi khác .png, .jpg";
			    sendResponse(resp, mess, "error");
			    return;
			}
			try {
				// Dùng để đưa vào thumbnails để lấy byte[] dữ liệu
				ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
				// Chỉnh lại kích thức các ảnh khớp với 100x100 px.
				Thumbnails.of(part.getInputStream()).size(130, 400).toOutputStream(outputStream);
				bytes = outputStream.toByteArray();
			} catch (Exception e) {
				sendResponse(resp, "Đã xảy ra lỗi khi upload ảnh", "error");
				return;
			}
		}
		if (!isInsert && hasImage) {
			Image img = loginService.getImageByImgId(infor.getImgId());
			img.setFileName(part.getSubmittedFileName());
			img.setData(bytes);
			loginService.updateImage(img);
			loginService.updateInfor(infor);
			sendResponse(resp, "Cập nhật thành công", "success");
			return;
		}
		if (!isInsert && !hasImage) {
			loginService.updateInfor(infor);
			sendResponse(resp, "Cập nhật thành công", "success");
			return;
		}
		if (hasImage) {
			Image img = new Image(part.getSubmittedFileName(),
					part.getSubmittedFileName().substring(part.getSubmittedFileName().lastIndexOf(".") + 1),
					"ảnh đại diện", new Date(System.currentTimeMillis()), new Date(System.currentTimeMillis()), bytes);
			int imgId = loginService.saveImage(img);
			infor.setImgId(imgId);
		} else
			infor.setImgId(37);
		loginService.saveInfor(infor, user);
		sendResponse(resp, "Cập nhật thành công", "success");
	}

	private void validation(String name, String email, String phone, HttpServletResponse response) throws IOException {
		if (name == null) {
			String mess = "Họ và tên rỗng";
			sendResponse(response, mess, "error");
			return;
		}
		if (name.trim().length() > 100) {
			String mess = "Họ và tên được lưu giới hạn 100 ký tự";
			sendResponse(response, mess, "error");
			return;
		}
		if (email == null) {
			String mess = "Email rỗng";
			sendResponse(response, mess, "error");
			return;
		}
		if (email.trim().length() > 255) {
			String mess = "Email được lưu giới hạn 255 ký tự";
			sendResponse(response, mess, "error");
			return;
		}
		if (phone == null) {
			String mess = "Số điện thoại rỗng";
			sendResponse(response, mess, "error");
			return;
		}
		if (phone.trim().length() != 10 && phone.trim().length() != 11) {
			String mess = "Số điện thoại 10 hoặc 11 chữ số";
			sendResponse(response, mess, "error");
			return;
		}
	}

	private void sendResponse(HttpServletResponse response, String message, String status) throws IOException {
		JsonObjectBuilder errorResponse = Json.createObjectBuilder();
		errorResponse.add("status", status);
		errorResponse.add("message", message);

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(errorResponse.build().toString());
	}
}
