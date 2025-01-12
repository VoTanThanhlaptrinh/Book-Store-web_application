package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.Comment;
import models.Evaluate;
import models.Product;
import models.User;
import service.EvaluateService;
import service.IEvaluateService;
import service.ILoginService;
import service.LoginService;
import serviceImplement.HienThiDanhSachImp;

public class BookDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	private IEvaluateService evaluateService;
	private ILoginService loginService;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		HienThiDanhSachImp hienThi = new HienThiDanhSachImp();
		String id = request.getParameter("id");
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		Product sach = hienThi.hienThiSachTheoId(Integer.parseInt(id));

		if (user == null) {
			request.setAttribute("anouce", user);
		}

		// System.out.println("id cua nguoi dung" + user.getUsername());
		session.setAttribute("product", sach);

		List<Evaluate> evaluates = evaluateService.getEvaluatesByProductId(sach.getProductId());

		List<Comment> comments = new ArrayList<Comment>();
		evaluates.forEach(e -> comments.add(evaluateService.getCommentByCommentId(e.getCommentId())));

		List<String> usernames = new ArrayList<String>();
		evaluates.forEach(e -> usernames.add(loginService.getUsername(e.getUserId())));

		List<Integer> imgIds = new ArrayList<Integer>();
		evaluates.forEach(e -> imgIds.add(loginService.getInforOfUser(e.getUserId()).getImgId()));

		request.setAttribute("evaluates", evaluates);
		request.setAttribute("comments", comments);
		request.setAttribute("usernames", usernames);
		request.setAttribute("imgIds", imgIds);

		request.getRequestDispatcher("webPage/categoryAndSingle/single.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		evaluateService = new EvaluateService();
		loginService = new LoginService();
	}
}
