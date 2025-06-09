package controller.category_checkout;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.*;
import models.User;
import daoImp.*;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.DecimalFormat;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import com.google.gson.Gson;

import daoImp.AddressDaoImp;

@WebServlet("/reorder")
public class ReorderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReorderController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		  int orderId = Integer.parseInt(request.getParameter("orderId"));
	        HttpSession session = request.getSession();
	        User user = (User) session.getAttribute("user");
	        
	        Address addressDefault = (Address) session.getAttribute("addressDefault");
	        if (addressDefault == null) {
	            AddressDaoImp addressDao = new AddressDaoImp();
	            addressDefault = addressDao.getAddressDefault(user.getUserId());
	            session.setAttribute("addressDefault", addressDefault);
	        }

	        String username = addressDefault.getFull_name();
	        OrderDaoImp oImp = new OrderDaoImp();
	        PurchaseHistoryDaoImp pImp = new PurchaseHistoryDaoImp();

	        Order o = oImp.getOrderById(orderId);
	        List<PurchaseHistory> items = pImp.getPurchaseHistoryByOrderId(orderId);
	        StringBuilder prNames = new StringBuilder();
	        int total = (int) o.getTotalPrice();

	        for (int i = 0; i < items.size(); i++) {
	            prNames.append(items.get(i).getProductName());
	            if (i < items.size() - 1) prNames.append(", ");
	           
	        }
	        
	        StringTokenizer dateTokens = new StringTokenizer(o.getCreateDate().toString()," ");
	        String date = dateTokens.nextToken();
	      
	        String totalFormatted = formatAmount(total);
	        String hash = generateOrderHash(
	            String.valueOf(orderId),
	            username,
	            date,
	            prNames.toString(),
	            totalFormatted
	        );

	        
	        
	        
	        // Lưu thông tin vào session
	        session.setAttribute("reorder_orderId", orderId);
	        session.setAttribute("reorder_customerName", username);
	        session.setAttribute("reorder_orderDate", date);
	        session.setAttribute("reorder_products", prNames.toString());
	        session.setAttribute("reorder_total", totalFormatted);
	        session.setAttribute("reorder_hash", hash);

	        // Chuyển tới trang ký
	        request.getRequestDispatcher("webPage/use_tool/ky-lai-signature.jsp").forward(request, response);;
	}
	public static String formatAmount(int amount) {
	    DecimalFormat formatter = new DecimalFormat("#,###");
	    return formatter.format(amount);
	}
	public static String generateOrderHash(String orderId, String customerName, String orderDate, String products, String totalAmount) {
	    // Dùng LinkedHashMap để giữ đúng thứ tự key giống client
	    Map<String, String> data = new LinkedHashMap<>();
	    data.put("orderId", orderId);
	    data.put("customerName", customerName);
	    data.put("orderDate", orderDate);
	    data.put("products", products);
	    data.put("totalAmount", totalAmount);

	    Gson gson = new Gson();
	    String jsonString = gson.toJson(data);  // Sẽ giống hệt JSON.stringify() ở client

	    try {
	        MessageDigest digest = MessageDigest.getInstance("SHA-256");
	        byte[] encodedHash = digest.digest(jsonString.getBytes(StandardCharsets.UTF_8));
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
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
