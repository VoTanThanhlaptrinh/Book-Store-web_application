package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
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
		// TODO Auto-generated method stub
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");
		if (user != null && user.getRoles().contains("admin")) {
			session.setAttribute("admin", "admin");
		}
		HienThiDanhSachImp imp = new HienThiDanhSachImp();

		req.setAttribute("randomList", imp.hienThiNgauNhienSoSanPham(8));

		req.setAttribute("topRecentList", imp.getTopProductsById(12));

		req.setAttribute("tieuthuyet", imp.hienThiSachTheoTheLoai("Tiểu thuyết"));
		req.setAttribute("ptbt", imp.hienThiSachTheoTheLoai("Phát triển bản thân"));
		req.setAttribute("tlh", imp.hienThiSachTheoTheLoai("Tâm lý học - Pháp luật"));
		req.setAttribute("kinhte", imp.hienThiSachTheoTheLoai("Kinh tế - Tài chính"));
		req.getRequestDispatcher("webPage/trangChu/index.jsp").forward(req, resp);
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

}
