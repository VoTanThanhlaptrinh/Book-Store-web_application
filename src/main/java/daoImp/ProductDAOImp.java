package daoImp;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import daoInterface.IProductDao;
import models.Product;
import service.DatabaseConnection;

public class ProductDAOImp implements IProductDao {

	@Override
	public List<Product> getProducts() {
		Connection con = null;
		List<Product> products = null;
		try {
			products = new ArrayList<>();
			con = DatabaseConnection.getConnection();
			PreparedStatement statement = con.prepareStatement("select * from Product_1 ");
			ResultSet resultSet = statement.executeQuery();
			while (resultSet.next()) {
				int id = resultSet.getInt(1);
				String title = resultSet.getNString(2);
				double price = resultSet.getDouble(3);
				String description = resultSet.getNString(4);
				int imgId = resultSet.getInt(5);
				Date createDate = resultSet.getDate(6);
				Date updateDate = resultSet.getDate(7);
				int quantity = resultSet.getInt(8);
				int adminId = resultSet.getInt(9);
				int cate_parent = resultSet.getInt(10);
				int cate_id = resultSet.getInt(11);
				String language = resultSet.getNString(12);
				int page = resultSet.getInt(13);
				String author = resultSet.getNString(14);
				int publishYear = resultSet.getInt(15);
				products.add(new Product(id, adminId, title, price, description, imgId, createDate, updateDate,
						quantity, cate_parent, cate_id, language, page, author, publishYear));

				// System.out.println(id + adminId+title+ price+ description+ type+ imgId+
				// createDate+ updateDate);
			}
			resultSet.close();
			statement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			try {
				con.close();
			} catch (SQLException e2) {
				e.printStackTrace();
			}
		}
		return products;
	}

	@Override
	public Product findByProductId(int productId) {
		Product product = null;
		Connection con = null;
		try {
			con = DatabaseConnection.getConnection();
			PreparedStatement statement = con.prepareStatement("select * from Product_1 where product_id = ?");
			statement.setInt(1, productId);
			ResultSet resultSet = statement.executeQuery();
			while (resultSet.next()) {
				int id = resultSet.getInt(1);
				String title = resultSet.getNString(2);
				double price = resultSet.getDouble(3);
				String description = resultSet.getNString(4);
				int imgId = resultSet.getInt(5);
				Date createDate = resultSet.getDate(6);
				Date updateDate = resultSet.getDate(7);
				int quantity = resultSet.getInt(8);
				int adminId = resultSet.getInt(9);
				int cate_parent = resultSet.getInt(10);
				int cate_id = resultSet.getInt(11);
				String language = resultSet.getNString(12);
				int page = resultSet.getInt(13);
				String author = resultSet.getNString(14);
				int publishYear = resultSet.getInt(15);
				product = new Product(id, adminId, title, price, description, imgId, createDate, updateDate, quantity,
						cate_parent, cate_id, language, page, author, publishYear);
			}
			resultSet.close();
			statement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			try {
				con.close();
			} catch (SQLException e2) {
				e.printStackTrace();
			}
		}
		return product;
	}

	@Override
	public int saveProduct(Product product) {
		// TODO Auto-generated method stub
		int productId = 0;
		try (Connection con = DatabaseConnection.getConnection();
				PreparedStatement preparedStatement = con.prepareStatement(
						"insert into Product_1 (added_by_user,title,price,description,img_id,create_date, update_date,pdQuantity, "
								+ "category_parent_id, category_id,author,language,page,publishYear) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
						PreparedStatement.RETURN_GENERATED_KEYS)) {

			preparedStatement.setInt(1, product.getAddedByUser());
			preparedStatement.setString(2, product.getTitle());
			preparedStatement.setDouble(3, product.getPrice());
			preparedStatement.setNString(4, product.getDescription());
			preparedStatement.setInt(5, product.getImgId());
			preparedStatement.setDate(6, new Date(System.currentTimeMillis()));
			preparedStatement.setDate(7, new Date(System.currentTimeMillis()));
			preparedStatement.setInt(8, product.getQuantity());
			preparedStatement.setInt(9, product.getCategory_parent());
			preparedStatement.setInt(10, product.getCategory_id());
			preparedStatement.setNString(11, product.getAuthor());
			preparedStatement.setNString(12, product.getAuthor());
			preparedStatement.setInt(13, product.getPage());
			preparedStatement.setInt(14, product.getPublishYear());
			preparedStatement.executeUpdate();
			ResultSet re = preparedStatement.getGeneratedKeys();
			if (re.next()) {
				productId = re.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return productId;
	}

	@Override
	public void updateProduct(Product product) {
		// TODO Auto-generated method stub
		try (Connection con = DatabaseConnection.getConnection();
				PreparedStatement preparedStatement = con.prepareStatement(
						"update Product_1 set added_by_user = ?, title = ?,price = ?,description = ?,img_id = ?, update_date = ?, pdQuantity= ?"
								+ ",category_parent_id=?,category_id=?,page=?,author=?,language=?,publishYear=? where product_id = ?");) {

			preparedStatement.setInt(1, product.getAddedByUser());
			preparedStatement.setString(2, product.getTitle());
			preparedStatement.setDouble(3, product.getPrice());
			preparedStatement.setNString(4, product.getDescription());
			preparedStatement.setInt(5, product.getImgId());
			preparedStatement.setDate(6, new Date(System.currentTimeMillis()));
			preparedStatement.setInt(7, product.getQuantity());
			preparedStatement.setInt(8, product.getCategory_parent());
			preparedStatement.setInt(9, product.getCategory_id());
			preparedStatement.setInt(10, product.getPage());
			preparedStatement.setNString(11, product.getAuthor());
			preparedStatement.setNString(12, product.getLanguage());
			preparedStatement.setInt(13, product.getPublishYear());
			preparedStatement.setInt(14, product.getProductId());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public void deleteProduct(Product product) {
		// TODO Auto-generated method stub
		Connection con = null;
		try {
			con = DatabaseConnection.getConnection();
			PreparedStatement preparedStatement = con
					.prepareStatement("delete Product_1 where product_id = ? on delete set null");
			preparedStatement.setInt(1, product.getProductId());
			preparedStatement.executeUpdate();
			preparedStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			try {
				con.close();
			} catch (SQLException e2) {
				e.printStackTrace();
			}
		}
	}

	@Override
	public List<Product> getProductFollowPage(int pageNumber, int quantity) {
		List<Product> products = new ArrayList<Product>();
		int pos = quantity * (pageNumber - 1);
		Connection con = null;
		try {
			con = DatabaseConnection.getConnection();
			PreparedStatement statement = con.prepareStatement("select * from Product_1 ",
					ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			ResultSet resultSet = statement.executeQuery();
			resultSet.absolute(pos);
			for (int i = 1; i <= quantity; i++) {
				if (resultSet.next()) {
					int id = resultSet.getInt(1);
					String title = resultSet.getNString(2);
					double price = resultSet.getDouble(3);
					String description = resultSet.getNString(4);
					int imgId = resultSet.getInt(5);
					Date createDate = resultSet.getDate(6);
					Date updateDate = resultSet.getDate(7);
					int quantity1 = resultSet.getInt(8);
					int adminId = resultSet.getInt(9);
					int cate_parent = resultSet.getInt(10);
					int cate_id = resultSet.getInt(11);
					String language = resultSet.getNString(12);
					int page = resultSet.getInt(13);
					String author = resultSet.getNString(14);
					int publishYear = resultSet.getInt(15);
					products.add(new Product(id, adminId, title, price, description, imgId, createDate, updateDate,
							quantity1, cate_parent, cate_id, language, page, author, publishYear));

				}
			}
			resultSet.close();
			statement.close();
		} catch (

		SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			try {
				con.close();
			} catch (SQLException e2) {
				e.printStackTrace();
			}
		}
		return products;
	}

	@Override
	public int getQuantityOfProduct() {
		Connection con = null;
		int quantity = 0;
		try {
			con = DatabaseConnection.getConnection();
			PreparedStatement statement = con.prepareStatement("select count(*) from Product_1 ");
			ResultSet resultSet = statement.executeQuery();
			if (resultSet.next()) {
				quantity = resultSet.getInt(1);

			}
			resultSet.close();
			statement.close();
		} catch (

		SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			try {
				con.close();
			} catch (SQLException e2) {
				e.printStackTrace();
			}
		}
		return quantity;
	}

	@Override
	public List<Product> getProductsByType(int category_parent) {
		Connection con = null;
		List<Product> products = null;
		try {
			products = new ArrayList<>();
			con = DatabaseConnection.getConnection();
			String query = "SELECT * FROM Product_1 WHERE category_parent = ?";
			PreparedStatement preparedStatement = con.prepareStatement(query);
			preparedStatement.setInt(1, category_parent);
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				int id = resultSet.getInt(1);
				String title = resultSet.getNString(2);
				double price = resultSet.getDouble(3);
				String description = resultSet.getNString(4);
				int imgId = resultSet.getInt(5);
				Date createDate = resultSet.getDate(6);
				Date updateDate = resultSet.getDate(7);
				int quantity1 = resultSet.getInt(8);
				int adminId = resultSet.getInt(9);
				int cate_parent = resultSet.getInt(10);
				int cate_id = resultSet.getInt(11);
				String language = resultSet.getNString(12);
				int page = resultSet.getInt(13);
				String author = resultSet.getNString(14);
				int publishYear = resultSet.getInt(15);
				products.add(new Product(id, adminId, title, price, description, imgId, createDate, updateDate,
						quantity1, cate_parent, cate_id, language, page, author, publishYear));

			}
			resultSet.close();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null) {
					con.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return products;
	}

	@Override
	public List<Product> getProductsByName(String name) {
		Connection con = null;
		List<Product> products = null;
		try {
			products = new ArrayList<>();
			con = DatabaseConnection.getConnection();
			String query = "SELECT * FROM Product_1 WHERE title LIKE ?";
			PreparedStatement preparedStatement = con.prepareStatement(query);
			preparedStatement.setString(1, "%" + name + "%");
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				int id = resultSet.getInt(1);
				String title = resultSet.getNString(2);
				double price = resultSet.getDouble(3);
				String description = resultSet.getNString(4);
				int imgId = resultSet.getInt(5);
				Date createDate = resultSet.getDate(6);
				Date updateDate = resultSet.getDate(7);
				int quantity1 = resultSet.getInt(8);
				int adminId = resultSet.getInt(9);
				int cate_parent = resultSet.getInt(10);
				int cate_id = resultSet.getInt(11);
				String language = resultSet.getNString(12);
				int page = resultSet.getInt(13);
				String author = resultSet.getNString(14);
				int publishYear = resultSet.getInt(15);
				products.add(new Product(id, adminId, title, price, description, imgId, createDate, updateDate,
						quantity1, cate_parent, cate_id, language, page, author, publishYear));

			}
			resultSet.close();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null) {
					con.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return products;
	}

	public List<Product> getRandomProducts(int num) {
		Connection con = null;
		List<Product> products = null;
		try {
			products = new ArrayList<>();
			con = DatabaseConnection.getConnection();
			String query = "SELECT TOP (?) * FROM Product_1 ORDER BY NEWID()";
			PreparedStatement preparedStatement = con.prepareStatement(query);
			preparedStatement.setInt(1, num); // Giới hạn số lượng sản phẩm
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				int id = resultSet.getInt(1);
				String title = resultSet.getNString(2);
				double price = resultSet.getDouble(3);
				String description = resultSet.getNString(4);
				int imgId = resultSet.getInt(5);
				Date createDate = resultSet.getDate(6);
				Date updateDate = resultSet.getDate(7);
				int quantity1 = resultSet.getInt(8);
				int adminId = resultSet.getInt(9);
				int cate_parent = resultSet.getInt(10);
				int cate_id = resultSet.getInt(11);
				String language = resultSet.getNString(12);
				int page = resultSet.getInt(13);
				String author = resultSet.getNString(14);
				int publishYear = resultSet.getInt(15);
				products.add(new Product(id, adminId, title, price, description, imgId, createDate, updateDate,
						quantity1, cate_parent, cate_id, language, page, author, publishYear));

			}
			resultSet.close();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null) {
					con.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return products;
	}

	public List<Product> getTopProductsById(int num) {
		Connection con = null;
		List<Product> products = null;
		try {
			products = new ArrayList<>();
			con = DatabaseConnection.getConnection();
			// Câu truy vấn lấy các sản phẩm có id lớn nhất
			String query = "SELECT TOP (?) * FROM Product_1 ORDER BY product_id DESC";
			PreparedStatement preparedStatement = con.prepareStatement(query);
			preparedStatement.setInt(1, num); // Giới hạn số lượng sản phẩm
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				int id = resultSet.getInt(1);
				String title = resultSet.getNString(2);
				double price = resultSet.getDouble(3);
				String description = resultSet.getNString(4);
				int imgId = resultSet.getInt(5);
				Date createDate = resultSet.getDate(6);
				Date updateDate = resultSet.getDate(7);
				int quantity1 = resultSet.getInt(8);
				int adminId = resultSet.getInt(9);
				int cate_parent = resultSet.getInt(10);
				int cate_id = resultSet.getInt(11);
				String language = resultSet.getNString(12);
				int page = resultSet.getInt(13);
				String author = resultSet.getNString(14);
				int publishYear = resultSet.getInt(15);
				products.add(new Product(id, adminId, title, price, description, imgId, createDate, updateDate,
						quantity1, cate_parent, cate_id, language, page, author, publishYear));

			}
			resultSet.close();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null) {
					con.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return products;
	}

	@Override
	public List<Product> getListOfTitleByCategory(String category, String titleKeyword, int pageNum, int quantity) {
		Connection con = null;
		List<Product> products = new ArrayList<>();
		try {
			con = DatabaseConnection.getConnection();

			// Tính toán vị trí bắt đầu (OFFSET)
			int offset = (pageNum - 1) * quantity;

			// Xây dựng truy vấn động
			StringBuilder queryBuilder = new StringBuilder("SELECT * FROM Product_1 WHERE 1=1");

			// Thêm điều kiện nếu `category` không rỗng
			if (category != null && !category.trim().isEmpty()) {
				queryBuilder.append(" AND type = ?");
			}

			// Thêm điều kiện nếu `titleKeyword` không rỗng
			if (titleKeyword != null && !titleKeyword.trim().isEmpty()) {
				queryBuilder.append(" AND title LIKE ?");
			}

			// Thêm phần phân trang
			queryBuilder.append(" ORDER BY product_id DESC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY");

			// Chuẩn bị truy vấn
			PreparedStatement preparedStatement = con.prepareStatement(queryBuilder.toString());

			// Thiết lập giá trị cho các tham số
			int paramIndex = 1;
			if (category != null && !category.trim().isEmpty()) {
				preparedStatement.setString(paramIndex++, category);
			}
			if (titleKeyword != null && !titleKeyword.trim().isEmpty()) {
				preparedStatement.setString(paramIndex++, "%" + titleKeyword + "%");
			}
			preparedStatement.setInt(paramIndex++, offset); // OFFSET
			preparedStatement.setInt(paramIndex, quantity); // LIMIT

			// Thực thi truy vấn
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				int id = resultSet.getInt(1);
				String title = resultSet.getNString(2);
				double price = resultSet.getDouble(3);
				String description = resultSet.getNString(4);
				int imgId = resultSet.getInt(5);
				Date createDate = resultSet.getDate(6);
				Date updateDate = resultSet.getDate(7);
				int quantity1 = resultSet.getInt(8);
				int adminId = resultSet.getInt(9);
				int cate_parent = resultSet.getInt(10);
				int cate_id = resultSet.getInt(11);
				String language = resultSet.getNString(12);
				int page = resultSet.getInt(13);
				String author = resultSet.getNString(14);
				int publishYear = resultSet.getInt(15);
				products.add(new Product(id, adminId, title, price, description, imgId, createDate, updateDate,
						quantity1, cate_parent, cate_id, language, page, author, publishYear));

			}
			resultSet.close();
			preparedStatement.close();
		} catch (SQLException e) {

		} finally {
			try {
				if (con != null) {
					con.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return products;
	}

	@Override
	public List<Product> getProductsByTypeAndTitle(String type, String title) {
		Connection con = null;
		List<Product> products = new ArrayList<>();
		try {
			con = DatabaseConnection.getConnection();
			// Sử dụng LIKE cho tiêu đề, và thêm `%` vào trước/sau tiêu đề để tìm kiếm gần
			// đúng
			String query = "SELECT * FROM Product_1 WHERE type = ? AND title LIKE ?";
			PreparedStatement preparedStatement = con.prepareStatement(query);
			preparedStatement.setString(1, type);
			preparedStatement.setString(2, "%" + title + "%"); // Sử dụng wildcard để tìm kiếm gần đúng

			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				int id = resultSet.getInt(1);
				/* String title1 = resultSet.getNString(2); */
				double price = resultSet.getDouble(3);
				String description = resultSet.getNString(4);
				int imgId = resultSet.getInt(5);
				Date createDate = resultSet.getDate(6);
				Date updateDate = resultSet.getDate(7);
				int quantity1 = resultSet.getInt(8);
				int adminId = resultSet.getInt(9);
				int cate_parent = resultSet.getInt(10);
				int cate_id = resultSet.getInt(11);
				String language = resultSet.getNString(12);
				int page = resultSet.getInt(13);
				String author = resultSet.getNString(14);
				int publishYear = resultSet.getInt(15);
				products.add(new Product(id, adminId, title, price, description, imgId, createDate, updateDate,
						quantity1, cate_parent, cate_id, language, page, author, publishYear));

			}
			resultSet.close();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null) {
					con.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return products;
	}

	@Override
	public int getTotalProducts() {// lấy số lượng product
		// TODO Auto-generated method stub
		int total = 0;
		try (Connection con = DatabaseConnection.getConnection();
				PreparedStatement preparedStatement = con.prepareStatement("SELECT count(*) FROM Product_1 ");) {

			ResultSet resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				total = resultSet.getInt(1);
			}
			resultSet.close();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return total;
	}

	// cập nhật lại các giá trị lenght, width, weight, height ngẫu nhiên cho bảng
	// product_1
	public void updateProduct() {
		try (Connection conn = DatabaseConnection.getConnection()) {
			String sql = "SELECT product_id, title FROM Product_1";
			PreparedStatement stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				int id = rs.getInt("product_id");
				String title = rs.getString("title");
				Random rand = new Random(title.hashCode());
				int length = rand.nextInt(20 - 10 + 1) + 10;
				int width = rand.nextInt(20 - 10 + 1) + 10;
				int height = rand.nextInt(5 - 1 + 1) + 1;
				int weight = rand.nextInt(700 - 100 + 1) + 100;

				PreparedStatement updateStmt = conn.prepareStatement(
						"UPDATE Product_1 SET length=?, width=?, height=?, weights=? WHERE product_id=?");
				updateStmt.setInt(1, length);
				updateStmt.setInt(2, width);
				updateStmt.setInt(3, height);
				updateStmt.setInt(4, weight);
				updateStmt.setInt(5, id);
				updateStmt.executeUpdate();
				updateStmt.close();
			}
			System.out.println("Cập nhật thành công tất cả sản phẩm!");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public Product getDimension(int productID) {
		Product p = null;
		String sql = "select * from Product_1 where product_id =?";
		try {
			Connection con = DatabaseConnection.getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setInt(1, productID);
			ResultSet resultSet = stmt.executeQuery();
			while (resultSet.next()) {
				p = new Product(resultSet.getString(2), resultSet.getInt(19), resultSet.getInt(17),
						resultSet.getInt(18), resultSet.getInt(16));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return p;
	}

	// lấy số lượng tồn kho một product dựa vào id
	public int getStockQuantity(int productId) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int quantity = 0;

		try {
			conn = DatabaseConnection.getConnection();
			String sql = "SELECT p.pdQuantity " + "FROM Product_1 p JOIN Cart_item c ON p.product_id = c.product_id "
					+ "WHERE c.product_id = ? AND c.status = 'pending'";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, productId);
			rs = ps.executeQuery();

			if (rs.next()) {
				quantity = rs.getInt("pdQuantity");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return quantity;
	}

	

	@Override
	public void updateQuantityProduct(int idProduct, int quantity) {
		String sql = "update Product_1 set pdQuantity = pdQuantity -? where product_id = ?";
		try {
			Connection conn = DatabaseConnection.getConnection();
			PreparedStatement stmp = conn.prepareStatement(sql);
			stmp.setInt(1, quantity);
			stmp.setInt(2, idProduct);
			stmp.executeUpdate();
			System.out.println("Cập nhật số lượng thành công");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	public static void main(String[] args) {
		ProductDAOImp dao = new ProductDAOImp();
		dao.updateQuantityProduct(1, 2);
	}

}
