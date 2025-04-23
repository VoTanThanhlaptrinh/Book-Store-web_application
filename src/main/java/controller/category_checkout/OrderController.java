package controller.category_checkout;

import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.Cart;
import models.CartData;
import models.CartItem;
import models.CartProductDetail;
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
		if(orderDataJson==null || orderDataJson.isEmpty()) {
			System.out.println("không có dữ liệu đơn hàng");
		}

		if (orderDataJson != null && !orderDataJson.isEmpty()) {
			System.out.println("Có dữ liệu đơn hàng");
			Gson gson = new Gson();
			CartData cartData = gson.fromJson(orderDataJson, CartData.class);

			List<CartProductDetail> cDetails = cartData.getCartProductDetails();
			
			if (cDetails == null) {
				System.out.println("null");
				request.getRequestDispatcher("webPage/giohang/cart.jsp").forward(request, response);
				return;
			}
			
			double total = cartData.getTotal();
			for (CartProductDetail c : cDetails) {
				int quantity = c.getQuantity();
				int pbQuantity = daoCart.getProductQuantityByProductId(c.getProductId());
				System.out.println(quantity+" "+pbQuantity+" "+c.getImgId());
				if (quantity > pbQuantity) {
					System.out.println("so lượng mua nhiều hơn tồn kho");
					request.getRequestDispatcher("webPage/giohang/cart.jsp").forward(request, response);
					return;
				}

			}
						
			HttpSession session = request.getSession();
			session.setAttribute("cDetails", cDetails);
			session.setAttribute("cDetailsSize", cDetails.size());
			session.setAttribute("total", total);
			request.getRequestDispatcher("webPage/order/order.jsp").forward(request, response);
		}

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
}
