package controller;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.Comment;
import models.Evaluate;
import models.Information;
import models.Product;
import models.User;
import service.CategoriesServiceImp;
import service.EvaluateService;
import service.ICategoriesService;
import service.IEvaluateService;
import service.ILoginService;

@WebServlet("/detail")

public class DetailProductController extends HttpServlet {
	/**
	 *
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub

		HttpSession session = req.getSession(); // lấy session

		// gọi evaluate service từ session. Nếu chưa được tạo thì tạo mới.
		//IEvaluateService evaluateService = (IEvaluateService) session.getAttribute("evaluateService");
		IEvaluateService evaluateService = new EvaluateService();
		// gọi category service từ session. Nếu có thì tạo mới
		ICategoriesService categoriesService = (ICategoriesService) session.getAttribute("categoryService");
		if(categoriesService ==  null){
			categoriesService = new CategoriesServiceImp();
		}
		// gọi login service từ session. Nếu không có thì tạo mới.
		ILoginService loginService = (ILoginService) session.getAttribute("loginService");

		// lấy productId từ input hidden ở template. Dùng category service để lấy dữ
		// liệu từ db.
		int productId = Integer.valueOf(req.getParameter("productId"));
		Product p = categoriesService.getProductByProductId(productId);

		List<Evaluate> evaluates = evaluateService.get5EvaluateByProductId(productId);// lấy 5 đánh giá mới nhất của sản
																						// phẩm.
		// lấy thông tin về 5 user bình luận mới nhất về sản phẩm.
		//List<Information> infors = new ArrayList<Information>();
		//evaluates.forEach(e -> infors.add(loginService.getInforOfUser(e.getUserId())));
		//List<Comment> comments = new ArrayList<Comment>();
		//evaluates.forEach(e -> comments.add(evaluateService.getCommentByCommentId(e.getCommentId())));// lấy comment của
																										// từng user.
		//req.setAttribute("infors", infors);// truyền dữ liệu các thông tin người dùng vào request.
		req.setAttribute("product", p);// truyền dữ liệu quyển sách vào trong request.
		//req.setAttribute("comments", comments); // truyền dữ liệu comment vào trong request.
		req.getRequestDispatcher("webPage/categoryAndSingle/single.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		IEvaluateService evaluateService = (IEvaluateService) session.getAttribute("evaluateService");
		if (evaluateService == null)
			evaluateService = new EvaluateService();
		User user = (User) session.getAttribute("user");
		int productId = Integer.valueOf(req.getParameter("productId"));
		String content = req.getParameter("content");
		int rating = Integer.valueOf(req.getParameter("rate"));
		ILoginService loginService = (ILoginService) session.getAttribute("loginService");

		if (user == null) {
			String mess = "You have to login if you want comment";
			req.setAttribute("mess", mess);
		} else {
			Information infor = loginService.getInforOfUser(user.getUserId());
			if (infor == null) {
				String mess = "You don't have enough information. Update your information";
				req.setAttribute("mess", mess);
			} else {
				Comment comment = new Comment(rating, content, new Date(System.currentTimeMillis()),
						new Date(System.currentTimeMillis()));
				int commentId = evaluateService.saveComment(comment);
				Evaluate e = new Evaluate(user.getUserId(), productId, commentId, new Date(System.currentTimeMillis()),
						new Date(System.currentTimeMillis()));
				evaluateService.saveEvaluate(e);
			}
		}
		doGet(req, resp);
	}
}
