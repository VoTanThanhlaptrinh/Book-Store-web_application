package controller;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.security.KeyFactory;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.PublicKey;
import java.security.spec.X509EncodedKeySpec;
import java.text.DecimalFormat;
import java.time.Duration;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.ResourceBundle;

import javax.crypto.Cipher;
import javax.print.attribute.standard.MediaSize.Other;

import com.google.gson.Gson;

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
				
				String publicKey = o.getPublicKey();
				
				 StringBuilder prNames = new StringBuilder();
			    int totalPrice = (int) o.getTotalAmount();
			    List<PurchaseHistory> ls = pImp.getPurchaseHistoryByOrderId(o.getOrderId());
			    orderHistoryMap.put(o.getOrderId(), ls);

			    try {
					
					
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			    for (int i = 0; i < ls.size(); i++) {
			        PurchaseHistory item = ls.get(i);
			        prNames.append(item.getProductName());
			        if (i < ls.size() - 1) {
			            prNames.append(", ");
			        }
			    

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
			        formatAmount(totalPrice) 
			    );
			    System.out.println(o.getOrderId());
			    System.out.println(username);
			    System.out.println(o.getCreateDate().toString());
			    System.out.println(prNames.toString());
			    System.out.println(formatAmount(totalPrice) );
			    if (o.getSignature() == null) {
			        o.setSignatureStatus("Chua ky");
			    } else {
			        try {
			            PublicKey pubKey = getPublicKeyFromString(publicKey);
			            String hashData = o.getHashData();
			            if(hashData==null) {
			            	System.out.println("Đơn hàng chưa lưu hash data");
			            }else {
			            	
			            	//
			                boolean valid = verifySignature(hashData,generatedHash);
				            
				            System.out.println("chu ky db: " + o.getSignature());
				            System.out.println("hash: " + generatedHash);
				            
				            if (valid) {
				                o.setSignatureStatus("Da ky - Toan ven");
				            } else {
				                o.setSignatureStatus("Da ky - Thong tin da thay doi");
				            }
				            
				            
				            //
			            }
			        
			        } catch (Exception e) {
			            o.setSignatureStatus("Loi xac thuc chu ky");
			            e.printStackTrace();
			        }
			    }
			}
			System.out.println("history:" + orderHistoryMap.size());
			
			
			//9ca1cefac932b9a819dcb215b99a507c62b021ee0eb9631ffd59c4c740bb6657
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
	public PublicKey getPublicKeyFromString(String base64PublicKey) throws Exception {
		  String cleanKey = base64PublicKey.replaceAll("\\s", "");

	    byte[] keyBytes = Base64.getDecoder().decode(cleanKey);
	    X509EncodedKeySpec keySpec = new X509EncodedKeySpec(keyBytes);
	    KeyFactory keyFactory = KeyFactory.getInstance("RSA");
	    return keyFactory.generatePublic(keySpec);
	}
	
	
	
	
	public boolean verifySignature(String hashData, String hashGenerated) {    
	        return hashData.equals(hashGenerated);   
	}
	

	
	/*
	 * // public boolean verifySignature(String hashData, String signature,
	 * PublicKey publicKey) { // try { // Cipher cipher =
	 * Cipher.getInstance("RSA/ECB/PKCS1Padding"); //
	 * cipher.init(Cipher.DECRYPT_MODE, publicKey); // byte[] decryptedBytes =
	 * cipher.doFinal(Base64.getDecoder().decode(signature)); // String
	 * decryptedHash = new String(decryptedBytes, StandardCharsets.UTF_8); //
	 * System.out.println("sign: " + decryptedHash); // return
	 * hashData.equals(decryptedHash); // } catch (Exception e) { //
	 * e.printStackTrace(); // return false; // } // }
	 */	
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
