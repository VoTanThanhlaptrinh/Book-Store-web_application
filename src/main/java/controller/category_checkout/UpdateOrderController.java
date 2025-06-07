package controller.category_checkout;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import daoImp.OrderDaoImp;

/**
 * Servlet implementation class UpdateOrderController
 */
@WebServlet("/updateOrder")
public class UpdateOrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public UpdateOrderController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   OrderDaoImp oImp = new OrderDaoImp();
		
	   String orderIdStr = request.getParameter("orderID");
	   String signature = request.getParameter("signature");
	   
	   
	   if (orderIdStr == null || orderIdStr.isEmpty()) {
	       response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Thiếu orderID");
	       return;
	   }

	   int orderID;
	   try {
	       orderID = Integer.parseInt(orderIdStr);
	   } catch (NumberFormatException e) {
	       response.sendError(HttpServletResponse.SC_BAD_REQUEST, "orderID không hợp lệ");
	       return;
	   }

	    oImp.updateOrderSignature(orderID, signature);//cập nhật chữ kí
	    oImp.updateOrderStatus(orderID, "checked");//chuyển order từ pending thành checked
	    response.setStatus(HttpServletResponse.SC_OK);
	}

}
