package controller.product;

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
import models.Product;
import models.User;
import net.coobird.thumbnailator.Thumbnails;
import service.CategoriesServiceImp;
import service.ICategoriesService;
import service.ILoginService;
import service.LoginService;

@WebServlet("/addProduct")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 1, // 1MB
		maxFileSize = 1024 * 1024 * 10, // 10MB
		maxRequestSize = 1024 * 1024 * 50 // 50MB
)
public class AddProductController extends HttpServlet {
	private ICategoriesService categoriesService;
	private ILoginService loginService;
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");
		if (user != null && user.getRoles().contains("admin")) {
			req.getRequestDispatcher("/webPage/trangChu/addProduct.jsp").forward(req, resp);
		} else {
			req.setAttribute("mess", "Đăng nhập tài khoản với quyền admin để sử dụng");
			req.getRequestDispatcher("/webPage/login/login.jsp").forward(req, resp);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();

		String title = req.getParameter("title");
		String d = req.getParameter("price");
		double price = Double.valueOf(d);
		String type = req.getParameter("type");

		String q = req.getParameter("quantity");
		int quantity = Integer.valueOf(q);
		String description = req.getParameter("description");

		Part part = req.getPart("file");
		User user = (User) session.getAttribute("user");
		
		String fileName = part.getSubmittedFileName();
		String fileExtension = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
		System.out.println("File extension: " + fileExtension);

		// Validate the file extension
		if (!"png".equals(fileExtension) && !"jpg".equals(fileExtension) && !"jpeg".equals(fileExtension)) {
			req.setAttribute("mess", "Chỉ chấp nhận tệp ảnh .png, .jpg, hoặc .jpeg.");
			return;
		}

		try {
			// Process and resize the uploaded image
			ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
			Thumbnails.of(part.getInputStream()).size(600, 600).toOutputStream(outputStream);

			// Create the Image object
			Image img = new Image(fileName, fileExtension, "ảnh đại diện", new Date(System.currentTimeMillis()),
					new Date(System.currentTimeMillis()), outputStream.toByteArray());

			// Save the image and get the image ID
			int imgId = loginService.saveImage(img);
			if (imgId <= 0) {
				req.setAttribute("mess", "Không thể lưu ảnh.");
				return;
			}

			// Create the Product object
			Product p = new Product();
					/*
						 * new Product(user.getUserId(), title, price, description, imgId, new
						 * Date(System.currentTimeMillis()), new Date(System.currentTimeMillis()),
						 * quantity,5,1);
						 */

			// Save the product
			categoriesService.saveProduct(p);
		} catch (IOException e) {
			e.printStackTrace();
			req.setAttribute("mess", "Đã xảy ra lỗi khi xử lý ảnh.");
		}

		doGet(req, resp);
	}

	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		categoriesService = new CategoriesServiceImp();
		loginService = new LoginService();
	}
}
