package controller.category_checkout;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import service.PublicKeyEmailVerification;

import java.io.IOException;

@WebServlet("/verifyKeyReset")
public class VerifyKeyResetController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VerifyKeyResetController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
	    String token = request.getParameter("token") + "";

        PublicKeyEmailVerification keyService = new PublicKeyEmailVerification();

        // Kiểm tra token có hợp lệ và chưa hết hạn không
        if (keyService.isTokenValid(token)) {
            // Token hợp lệ -> lưu token vào session để dùng sau, rồi hiển thị form
            request.getSession().setAttribute("resetToken", token);
            request.getRequestDispatcher("webPage/giohang/enterkey.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "Liên kết xác minh không hợp lệ hoặc đã hết hạn.");
            request.getRequestDispatcher("webPage/giohang/errorkey.jsp").forward(request, response);
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
