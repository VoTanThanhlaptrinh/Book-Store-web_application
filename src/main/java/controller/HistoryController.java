package controller;

import java.io.IOException;
import java.time.Duration;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Locale;
import java.util.ResourceBundle;

import daoImp.OrderDaoImp;
import daoImp.PurchaseHistoryDaoImp;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.Cart;
import models.CartProductDetail;
import models.PurchaseHistory;
import models.User;
import service.EvaluateService;
import service.IEvaluateService;
import serviceImplement.HienThiDonTrongGioHangImplement;

@WebServlet("/history")
public class HistoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	private IEvaluateService evaluateService;

	public HistoryController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		PurchaseHistoryDaoImp pImp = new PurchaseHistoryDaoImp();
		OrderDaoImp oImp = new OrderDaoImp();

		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		String lang = (String) session.getAttribute("lang");
		if (lang == null) {
			lang = "vi";
		}
		Locale locale = Locale.forLanguageTag(lang);
		ResourceBundle bundle = ResourceBundle.getBundle("messages", locale);
		if (user == null) {
			String loginMessage = bundle.getString("error.notLoggedIn");
			session.setAttribute("loginMessage", loginMessage);
			response.sendRedirect("login");
			return;
		} else {

			List<PurchaseHistory> ls = pImp.getPurchasedProductsByUser(user.getUserId());

			for (PurchaseHistory item : ls) {
				int hours = oImp.getHoursSinceOrder(item.getOrderId());
				
				// Chỉ cho phép hủy nếu trạng thái là "Đang xử lý" và thời gian dưới 2 giờ
				if (hours < 2 && !"deleted".equals(item.getStatus())) {
					item.setCanCancel(true);
				} else {
					item.setCanCancel(false);
				}
			}

			session.setAttribute("evaluate", evaluateService);
			session.setAttribute("history", ls);

//			  request.getRequestDispatcher("webPage/giohang/history.jsp").forward(request,
//			  response); 
//			 

			request.getRequestDispatcher("webPage/giohang/lichsu.jsp").forward(request, response);

		}
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
	}
}
