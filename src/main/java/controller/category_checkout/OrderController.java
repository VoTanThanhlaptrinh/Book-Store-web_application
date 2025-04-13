package controller.category_checkout;

import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.Cart;
import models.CartItem;
import models.OrderItem;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import daoImp.CartItemDAOImp;

/**
 * Servlet implementation class OrderController
 */
@WebServlet("/order")
public class OrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public OrderController() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String orderDataJson = request.getParameter("orderData");
		CartItemDAOImp daoCart = new CartItemDAOImp();
		  

		if (orderDataJson != null && !orderDataJson.isEmpty()) {
			Gson gson = new Gson();
			List<CartItem> cartItems = gson.fromJson(orderDataJson, new TypeToken<List<CartItem>>() {
			}.getType());

			if (!cartItems.isEmpty()) {
				List<String> errors = new ArrayList<>();

				for (CartItem item : cartItems) {
					int productId = item.getProductId();
					int quantity = item.getQuantity();

					int availableStock = daoCart.getProductQuantityByProductId(productId);
					
					
					System.out.println(productId);
					System.out.println(quantity);
					System.out.println(availableStock);
					if (availableStock < quantity) {
						errors.add("Sản phẩm ID " + productId + " không đủ hàng (cần " + quantity + ", còn "
								+ availableStock + ")");
					    request.setAttribute("errors", errors);
					    request.getRequestDispatcher("webPage/giohang/cart.jsp").forward(request, response);
					    return;
					}
				}
				
				request.getRequestDispatcher("webPage/order/order.jsp").forward(request, response);
			}

		}
	}

}
