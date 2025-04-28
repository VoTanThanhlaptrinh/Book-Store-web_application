package controller;

import java.io.BufferedOutputStream;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Image;
import service.LoginService;

@WebServlet("/getImage")
public class ImageController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int imgId;
		try {
			imgId = Integer.parseInt(req.getParameter("img_id"));
		} catch (NumberFormatException e) {
			resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid image ID");
			return;
		}

		LoginService loginService = new LoginService();
		Image img = loginService.getImageByImgId(imgId);
		if (img != null) {

			resp.setContentType(img.getFileType());
			resp.setContentLength(img.getData().length);

			try (BufferedOutputStream out = new BufferedOutputStream(resp.getOutputStream())) {

				byte[] buffer = new byte[4096];
				int offset = 0;
				int remaining = img.getData().length;

				while (remaining > 0) {
					int bytesToWrite = Math.min(buffer.length, remaining);
					System.arraycopy(img.getData(), offset, buffer, 0, bytesToWrite);
					out.write(buffer, 0, bytesToWrite);
					offset += bytesToWrite;
					remaining -= bytesToWrite;
				}
				out.flush();
			} catch (IOException e) {
				System.err.println("Error writing image data: " + e.getMessage());
			}
		} else {
			resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Image not found");
		}
	}
}
