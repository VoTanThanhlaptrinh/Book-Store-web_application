
package controller.category_checkout;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.ResourceBundle;
import java.util.stream.Collectors;

import daoImp.CartDAOImp;
import daoImp.CartItemDAOImp;
import daoImp.OrderDaoImp;
import daoImp.OrderItemDaoImp;
import daoImp.ProductDAOImp;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.Address;
import models.Cart;
import models.CartItem;
import models.CartProductDetail;
import models.User;
import service.ILoginService;
import service.LoginService;
import serviceImplement.HienThiDonTrongGioHangImplement;

@WebServlet("/checkout")

public class CheckOutController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ILoginService loginService;

	public CheckOutController() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		OrderDaoImp orDaoImp = new OrderDaoImp();
		OrderItemDaoImp orItemDaoImp = new OrderItemDaoImp();
		CartItemDAOImp cartItemImp = new CartItemDAOImp();
		ProductDAOImp productDAOImp = new ProductDAOImp();
		User user = (User) session.getAttribute("user");

		@SuppressWarnings("unchecked")
		List<CartProductDetail> cDetail = (List<CartProductDetail>) session.getAttribute("cDetails");

		double shippingFee = (double) session.getAttribute("shippingFee");
		double total = (double) session.getAttribute("total");

		int orderID = orDaoImp.createOrder(user.getUserId(), (shippingFee + total), "pending");
		for (CartProductDetail cartProductDetail : cDetail) {
			orItemDaoImp.createOrderItem(orderID, cartProductDetail.getProductId(), cartProductDetail.getQuantity(),
					cartProductDetail.getPrice());

			System.out.println(cartProductDetail);

			cartItemImp.updateStatusCartItem(cartProductDetail.getCartItemId(), "checked");
			productDAOImp.updateQuantityProduct(cartProductDetail.getProductId(), cartProductDetail.getQuantity());
		}

		out.write("{\"success\": true, \"message\": \"Đã đặt hàng thành công\"}");
	}

}
