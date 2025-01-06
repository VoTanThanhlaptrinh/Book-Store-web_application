package controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
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
		System.out.println(title);
		String d = req.getParameter("price");
		System.out.println(d);
		double price = Double.valueOf(d);
		String type = req.getParameter("type");

		String q = req.getParameter("quantity");
		int quantity = Integer.valueOf(q);
		String description = req.getParameter("description");

		Part part = req.getPart("file");
		String mimeType = part.getContentType();
		if (!"image/png".equals(mimeType) && !"image/jpeg".equals(mimeType)) {
			req.setAttribute("mess", "Chỉ chấp nhận .png hoặc .jpg");
		} else {
			User user = (User) session.getAttribute("user");
			System.out.println(part.getSubmittedFileName().substring(part.getSubmittedFileName().lastIndexOf(".") + 1));
			ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
			Thumbnails.of(part.getInputStream()).size(600, 600).outputFormat("png").toOutputStream(outputStream);
			Image img = new Image(part.getSubmittedFileName(),
					part.getSubmittedFileName().substring(part.getSubmittedFileName().lastIndexOf(".") + 1),
					"ảnh đại diện", new Date(System.currentTimeMillis()), new Date(System.currentTimeMillis()),
					outputStream.toByteArray());

			int imgId = loginService.saveImage(img);
			Product p = new Product(user.getUserId(), title, price, description, type, imgId,
					new Date(System.currentTimeMillis()), new Date(System.currentTimeMillis()), quantity);
			categoriesService.saveProduct(p);
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
