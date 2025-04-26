package controller.address;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.Address;
import models.User;

import java.io.IOException;
import java.util.List;

import com.google.gson.Gson;

import daoImp.AddressDaoImp;

@WebServlet("/GetAddressesServlet")
public class GetAddressesServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        try {
    	HttpSession session = request.getSession();
    	User user =(User) session.getAttribute("user");
    			AddressDaoImp addressDao = new AddressDaoImp();
    			List<Address> addresses = addressDao.getAddressesByUserId(user.getUserId());   			
    			
    			// Chuyển danh sách địa chỉ thành JSON
                Gson gson = new Gson();
                String json = gson.toJson(addresses);

                // Gửi JSON về client
                response.getWriter().write(json);
            } catch (Exception e) {
                e.printStackTrace();
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                response.getWriter().write("{\"error\": \"Lỗi khi lấy danh sách địa chỉ: " + e.getMessage() + "\"}");
            }
        }
    }