
package controller.address;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.Address;
import models.User;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import daoImp.AddressDaoImp;

@WebServlet("/saveAddress")
public class SaveAddressServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SaveAddressServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");

		StringBuilder jsonBuffer = new StringBuilder();
		String line;
		try (BufferedReader reader = request.getReader()) {
			while ((line = reader.readLine()) != null) {
				jsonBuffer.append(line);
			}
		}

		// Chuyển JSON thành đối tượng Java 
		Gson gson = new Gson(); 
		JsonObject jsonObject = gson.fromJson(jsonBuffer.toString(), JsonObject.class);

		// Lấy dữ liệu từ JSON 
		String fullName = jsonObject.get("full_name").getAsString();
		String phone = jsonObject.get("phone").getAsString();
		String addressDetail = jsonObject.get("address_detail").getAsString();
		int districtId = jsonObject.get("district_id").getAsInt();
		String wardCode = jsonObject.get("ward_code").getAsString();
		String addressType = jsonObject.get("address_type").getAsString();
		String provinceName = jsonObject.get("province_name").getAsString();
		String districtName = jsonObject.get("district_name").getAsString();
		String wardName = jsonObject.get("ward_name").getAsString();

		System.out.println(fullName + "  " + phone + "   " + addressDetail + "     " + addressType + "    " + districtId
				+ "     " + wardCode+ "  " + provinceName + "   " + districtName + "     " + wardName);

		try {
			AddressDaoImp addressDao = new AddressDaoImp();
			Address address = new Address(user.getUserId(), fullName, phone, districtId, wardCode, addressDetail,
					addressType,provinceName,districtName,wardName, false);
			int idAddress = addressDao.saveAddressAndGetID(address);

			// Tạo đối tượng phản hồi 
			JsonObject responseData = new JsonObject();
			responseData.addProperty("status", "success");
			responseData.addProperty("message", "Lưu địa chỉ thành công!");
			responseData.addProperty("address_id", idAddress);

			// Thiết lập phản hồi response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			out.print("{\"status\": \"success\", \"message\": \"Lưu địa chỉ thành công!\"}");
			out.flush();
		} catch (Exception e) { // Xử lý lỗi
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			out.print(
					"{\"status\": \"error\", \"message\": \"Có lỗi xảy ra khi lưu địa chỉ: " + e.getMessage() + "\"}");
			out.flush();
		}

	}

}
