package controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.ResourceBundle;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	private ILoginService loginService;

	public CheckOutController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession();
		String mess = (String) session.getAttribute("mess");
		session.removeAttribute("mess");
		req.setAttribute("mess", mess);
		req.getRequestDispatcher("webPage/giohang/thanhcong.jsp").forward(req, resp);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		String[] selectedItems = request.getParameterValues("selectedItems");
		String productId = request.getParameter("id");
		String id = request.getParameter("id");
		Cart cart = (Cart) session.getAttribute("cart");
		String quantity = request.getParameter("amount");
		String pdQuantity = request.getParameter("pdQuantity");

		// Lấy ngôn ngữ từ session hoặc mặc định là "vi"
		String lang = (String) session.getAttribute("lang");
		if (lang == null) {
			lang = "vi";
		}
		Locale locale = Locale.forLanguageTag(lang);
		ResourceBundle bundle = ResourceBundle.getBundle("messages", locale);

		// System.out.println( "so luong" + quantity + "??");
		// System.out.println(productId + " product id");
		if (user == null) {
			String loginMessage = bundle.getString("error.notLoggedIn");
			request.setAttribute("productId", productId);
			session.setAttribute("loginMessage", loginMessage);
			response.sendRedirect("login");
		} else if (selectedItems == null && productId == null) {
			// kiểm tra nếu người dùng chưa cập nhật đủ thông tin thì không cho họ mua.
			System.out.println("infor:"+loginService.getInforOfUser(user.getUserId()));
			if (loginService.getInforOfUser(user.getUserId()) == null) {
				String updateCheckOut = bundle.getString("update.info.required");
				request.setAttribute("mess", updateCheckOut);
				response.sendRedirect("upload");
				return;
			}

			String unSelectedMess = bundle.getString("select.product.required");
			request.setAttribute("usmess", unSelectedMess);
			request.getRequestDispatcher("webPage/giohang/cart.jsp").forward(request, response);
			return;
		}

		HienThiDonTrongGioHangImplement hienThi = new HienThiDonTrongGioHangImplement(user);
		CartItem item;
		Date currentDate = new Date(System.currentTimeMillis());
		if (user != null && selectedItems == null) {
			// System.out.println("pdQuantity1; " + pdQuantity);
			if (loginService.getInforOfUser(user.getUserId()) == null) {
				String updateCheckOut = bundle.getString("update.info.required");
				request.setAttribute("mess", updateCheckOut);
				response.sendRedirect("upload");
				return;
			}
			if (Integer.parseInt(pdQuantity) < Integer.parseInt(quantity)) {
				String noticeMess = bundle.getString("quantity.exceed");
				request.setAttribute("noMess", noticeMess);
				request.getRequestDispatcher("webPage/categoryAndSingle/single.jsp").forward(request, response);
				return;
			}

			item = new CartItem(cart.getCartId(), Integer.parseInt(quantity), Integer.parseInt(id), currentDate,
					currentDate);
			item.setStatus("pending");
			hienThi.themVaoGioHang(item);

			List<CartProductDetail> ls = hienThi.hienThiGioHang(cart.getCartId(), "pending");

			session.setAttribute("cartProduct", ls);
			session.setAttribute("sumCart", ls.size());
			request.getRequestDispatcher("webPage/giohang/cart.jsp").forward(request, response);
		}

		else {

			// Tạo ba danh sách riêng biệt
			List<Integer> cartItemIDs = new ArrayList<>();
			List<Integer> quantities = new ArrayList<>();
			List<Integer> productIDs = new ArrayList<>();

			for (String it : selectedItems) {
				// Tách giá trị bằng dấu "|"
				String[] parts = it.split("\\,");
				if (parts.length == 3) {
					System.out.println();
					// Thêm giá trị vào từng danh sách
					cartItemIDs.add(Integer.parseInt(parts[0])); // cartItemID
					quantities.add(Integer.parseInt(parts[1])); // quantity
					productIDs.add(Integer.parseInt(parts[2])); // productID

				}
			}

			String checkMess = "";
			int size = hienThi.hienThiGioHang(cart.getCartId(), "pending").size();
			int index = 0;

			for (int i = 0; i < cartItemIDs.size(); i++) {
				// System.out.println("cartitemid: " + cartItemIDs.get(i));
				// System.out.println("quantity: " + quantities.get(i));
				// System.out.println("prId: " + productIDs.get(i));

				if (!hienThi.capNhatTrangThaiHang(cartItemIDs.get(i), "checked")) {
					checkMess = bundle.getString("checkout.error");
					break;
				}
				hienThi.capNhatSoLuongProduct(quantities.get(i), productIDs.get(i));
				index++;
			}
			if (size == index) {
				hienThi.capNhatTrangThaiGioHang(index, checkMess, currentDate);
			}
			session.setAttribute("cart", cart);
			checkMess = bundle.getString("checkout.success");
			session.setAttribute("mess", checkMess);
			request.getRequestDispatcher("webPage/giohang/thanhcong.jsp").forward(request, response);
		}
	}

	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		loginService = new LoginService();
	}
}
