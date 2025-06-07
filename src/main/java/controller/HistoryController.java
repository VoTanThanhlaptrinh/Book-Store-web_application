package controller;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.DecimalFormat;
import java.time.Duration;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.ResourceBundle;

import javax.print.attribute.standard.MediaSize.Other;

import daoImp.AddressDaoImp;
import daoImp.OrderDaoImp;
import daoImp.PurchaseHistoryDaoImp;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.Address;
import models.Cart;
import models.CartProductDetail;
import models.PurchaseHistory;
import models.User;
import models.Order;
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
		 AddressDaoImp addressDao = new AddressDaoImp();
		
		
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
			Address addressDefault = (Address) session.getAttribute("addressDefault");
		      if (addressDefault == null) {
		            addressDefault = addressDao.getAddressDefault(user.getUserId());
		            session.setAttribute("addressDefault", addressDefault);
		        }

			
			String username = addressDefault.getFull_name();
			
			List<String> listProductName = new ArrayList<>();
	
			List<Order> orders = oImp.getOrdersByUserId(user.getUserId());
			
			List<Integer> orderLs = new ArrayList<>();
			
			for (int i = 0; i < orders.size(); i++ ) {		
				orderLs.add(orders.get(i).getOrderId());
			}
			
			
			
			Map<Integer, List<PurchaseHistory>> orderHistoryMap = new HashMap<>();
			for (Order o : orders) {
				 StringBuilder prNames = new StringBuilder();
			    int totalPrice = 0;
			    List<PurchaseHistory> ls = pImp.getPurchaseHistoryByOrderId(o.getOrderId());
			    orderHistoryMap.put(o.getOrderId(), ls);

			   
			    for (int i = 0; i < ls.size(); i++) {
			        PurchaseHistory item = ls.get(i);
			        prNames.append(item.getProductName());
			        if (i < ls.size() - 1) {
			            prNames.append(", ");
			        }
			        totalPrice += item.getPrice();

			        int hours = oImp.getHoursSinceOrder(item.getOrderId());
			        item.setCanCancel(hours < 2 && !"deleted".equals(item.getStatus()));
			    }

			    // Lưu tổng tiền (nếu muốn lưu dạng số)
			    o.setTotalPrice(totalPrice);

			    o.setTotalFormatted(formatAmount(totalPrice));
			    // Tinh hash
			    String generatedHash = generateOrderHash(
			        String.valueOf(o.getOrderId()),
			        username,
			        o.getCreateDate().toString(),
			        prNames.toString(),
			        formatAmount(totalPrice) // Định dạng giống client, ví dụ "1.000.000đ"
			    );
			    System.out.println(o.getOrderId());
			    System.out.println(username);
			    System.out.println(o.getCreateDate().toString());
			    System.out.println(prNames.toString());
			    System.out.println(formatAmount(totalPrice) );
			    if (o.getSignature() == null || o.getSignature().isEmpty()) {
			        o.setSignatureStatus("Chua ky");
			    } else if (generatedHash.equals(o.getSignature())) {
			        o.setSignatureStatus("Da ky - Toan ven");
			    } else {
			        o.setSignatureStatus("Da ky - Thong tin da thay doi");
			    }
			}
			System.out.println("history:" + orderHistoryMap.size());
			
			
			
			session.setAttribute("evaluate", evaluateService);
			session.setAttribute("history", orderHistoryMap);
			session.setAttribute("orders", orders);
//			  request.getRequestDispatcher("webPage/giohang/history.jsp").forward(request,
//			  response); 
//			 

			request.getRequestDispatcher("webPage/giohang/lichsu.jsp").forward(request, response);

		}
	}
	public static String formatAmount(int amount) {
	    DecimalFormat formatter = new DecimalFormat("#,###");
	    return formatter.format(amount);
	}
    public static String generateOrderHash(String orderId, String customerName, String orderDate, String products, String totalAmount) {
        // 1. Gộp dữ liệu thành chuỗi JSON giống JS (không có dấu)
        String rawData = String.format(
            "{\"orderId\":\"%s\",\"customerName\":\"%s\",\"orderDate\":\"%s\",\"products\":\"%s\",\"totalAmount\":\"%s\"}",
            orderId, customerName, orderDate, products, totalAmount
        );

        // 2. Băm SHA-256
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] encodedHash = digest.digest(rawData.getBytes(StandardCharsets.UTF_8));
            return bytesToHex(encodedHash);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null;
        }
    }

    // 3. Chuyển bytes -> hex string
    private static String bytesToHex(byte[] hash) {
        StringBuilder hexString = new StringBuilder(2 * hash.length);
        for (byte b : hash)
            hexString.append(String.format("%02x", b));
        return hexString.toString();
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
