package img;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;

import daoImp.ImageDAOImp;
import daoImp.ProductDAOImp;
import daoInterface.IImageDao;
import daoInterface.IProductDao;
import models.Image;
import models.Product;

public class Main {
	private static String driverClass = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	private static String url = "jdbc:sqlserver://localhost\\SQLEXPRESS;databaseName=book_store;encrypt=true;trustServerCertificate=true";
	private static String username = "user_login";
	private static String password = "123";

	public static Connection getConnection() throws SQLException {
		try {
			Class.forName(driverClass);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return DriverManager.getConnection(url, username, password);
	}

	public static void main(String[] args) throws SQLException, IOException {
		insertImage();
	}

	public static void insertImage() throws SQLException, IOException {
		IImageDao imageDao = new ImageDAOImp();
		IProductDao productDao = new ProductDAOImp();

		List<Product> products = productDao.getProducts();

		File file = new File("src\\main\\webapp\\webPage\\img\\book");
		File[] files = file.listFiles();
		InputStream inputStream = null;
		for (int i = 0; i < files.length; i++) {
			Image img = imageDao.findByImageId(products.get(i).getImgId());
			byte[] bytes = new byte[(int) files[i].length()];
			inputStream = new FileInputStream(files[i]);
			inputStream.read(bytes);
			img.setData(bytes);
			imageDao.updateImage(img);
		}
		inputStream.close();
	}
}
