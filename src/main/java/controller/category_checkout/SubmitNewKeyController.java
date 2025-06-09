package controller.category_checkout;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import service.PublicKeyEmailVerification;

import java.io.IOException;

import daoImp.OrderDaoImp;

@WebServlet("/submitNewKey")
public class SubmitNewKeyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubmitNewKeyController() {
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
		String newPublicKey = request.getParameter("newPublicKey");
		OrderDaoImp oImp = new OrderDaoImp();
	        String token = (String) request.getSession().getAttribute("resetToken");

	        PublicKeyEmailVerification keyService = new PublicKeyEmailVerification();
	        int userId = keyService.getUserIdFromToken(token);

	        if (userId != -1) {
	        	oImp.savePublicKey(userId, newPublicKey); 
	            request.setAttribute("message", "Khóa mới đã được cập nhật thành công.");
	        } else {
	            request.setAttribute("error", "Token không hợp lệ.");
	        }
	        request.getRequestDispatcher("webPage/giohang/successkey.jsp").forward(request, response);
	}

}
