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
import models.Product;
import models.User;
import com.google.gson.*;
import daoImp.AddressDaoImp;
import daoImp.CartItemDAOImp;
import daoImp.ProductDAOImp;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;
import java.util.logging.Logger;

@WebServlet("/order")
public class OrderController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String GHN_API_URL = "https://online-gateway.ghn.vn/shiip/public-api/v2/shipping-order/fee";
    private static final String TOKEN = "1cdb0f24-1830-11f0-bf01-723c4de9ff57";
    private static final String SHOP_ID = "5731351";
    private static final Logger LOGGER = Logger.getLogger(OrderController.class.getName());

    public OrderController() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductDAOImp productDao = new ProductDAOImp();
        AddressDaoImp addressDao = new AddressDaoImp();
        CartItemDAOImp cartDao = new CartItemDAOImp();
        HttpSession session = request.getSession();

        String orderDataJson = request.getParameter("orderData");
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        Address addressDefault = (Address) session.getAttribute("addressDefault");
        if (addressDefault == null) {
            // fallback nếu session không có (hiếm khi xảy ra)
            addressDefault = addressDao.getAddressDefault(user.getUserId());
            session.setAttribute("addressDefault", addressDefault);
        }

        if (addressDefault == null) {
            request.setAttribute("error", "Không tìm thấy địa chỉ mặc định.");
            request.getRequestDispatcher("webPage/address/address.jsp").forward(request, response);
            return;
        }

        int service_type_id = 5;
        int from_district_id = 1463;
        String from_ward_code = "21809";
        int to_district_id = addressDefault.getDistrictID();
        String to_ward_code = addressDefault.getWard_code();

        if (orderDataJson == null || orderDataJson.isEmpty()) {
            LOGGER.info("Không có dữ liệu đơn hàng");
            request.getRequestDispatcher("webPage/giohang/cart.jsp").forward(request, response);
            return;
        }

        // Phân tích dữ liệu đơn hàng
        Gson gson = new Gson();
        CartData cartData = gson.fromJson(orderDataJson, CartData.class);
        List<CartProductDetail> cDetails = cartData.getCartProductDetails();

        if (cDetails == null || cDetails.isEmpty()) {
            LOGGER.info("Danh sách sản phẩm rỗng");
            request.getRequestDispatcher("webPage/giohang/cart.jsp").forward(request, response);
            return;
        }

        // Kiểm tra số lượng tồn kho và tính tổng trọng lượng/kích thước
        int totalWeight = 0;
        int maxLength = 0, maxWidth = 0, maxHeight = 0;
        JsonArray itemsArray = new JsonArray();

        for (CartProductDetail c : cDetails) {
            Product product = productDao.getDimension(c.getProductId());
            if (product == null) {
                LOGGER.severe("Không tìm thấy sản phẩm ID: " + c.getProductId());
                request.setAttribute("error", "Sản phẩm không tồn tại.");
                request.getRequestDispatcher("webPage/giohang/cart.jsp").forward(request, response);
                return;
            }

            int quantity = c.getQuantity();
            int pbQuantity = cartDao.getProductQuantityByProductId(c.getProductId());

            if (quantity > pbQuantity) {
                LOGGER.info("Số lượng mua nhiều hơn tồn kho cho sản phẩm ID: " + c.getProductId());
                request.setAttribute("error", "Số lượng mua vượt quá tồn kho.");
                request.getRequestDispatcher("webPage/giohang/cart.jsp").forward(request, response);
                return;
            }

            // Tính trọng lượng và kích thước
            int itemWeight = product.getWeight() * quantity;
            totalWeight += itemWeight;
            maxLength = Math.max(maxLength, product.getLength());
            maxWidth = Math.max(maxWidth, product.getWidth());
            maxHeight = Math.max(maxHeight, product.getHeight());

            // Thêm sản phẩm vào mảng items
            JsonObject itemJson = new JsonObject();
            itemJson.addProperty("name", product.getTitle());
            itemJson.addProperty("quantity", quantity);
            itemJson.addProperty("length", product.getLength());
            itemJson.addProperty("width", product.getWidth());
            itemJson.addProperty("height", product.getHeight());
            itemJson.addProperty("weight", product.getWeight());
            itemsArray.add(itemJson);

            System.out.println("Product ID: " + c.getProductId() + " - Height: " + product.getHeight() +
                    ", Weight: " + product.getWeight() + ", Width: " + product.getWidth() +
                    ", Length: " + product.getLength());
        }

        // Thêm trọng lượng và kích thước bao bì
        totalWeight += 100; // 100g cho bao bì
        maxLength += 5;     // Thêm 5cm cho mỗi chiều
        maxWidth += 5;
        maxHeight += 5;

        // Chuẩn bị payload JSON cho GHN API
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

        
        
        System.out.println(payload);
        // Gửi yêu cầu POST đến GHN API
        int shippingFee = 0;
        try {
            HttpURLConnection conn = (HttpURLConnection) new URL(GHN_API_URL).openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Content-Type", "application/json");
            conn.setRequestProperty("Token", TOKEN);
            conn.setRequestProperty("ShopId", SHOP_ID);
            conn.setDoOutput(true);

            try (OutputStream os = conn.getOutputStream()) {
                os.write(new Gson().toJson(payload).getBytes("utf-8"));
            }

            if (conn.getResponseCode() == HttpURLConnection.HTTP_OK) {
                JsonObject responseJson = new Gson().fromJson(
                        new InputStreamReader(conn.getInputStream()), JsonObject.class);
                shippingFee = responseJson.getAsJsonObject("data").get("total").getAsInt();
            } else {
                LOGGER.severe("GHN API trả về mã lỗi: " + conn.getResponseCode());
                request.setAttribute("error", "Không thể tính phí vận chuyển.");
                request.getRequestDispatcher("webPage/giohang/cart.jsp").forward(request, response);
                return;
            }
        } catch (Exception e) {
            LOGGER.severe("Lỗi khi gọi GHN API: " + e.getMessage());
            request.setAttribute("error", "Không thể tính phí vận chuyển.");
            request.getRequestDispatcher("webPage/giohang/cart.jsp").forward(request, response);
            return;
        }
        
        System.out.println(shippingFee);

        // Lưu thông tin vào session và chuyển tiếp
        session.setAttribute("addressDefault", addressDefault);
        session.setAttribute("cDetails", cDetails);
        session.setAttribute("cDetailsSize", cDetails.size());
        session.setAttribute("total", cartData.getTotal());
        session.setAttribute("shippingFee", shippingFee);
        request.getRequestDispatcher("webPage/order/order.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}