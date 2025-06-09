package controller.category_checkout;

import jakarta.servlet.ServletException;


import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.Address;
import models.CartData;
import models.CartProductDetail;
import models.Order;
import models.Product;
import models.User;
import service.LoginService;

import com.google.gson.*;
import daoImp.AddressDaoImp;
import daoImp.ProductDAOImp;
import daoImp.SocialLoginDAOImpl;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.List;

@WebServlet("/order")
public class OrderController extends HttpServlet {
	private static String GHN_TOKEN;
	private static String GHN_API_URL;
	private static String GHN_SHOP_ID;

    public OrderController() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        ProductDAOImp productDao = new ProductDAOImp();
        AddressDaoImp addressDao = new AddressDaoImp();
        HttpSession session = request.getSession();
        
        String updateShippingFeeOnly = request.getParameter("updateShippingFeeOnly");
        User user = (User) session.getAttribute("user");
        Address addressDefault = (Address) session.getAttribute("addressDefault");
   
        // Nếu chỉ cập nhật phí vận chuyển
        if ("true".equals(updateShippingFeeOnly)) {
          
			List<CartProductDetail> cDetails =  (List<CartProductDetail>) session.getAttribute("cDetails");
            if (cDetails == null || cDetails.isEmpty()) {
                out.println("{\"status\":\"error\",\"message\":\"Giỏ hàng rỗng.\"}");
                return;
            }

            double shippingFee = calculateShippingFee(cDetails, addressDefault, productDao, out);
            if (shippingFee >= 0) {
                session.setAttribute("shippingFee", shippingFee);
                out.println("{\"status\":\"success\",\"shippingFee\":" + shippingFee + "}");
            }
            return;
        }
          

        String orderDataJson = request.getParameter("orderData");
        if (orderDataJson == null || orderDataJson.isEmpty()) {
        	  response.sendRedirect("cart");
              return;
        }

        // Phân tích dữ liệu đơn hàng
        Gson gson = new Gson();
        CartData cartData = gson.fromJson(orderDataJson, CartData.class);
        List<CartProductDetail> cDetails = cartData.getCartProductDetails();

     
        
        
        if (cDetails == null || cDetails.isEmpty()) {
        	System.out.println("cDetails == null");
        	  response.sendRedirect("cart");
            return;
        }
        
        

        // Kiểm tra số lượng tồn kho
        for (CartProductDetail c : cDetails) {
            Product product = productDao.getDimension(c.getProductId());
            if (product == null) {
            	System.out.println("product == null");
                request.setAttribute("error", "Sản phẩm không tồn tại.");
                response.sendRedirect("cart");
                return;
            }

            int quantity = c.getQuantity();
            int pbQuantity = productDao.getStockQuantity(c.getProductId());
            if (quantity > pbQuantity) {
                request.setAttribute("error", "Số lượng mua vượt quá tồn kho.");
                System.out.println("Số lượng mua vượt quá tồn kho");
                response.sendRedirect("cart");
				 
                return;
            }
        }
   
        if (addressDefault == null) {
            addressDefault = addressDao.getAddressDefault(user.getUserId());
            session.setAttribute("addressDefault", addressDefault);
        }

        if (addressDefault == null) {
        	   session.setAttribute("addressDefault", addressDefault);
               session.setAttribute("cDetails", cDetails);
               session.setAttribute("cDetailsSize", cDetails.size());
               session.setAttribute("total", cartData.getTotal());
               session.setAttribute("shippingFee", 0);
               request.getRequestDispatcher("webPage/order/order.jsp").forward(request, response);
               return;
        }

        // Tính phí vận chuyển
        double shippingFee = calculateShippingFee(cDetails, addressDefault, productDao, out);
        if (shippingFee < 0) {
        	  System.out.println("Lỗi ko tính phí vận chuyển"+ shippingFee);
        	  response.sendRedirect("cart");
            return;
        }

        // Lưu thông tin vào session và chuyển tiếp
        System.out.println("thành công");
        session.setAttribute("addressDefault", addressDefault);
        session.setAttribute("cDetails", cDetails);
        session.setAttribute("cDetailsSize", cDetails.size());
        session.setAttribute("total", cartData.getTotal());
        session.setAttribute("shippingFee", shippingFee);
        request.getRequestDispatcher("webPage/order/order.jsp").forward(request, response);
    }

    // Hàm tách biệt để tính phí vận chuyển
    private double calculateShippingFee(List<CartProductDetail> cDetails, Address addressDefault,
                                       ProductDAOImp productDao, PrintWriter out) {
        int totalWeight = 0;
        int maxLength = 0, maxWidth = 0, maxHeight = 0;
        JsonArray itemsArray = new JsonArray();
        System.out.println(GHN_SHOP_ID);
     	System.out.println(GHN_TOKEN);
    	System.out.println(GHN_API_URL);
    	

        for (CartProductDetail c : cDetails) {
            Product product = productDao.getDimension(c.getProductId());
            if (product == null) {
                out.println("{\"status\":\"error\",\"message\":\"Sản phẩm không tồn tại.\"}");
                return -1;
            }

            int quantity = c.getQuantity();
            int itemWeight = product.getWeight() * quantity;
            totalWeight += itemWeight;
            maxLength = Math.max(maxLength, product.getLength());
            maxWidth = Math.max(maxWidth, product.getWidth());
            maxHeight = Math.max(maxHeight, product.getHeight());

            JsonObject itemJson = new JsonObject();
            itemJson.addProperty("name", product.getTitle());
            itemJson.addProperty("quantity", quantity);
            itemJson.addProperty("length", product.getLength());
            itemJson.addProperty("width", product.getWidth());
            itemJson.addProperty("height", product.getHeight());
            itemJson.addProperty("weight", product.getWeight());
            itemsArray.add(itemJson);
        }

        totalWeight += 100;
        maxLength += 5;
        maxWidth += 5;
        maxHeight += 5;

        // Tạo payload cho API GHN
        int service_type_id = 2;
        int from_district_id = 3695;
        String from_ward_code = "90735";
        int to_district_id = addressDefault.getDistrictID();
        String to_ward_code = addressDefault.getWard_code();

        JsonObject payload = new JsonObject();
        payload.addProperty("service_type_id", service_type_id);
        payload.addProperty("from_district_id", from_district_id);
        payload.addProperty("from_ward_code", from_ward_code);
        payload.addProperty("to_district_id", to_district_id);
        payload.addProperty("to_ward_code", to_ward_code);
        payload.addProperty("weight", totalWeight);
        payload.addProperty("length", maxLength);
        payload.addProperty("width", maxWidth);
        payload.addProperty("height", maxHeight);
        payload.add("items", itemsArray);

        // Gọi API GHN
        try {
            HttpURLConnection conn = (HttpURLConnection) new URL(GHN_API_URL).openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Content-Type", "application/json");
            conn.setRequestProperty("Token", GHN_TOKEN);
            conn.setRequestProperty("ShopId", GHN_SHOP_ID);
            conn.setDoOutput(true);

            try (OutputStream os = conn.getOutputStream()) {
                os.write(new Gson().toJson(payload).getBytes("utf-8"));
            }

            if (conn.getResponseCode() == HttpURLConnection.HTTP_OK) {
                JsonObject responseJson = new Gson().fromJson(
                        new InputStreamReader(conn.getInputStream()), JsonObject.class);
                return responseJson.getAsJsonObject("data").get("total").getAsFloat();
            } else {
                out.println("{\"status\":\"error\",\"message\":\"GHN API trả về mã lỗi: " + conn.getResponseCode() + "\"}");
                return -1;
            }
        } catch (Exception e) {
            out.println("{\"status\":\"error\",\"message\":\"Không thể tính phí vận chuyển.\"}");
            return -1;
        }

    }
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	request.getRequestDispatcher("webPage/order/order.jsp").forward(request, response);
    }
    @Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
    	GHN_TOKEN = getServletContext().getInitParameter("GHN_TOKEN");
    	GHN_API_URL = getServletContext().getInitParameter("GHN_API_URL");
    	GHN_SHOP_ID= getServletContext().getInitParameter("GHN_SHOP_ID");
	}
}