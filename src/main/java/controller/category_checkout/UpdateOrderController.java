package controller.category_checkout;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.User;
import tool.VerifySignatureUtil;

import java.io.IOException;

import daoImp.OrderDaoImp;

/**
 * Servlet implementation class UpdateOrderController
 */
@WebServlet("/updateOrder")
public class UpdateOrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private VerifySignatureUtil verify;
	private OrderDaoImp oImp;

	public UpdateOrderController() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();

		User user = (User) session.getAttribute("user");

		String orderIdStr = request.getParameter("orderID");
		String signature = request.getParameter("signature");
		String publicKey = request.getParameter("publicKey");
		String hashValue = request.getParameter("hashValue");

		boolean checkHashValue = verify.verifySignature(hashValue, signature, publicKey);

		if (!checkHashValue) {
			sendJsonError(response,HttpServletResponse.SC_BAD_REQUEST, "Vui lòng sử dụng hash value do hệ thống cung cấp");
			return;
		}

		if (orderIdStr == null || orderIdStr.isEmpty()) {
			sendJsonError(response,HttpServletResponse.SC_BAD_REQUEST, "Thiếu orderID");
			return;
		}

		int orderID;
		try {
			orderID = Integer.parseInt(orderIdStr);
		} catch (NumberFormatException e) {
			sendJsonError(response,HttpServletResponse.SC_BAD_REQUEST, "orderID không hợp lệ");
			return;
		}
		if (!oImp.hasActivePublicKey(orderID, publicKey)) {
			oImp.savePublicKey(user.getUserId(), publicKey);
		}

		
		
		oImp.updateOrderSignature(orderID, signature);// cập nhật chữ kí
		oImp.updateHashValue(orderID, hashValue);
		oImp.updateOrderStatus(orderID, "checked");// chuyển order từ pending thành checked
		oImp.updateOrderPublicKey(orderID, publicKey);// lưu public key xuống database
	
		
		
		
		response.setStatus(HttpServletResponse.SC_OK);
	}
	@Override
	public void init() throws ServletException {
	    super.init();
	    verify = new VerifySignatureUtil();
	    oImp = new OrderDaoImp();
	}
	private void sendJsonError(HttpServletResponse response, int statusCode, String errorMessage)  {

	    try {
		    response.setStatus(statusCode);
		    response.setContentType("application/json");
		    response.setCharacterEncoding("UTF-8");
			response.getWriter().write("{\"error\": \"" + errorMessage.replace("\"", "\\\"") + "\"}");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
