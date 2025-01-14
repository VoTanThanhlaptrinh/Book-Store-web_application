package data;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

import daoImp.ImageDAOImp;
import daoImp.ProductDAOImp;
import daoInterface.IImageDao;
import daoInterface.IProductDao;
import models.Image;
import models.Product;

public class Main {

	public static void main(String[] args) throws SQLException, IOException {
		insertImage();
	}

	public static void insertImage() throws SQLException, IOException {
		IImageDao imageDao = new ImageDAOImp();
		IProductDao productDao = new ProductDAOImp();

		List<Product> products = productDao.getProducts();

		File file = new File("src\\main\\webapp\\webPage\\img\\book");
		File[] files = file.listFiles();
		for (int i = 0; i < files.length; i++) {
			try (InputStream inputStream = new FileInputStream(files[i])) {
				Image img = imageDao.findByImageId(products.get(i).getImgId());
				byte[] bytes = new byte[(int) files[i].length()];

				int bytesRead = 0;
				int offset = 0;

				// Sử dụng vòng lặp while để đọc đầy đủ dữ liệu vào mảng byte
				while (offset < bytes.length
						&& (bytesRead = inputStream.read(bytes, offset, bytes.length - offset)) != -1) {
					offset += bytesRead;
				}

				// Kiểm tra nếu không đọc đủ dữ liệu
				if (offset < bytes.length) {
					throw new IOException("Không thể đọc đủ dữ liệu từ tệp: " + files[i].getName());
				}

				img.setData(bytes);
				imageDao.updateImage(img);
			} catch (IOException e) {
				System.err.println("Lỗi xử lý tệp: " + files[i].getName() + " - " + e.getMessage());
			}
		}
		File f = new File("src\\main\\webapp\\webPage\\avatar\\avatar.jpg");
		byte[] fileData = null;

		try (FileInputStream fis = new FileInputStream(f)) {
			fileData = new byte[(int) file.length()];

			int bytesRead = 0;
			int offset = 0;

			// Đọc dữ liệu đầy đủ vào mảng byte
			while (offset < fileData.length
					&& (bytesRead = fis.read(fileData, offset, fileData.length - offset)) != -1) {
				offset += bytesRead;
			}

			// Kiểm tra nếu không đọc đủ dữ liệu
			if (offset < fileData.length) {
				throw new IOException("Không thể đọc đủ dữ liệu từ tệp: " + file.getName());
			}

			Image img = new Image("avatar", "jpg", "ảnh cá nhân", new Date(System.currentTimeMillis()),
					new Date(System.currentTimeMillis()), fileData);
			imageDao.saveImage(img);
		} catch (IOException e) {
			System.err.println("Lỗi khi đọc tệp: " + e.getMessage());
		}
	}
}
