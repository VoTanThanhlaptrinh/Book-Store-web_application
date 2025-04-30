	package controller.address;

import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Address;
import models.User;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import com.google.gson.Gson;

import daoImp.AddressDaoImp;

/**
 * Servlet implementation class SelectAddressServlet
 */
@WebServlet("/selectAddress")
public class SelectAddressServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectAddressServlet() {
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
	    String addressIdStr = request.getParameter("address_id");
	    int addressId = Integer.parseInt(addressIdStr);

	    // Giả sử bạn đã có user_id từ session
	    User user = (User) request.getSession().getAttribute("user");

	    AddressDaoImp addressDAO = new AddressDaoImp();
	    Address address = addressDAO.selectAddressByIdAndUser(addressId, user.getUserId());
	    

	    response.setContentType("application/json");
	    PrintWriter out = response.getWriter();
	    Gson gson = new Gson();

	    if (address != null) {
	        // Gán is_default = false cho các địa chỉ khác và true cho địa chỉ này
	        addressDAO.updateDefaultStatus(user.getUserId(), addressId);
	        request.getSession().setAttribute("addressDefault", address);

	        Map<String, Object> result = new HashMap<>();
	        result.put("status", "success");
	        result.put("selectedAddress", address);
	        out.print(gson.toJson(result));
	    } else {
	        Map<String, Object> result = new HashMap<>();
	        result.put("status", "error");
	        result.put("message", "Không tìm thấy địa chỉ.");
	        out.print(gson.toJson(result));
	    }

	    out.flush();
	}


}
