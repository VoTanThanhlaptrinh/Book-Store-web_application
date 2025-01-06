package controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

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
import serviceImplement.HienThiDonTrongGioHangImplement;

@WebServlet("/checkout")
public class CheckOutController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckOutController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 HttpSession session = request.getSession();
		 User user = (User) session.getAttribute("user");
		String[] selectedItems = request.getParameterValues("selectedItems");
		String productId = request.getParameter("id");
		String id =  request.getParameter("id");
		Cart cart = (Cart) session.getAttribute("cart");
		String quantity = request.getParameter("amount");
		String pdQuantity = request.getParameter("pdQuantity");
		
		
		//System.out.println( "so luong" +  quantity + "??");
	//	System.out.println(productId + " product id");
		if (user == null) {
			String loginMessage = "bạn chưa đăng nhập, đăng nhập để tiếp tục";
			request.setAttribute("productId", productId);
			request.setAttribute("loginMessage", loginMessage);
			request.getRequestDispatcher("webPage/login/login.jsp").forward(request, response);
		}
		else if (selectedItems == null && productId == null) {
			String unSelectedMess = "vui lòng chọn sản phẩm để thanh toán";
			request.setAttribute("usmess", unSelectedMess);
			request.getRequestDispatcher("webPage/giohang/cart.jsp").forward(request, response);
		}
	
		HienThiDonTrongGioHangImplement hienThi = new HienThiDonTrongGioHangImplement(user);
		CartItem item;
		Date currentDate = new Date(System.currentTimeMillis());
		if (user != null && selectedItems == null) {
			System.out.println("pdQuantity1; " + pdQuantity);
			if (Integer.parseInt(pdQuantity) < Integer.parseInt(quantity)) {
				String noticeMess = "đặt quá số lượng quy định";
				request.setAttribute("noMess", noticeMess);
				request.getRequestDispatcher("webPage/categoryAndSingle/single.jsp").forward(request, response);
			}
			
			item = new CartItem(cart.getCartId(), Integer.parseInt(quantity),Integer.parseInt(id) , currentDate, currentDate);
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
		                    quantities.add(Integer.parseInt(parts[1]));  // quantity
		                    productIDs.add(Integer.parseInt(parts[2]));  // productID
		                
		                }
		            }
			 
		String checkMess = "";
		int size = hienThi.hienThiGioHang(cart.getCartId(), "pending").size();
		int index = 0;
		
		
		for (int i = 0; i < cartItemIDs.size(); i++) {
			System.out.println("cartitemid: " + cartItemIDs.get(i));
			System.out.println("quantity: " + quantities.get(i));
			System.out.println("prId: " + productIDs.get(i));
		
		
			
			if (!hienThi.capNhatTrangThaiHang(cartItemIDs.get(i), "checked") ) {
				checkMess = "Có lỗi trong quá trình thanh toán";
				break;
			}
			hienThi.capNhatSoLuongProduct(quantities.get(i), productIDs.get(i));
			index++;	
		}
		if (size == index) {	
			hienThi.capNhatTrangThaiGioHang(index, checkMess, currentDate);
		}
		session.setAttribute("cart", cart);
		checkMess = ("Thanh Toán Thành Công");
		request.setAttribute("mess", checkMess);
		request.getRequestDispatcher("webPage/giohang/thanhcong.jsp").forward(request, response);
		}
	}

}
