package controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.Product;
import models.User;
import serviceImplement.HienThiDanhSachImp;

@WebServlet("/home")
public class HomeController extends HttpServlet {
	/**
	 *
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");

		HienThiDanhSachImp imp = new HienThiDanhSachImp();
		List<Product> homepageBooks = (List<Product>) getServletContext().getAttribute("homepageBooks");
		if (homepageBooks == null) {
		    homepageBooks = imp.hienThiNgauNhienSoSanPham(20);
		    getServletContext().setAttribute("homepageBooks", homepageBooks);
		}
		req.setAttribute("randomList", homepageBooks);

		
		req.getRequestDispatcher("webPage/trangChu/index.jsp").forward(req, resp);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
