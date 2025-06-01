package controller.category_checkout;

import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Product;


import java.io.IOException;
import java.io.PrintWriter;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import daoImp.ProductDAOImp;

@WebServlet("/APIcart")
public class CartApiServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();

		//lấy productId và quantity từ js(cart.js)
		String productIdStr = request.getParameter("productId");
		String quantityStr = request.getParameter("quantity");

		int productId = Integer.parseInt(productIdStr);
		int quantity = Integer.parseInt(quantityStr);

		ProductDAOImp productDAO = new ProductDAOImp();
		int available = productDAO.getStockQuantity(productId);

		// So sánh với tồn kho trong database nếu tồn kho nhiều hơn thì lấy số lượng người dùng chọn, ngược lại lấy số lượng tồn kho
		JsonObject json = new JsonObject();
		json.addProperty("available", available);
		json.addProperty("isValid", quantity <= available);

		out.write(json.toString());
		out.flush();

	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
}
