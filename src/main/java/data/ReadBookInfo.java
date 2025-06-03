package data;

import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.sql.Date;
import java.text.Normalizer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.List;
import java.util.regex.Pattern;

import models.Image;
import models.Product;

public class ReadBookInfo {

	public static void readBookFile(String filename) throws IOException {
		List<Product> products = new ArrayList<>();
		File folder = new File("C:\\Users\\VO TAN THANH\\Downloads\\img");
		File[] imgs = folder.listFiles();
		Arrays.sort(imgs, Comparator.comparingInt(f -> {
			String fileName = f.getName();
			try {
				// Lấy phần số trước dấu chấm
				return Integer.parseInt(fileName.substring(0, fileName.indexOf('.')));
			} catch (Exception e) {
				// Nếu lỗi, cho về cuối
				return Integer.MAX_VALUE;
			}
		}));
		ILoginService loginService = new LoginService();
		ICategoriesService categoriesService = new CategoriesServiceImp();
		int index = 0;
		int imageId = 0;
		try (BufferedReader br = new BufferedReader(
				new InputStreamReader(new FileInputStream(filename), StandardCharsets.UTF_8))) {
			String line;
			while ((line = br.readLine()) != null) {
				// KHÔNG bỏ qua dòng trống, đọc liền mạch
				String title = line;
				String author = br.readLine();
				String pageStr = br.readLine();
				String yearStr = br.readLine();

				// Đọc description nhiều dòng cho tới khi gặp ||
				StringBuilder descriptionBuilder = new StringBuilder();
				while ((line = br.readLine()) != null && !line.equals("||")) {
					if (descriptionBuilder.length() > 0)
						descriptionBuilder.append("\n");
					descriptionBuilder.append(line);
				}

				// Đọc giá
				String priceStr = br.readLine();
				if (priceStr == null)
					break; // Nếu hết file, dừng

				String cleanTitle = cleanTitle(title);
				Image image;

				try {
					image = new Image(cleanTitle + ".png", "png", "ảnh product", new Date(System.currentTimeMillis()),
							new Date(System.currentTimeMillis()), getData(imgs[index]));
					
					System.out.println(cleanTitle);
					imageId = loginService.saveImage(image);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

				// Tạo đối tượng Product và set thông tin
				if (index <= 9) {
					Product product = new Product();
					product.setCreateDate(new Date(System.currentTimeMillis()));
					product.setAddedByUser(8);
					product.setTitle(title != null ? title.trim() : "");
					product.setAuthor(author != null ? author.trim() : "");
					product.setLanguage("Tiếng việt");
					product.setDescription(descriptionBuilder.toString());
					product.setPage(Integer.valueOf(pageStr.trim()));
					product.setPublishYear(Integer.valueOf(yearStr.trim()));
					product.setQuantity(1000);
					product.setPrice(Integer.valueOf(priceStr.trim()));
					product.setCategory_id(15);
					product.setCategory_parent(2);
					product.setUpdateDate(new Date(System.currentTimeMillis()));
					product.setImgId(imageId);
					System.out.println(title);
					categoriesService.saveProduct(product);
				}

				if (index >= 10 && index <= 19) {
					Product product = new Product();
					product.setCreateDate(new Date(System.currentTimeMillis()));
					product.setAddedByUser(8);
					product.setTitle(title != null ? title.trim() : "");
					product.setAuthor(author != null ? author.trim() : "");
					product.setLanguage("Tiếng việt");
					product.setDescription(descriptionBuilder.toString());
					product.setPage(Integer.valueOf(pageStr.trim()));
					product.setPublishYear(Integer.valueOf(yearStr.trim()));
					product.setQuantity(1000);
					product.setPrice(Integer.valueOf(priceStr.trim()));
					product.setCategory_id(16);
					product.setCategory_parent(2);
					product.setUpdateDate(new Date(System.currentTimeMillis()));
					product.setImgId(imageId);
					System.out.println(title);
					categoriesService.saveProduct(product);
				}
				if (index >= 20 && index <= 29) {
					Product product = new Product();
					product.setCreateDate(new Date(System.currentTimeMillis()));
					product.setAddedByUser(8);
					product.setTitle(title != null ? title.trim() : "");
					product.setAuthor(author != null ? author.trim() : "");
					product.setLanguage("Tiếng việt");
					product.setDescription(descriptionBuilder.toString());
					product.setPage(Integer.valueOf(pageStr.trim()));
					product.setPublishYear(Integer.valueOf(yearStr.trim()));
					product.setQuantity(1000);
					product.setPrice(Integer.valueOf(priceStr.trim()));
					product.setCategory_id(14);
					product.setCategory_parent(2);
					product.setUpdateDate(new Date(System.currentTimeMillis()));
					product.setImgId(imageId);
					System.out.println(title);
					categoriesService.saveProduct(product);
				}
				if (index >= 30 && index <= 39) {
					Product product = new Product();
					product.setCreateDate(new Date(System.currentTimeMillis()));
					product.setAddedByUser(8);
					product.setTitle(title != null ? title.trim() : "");
					product.setAuthor(author != null ? author.trim() : "");
					product.setLanguage("Tiếng việt");
					product.setDescription(descriptionBuilder.toString());
					product.setPage(Integer.valueOf(pageStr.trim()));
					product.setPublishYear(Integer.valueOf(yearStr.trim()));
					product.setQuantity(1000);
					product.setPrice(Integer.valueOf(priceStr.trim()));
					product.setCategory_id(13);
					product.setCategory_parent(2);
					product.setUpdateDate(new Date(System.currentTimeMillis()));
					product.setImgId(imageId);
					System.out.println(title);

					categoriesService.saveProduct(product);
					
				}
				index++;
				System.out.println(index);
			}
		}

	}

	public static String removeVietnameseAccent(String text) {
		if (text == null)
			return "";
		// Chuẩn hóa unicode, tách dấu
		String temp = Normalizer.normalize(text, Normalizer.Form.NFD);
		// Loại bỏ các ký tự dấu (mã Unicode Mn - Mark Nonspacing)
		Pattern pattern = Pattern.compile("\\p{M}");
		return pattern.matcher(temp).replaceAll("");
	}

	public static String cleanTitle(String title) {
		String noAccent = removeVietnameseAccent(title);
		// Xóa các ký tự không phải chữ cái hoặc số
		return noAccent.replaceAll("[^\\p{L}\\p{N}]", "");
	}

	private static byte[] getData(File file) throws IOException {
		try (InputStream inputStream = new FileInputStream(file);
				ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream()) {
			byte[] buffer = new byte[8192]; // 8KB buffer
			int bytesRead;
			while ((bytesRead = inputStream.read(buffer)) != -1) {
				byteArrayOutputStream.write(buffer, 0, bytesRead);
			}
			return byteArrayOutputStream.toByteArray();
		}
	}

	public static void main(String[] args) throws IOException {
		readBookFile("C:\\Users\\VO TAN THANH\\Downloads\\data.txt");
	}
}