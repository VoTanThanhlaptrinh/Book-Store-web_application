package controller.category_checkout;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.PurchaseHistory;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import org.json.JSONObject;

import daoImp.OrderDaoImp;

@WebServlet("/cancelOrder")
public class CancelOrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CancelOrderController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("application/json; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		JSONObject jsonResponse = new JSONObject();

		String orderIdParam = request.getParameter("orderId");
		int orderId = Integer.parseInt(orderIdParam);

		OrderDaoImp oImp = new OrderDaoImp();
		boolean success = oImp.updateOrderStatus(orderId, "deleted");

		if (success) {
			jsonResponse.put("success", true);
		} else {
			jsonResponse.put("success", false);
			jsonResponse.put("message", "Đơn hàng không tồn tại");
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
		}
		out.print(jsonResponse.toString());

	}

}
