package controller;

import java.io.BufferedOutputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
            resp.setContentType("image/jpeg"); // Adjust MIME type if the image is not JPEG
            resp.setContentLength(img.getData().length); // Optional, useful for clients

            try (BufferedOutputStream out = new BufferedOutputStream(resp.getOutputStream())) {
                // Write data in chunks
                byte[] buffer = new byte[4096]; // 4KB buffer size
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
                // Handle IO issues like client disconnections gracefully
                System.err.println("Error writing image data: " + e.getMessage());
            }
        } else {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Image not found");
        }
    }
}
