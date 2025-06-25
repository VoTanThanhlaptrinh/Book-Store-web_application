package controller.category_checkout;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.OrderItem;

import java.io.IOException;
import java.util.List;

import org.apache.catalina.connector.Response;

import daoImp.OrderDaoImp;
import daoImp.OrderItemDaoImp;
import daoImp.ProductDAOImp;

/**
 * Servlet implementation class CancelSignatureController
 */
@WebServlet("/cancelSignature")
public class CancelSignatureController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CancelSignatureController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int orderID =Integer.valueOf(request.getParameter("orderID"));
		OrderDaoImp oImp = new OrderDaoImp();
		ProductDAOImp pImp = new ProductDAOImp();
		oImp.updateOrderStatus(orderID, "deleted");
		
		OrderItemDaoImp oItemDaoImp = new OrderItemDaoImp();
		 List<OrderItem> orderItemsByOrderId = oItemDaoImp.getOrderItemsByOrderId(orderID);
		for (OrderItem orderItem : orderItemsByOrderId) {
			int quantity = orderItem.getQuantity()*-1;
			pImp.updateQuantityProduct(orderItem.getProductId(), quantity);
		}
		response.setStatus(HttpServletResponse.SC_OK);
	}

}
