package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.Product;
import service.CategoriesServiceImp;
import service.ICategoriesService;
import serviceImplement.HienThiDanhSachImp;

@WebServlet("/search")
public class CategoryController extends HttpServlet {
	private ICategoriesService categoriesService;
	/**
	 *
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession();
		String pageNum = req.getParameter("pageNum");
		String category = req.getParameter("category");
		String search = req.getParameter("search");

		String mess = (String) session.getAttribute("message1");
		session.removeAttribute("message1");
		req.setAttribute("message1", mess);
		if (category == null) {
			category = "";
		}

		if (search == null) {
			search = "";
		}

		int page = 1;
		if (pageNum != null) {
			page = Integer.valueOf(pageNum);
		}
		HienThiDanhSachImp ht = new HienThiDanhSachImp();
		List<Product> products = new ArrayList<>();
		if (category.equals("") && search.equals("")) {
			products = categoriesService.getProducts();
			if (products.size() < 12) {
				req.setAttribute("pages", 1);
			} else {
				if (products.size() % 12 > 0)
					req.setAttribute("pages", products.size() / 12 + 1);
				else
					req.setAttribute("pages", products.size() / 12);
			}
			products = categoriesService.getProductByPage(page, 12);
		}

		else if (!category.equals("") && search.equals("")) {
			products = ht.hienThiSachTheoTheLoai(category);

			if (products.size() < 12) {
				int size = products.size();
				products = ht.hienThiDanhSachTrongTheLoai(category, search, page, size);
			} else {
				products = ht.hienThiDanhSachTrongTheLoai(category, search, page, 12);
			}

		} else if (category.equals("") && !search.equals("")) {
			products = ht.hienThiSachTheoTen(search);

			if (products.size() < 12) {
				int size = products.size();
				products = ht.hienThiDanhSachTrongTheLoai(category, search, page, size);
			} else {
				products = ht.hienThiDanhSachTrongTheLoai(category, search, page, 12);
			}

		} else if (!category.equals("") && !search.equals("")) {

			products = ht.hienThiSachTheoTheLoaiVaTen(category, search);

			System.out.println(products.size() + " so tác phẩm có tên và sách");

			if (products.size() < 12) {
				int size = products.size();
				products = ht.hienThiDanhSachTrongTheLoai(category, search, page, size);
			} else {
				products = ht.hienThiDanhSachTrongTheLoai(category, search, page, 12);
			}
		}
		int row = products.size() / 4;
		int elementsLastRow = products.size() % 4;
		if (elementsLastRow == 0) {
			row--;
			elementsLastRow = 4;
		}
		if (products.size() < 4) {
			elementsLastRow = products.size();
		}
		session.setAttribute("category", category);
		session.setAttribute("search", search);

		req.setAttribute("lastRow", elementsLastRow);
		req.setAttribute("row", row);
		session.setAttribute("products", products);

		req.setAttribute("curPage", page);
		req.getRequestDispatcher("webPage/categoryAndSingle/categories.jsp").forward(req, resp);

	}

	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		categoriesService = new CategoriesServiceImp();
	}
}
