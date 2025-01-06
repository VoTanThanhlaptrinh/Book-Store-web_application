package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.Product;
import models.User;
import serviceImplement.HienThiDanhSachImp;

public class BookDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HienThiDanhSachImp hienThi = new HienThiDanhSachImp();
		String id = request.getParameter("id");
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		Product sach = hienThi.hienThiSachTheoId(Integer.parseInt(id));
		
		if (user == null) {
			request.setAttribute("anouce", user);
		}
		
		//System.out.println("id cua nguoi dung" + user.getUsername());
		session.setAttribute("product", sach);
		request.getRequestDispatcher("webPage/categoryAndSingle/single.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
