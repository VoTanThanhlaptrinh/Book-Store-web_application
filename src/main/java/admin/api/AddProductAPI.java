package admin.api;

import java.io.ByteArrayOutputStream;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
import java.util.Locale;
import java.util.ResourceBundle;

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
import models.Log;
import models.Product;
import models.User;
import service.CategoriesServiceImp;
import service.ICategoriesService;
import service.ILogService;
import service.ILoginService;
import service.LogServiceImpl;
import service.LoginService;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
		maxFileSize = 1024 * 1024 * 10, // 10MB
		maxRequestSize = 1024 * 1024 * 50 // 50MB
)
@WebServlet("/admin/api/add")
public class AddProductAPI extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ICategoriesService categoriesService;
	private ILoginService loginService;
	private ILogService logService;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException, NumberFormatException {
		// TODO Auto-generated method stub
		// lấy session
		HttpSession session = req.getSession();
		// lấy ngôn ngữ đang được sử dụng trên web
		String lang = (String) session.getAttribute("lang");
		if (lang == null) {
			lang = "vi"; // nếu null thiết lập mặc định là 'vi'
		}
		Locale locale = Locale.forLanguageTag(lang);
		ResourceBundle bundle = ResourceBundle.getBundle("messages", locale);
		// lấy user từ session
		User user = (User) session.getAttribute("user");
		try {
			String title = req.getParameter("name");
			int category = Integer.valueOf(req.getParameter("category"));
			int subCategory = Integer.valueOf(req.getParameter("subject"));
			String author = req.getParameter("author");
			String language = req.getParameter("language");
			String description = req.getParameter("description");
			int page = Integer.parseInt(req.getParameter("page"));
			int py = Integer.parseInt(req.getParameter("py"));
//			int id = Integer.parseInt(req.getParameter("id"));
			int quantity = Integer.parseInt(req.getParameter("quantity"));
			double price = Double.parseDouble(req.getParameter("price"));

			Part filePart = req.getPart("image"); // lấy ảnh

			// Kiểm tra dữ liệu
			if (filePart == null || filePart.getSize() == 0) {
				sendErrorResponse(resp, bundle.getString("product.image.null"));
				return;
			}

			// Kiểm tra MIME type của tệp ảnh
			String mimeType = filePart.getContentType();
			if (mimeType == null || (!mimeType.equals("image/png") && !mimeType.equals("image/jpeg"))) {
				sendErrorResponse(resp, bundle.getString("product.image.valid"));
				return;
			}

			if (!isValidString(title)) {
				sendErrorResponse(resp, bundle.getString("product.title.null"));
				return;
			}
			if (!isValidString(author)) {
				sendErrorResponse(resp, bundle.getString("product.author.null"));
				return;
			}

			if (!isValidString(language)) {
				sendErrorResponse(resp, bundle.getString("product.language.null"));
				return;
			}

			if (!isValidString(description)) {
				sendErrorResponse(resp, bundle.getString("product.description.null"));
				return;
			}

			if (!isValidInt(page)) {
				sendErrorResponse(resp, bundle.getString("product.page.null"));
				return;
			}

			if (!isValidInt(py)) {
				sendErrorResponse(resp, bundle.getString("product.py.null"));
				return;
			}

//			if (!isValidInt(id)) {
//				sendErrorResponse(resp, bundle.getString("product.id.null"));
//				return;
//			}
			if (!isValidInt(category)) {
				sendErrorResponse(resp, bundle.getString("product.category.null"));
				return;
			}
			if (!isValidInt(subCategory)) {
				sendErrorResponse(resp, bundle.getString("product.subCategory.null"));
				return;
			}

			if (!isValidInt(quantity)) {
				sendErrorResponse(resp, bundle.getString("product.quantity.null"));
				return;
			}

			if (!isValidDouble(price)) {
				sendErrorResponse(resp, bundle.getString("product.price.null"));
				return;
			}

			// Tạo dữ liệu ảnh và lưu xuống db
			Image image = new Image(filePart.getSubmittedFileName(), mimeType, "ảnh product",
					new Date(System.currentTimeMillis()), new Date(System.currentTimeMillis()), getData(filePart));
			int imageId = loginService.saveImage(image);


			
			Product product = new Product();
			// Lưu product mới
			product.setCreateDate(new Date(System.currentTimeMillis()));
			product.setAddedByUser(user.getUserId());
			product.setTitle(title);
			product.setAuthor(author);
			product.setLanguage(language);
			product.setDescription(description);
			product.setPage(page);
			product.setPublishYear(py);
			product.setQuantity(quantity);
			product.setPrice(price);
			product.setCategory_id(subCategory);
			product.setCategory_parent(category);
			product.setUpdateDate(new Date(System.currentTimeMillis()));
			product.setImgId(imageId);
			categoriesService.saveProduct(product);

			logService.info(new Log(user.getUserId(), "infor", "Product", "/admin/api/add", "Thêm sách thành công"));
			// Nếu thành công thì gửi thông báo đến client
			JsonObjectBuilder successResponse = Json.createObjectBuilder();
			successResponse.add("status", "success");
			successResponse.add("message", "Thêm sản phẩm thành công!");

			resp.setContentType("application/json");
			resp.setCharacterEncoding("UTF-8");
			resp.getWriter().write(successResponse.build().toString());
		} catch (NumberFormatException e) {
			sendErrorResponse(resp, bundle.getString("wrong.information"));
			logService.error(new Log(user.getUserId(), "error", "Product", "/admin/api/add", bundle.getString("wrong.information")));

		} catch (Exception e) { // lỗi thì gửi thông báo
			sendErrorResponse(resp, bundle.getString("system_error"));
			logService.error(new Log(user.getUserId(), "error", "Product", "/admin/api/add",  bundle.getString("system_error")));

		}
	}

	private byte[] getData(Part filePart) throws IOException {
		try (InputStream inputStream = filePart.getInputStream();
				ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream()) {
			byte[] buffer = new byte[8192]; // 8KB buffer
			int bytesRead;
			while ((bytesRead = inputStream.read(buffer)) != -1) {
				byteArrayOutputStream.write(buffer, 0, bytesRead);
			}
			return byteArrayOutputStream.toByteArray();
		}
	}

	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		categoriesService = new CategoriesServiceImp();
		loginService = new LoginService();
		logService = new LogServiceImpl();
	}

	private boolean isValidString(String value) {
		return value != null && !value.trim().isEmpty();
	}

	private boolean isValidInt(int value) {
		return value >= 0; // Không âm
	}

	private boolean isValidDouble(double value) {
		return value >= 0.0; // Không âm
	}

	private void sendErrorResponse(HttpServletResponse response, String errorMessage) throws IOException {
		JsonObjectBuilder errorResponse = Json.createObjectBuilder();
		errorResponse.add("status", "error");
		errorResponse.add("error", errorMessage);

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(errorResponse.build().toString());
		
	}
}
