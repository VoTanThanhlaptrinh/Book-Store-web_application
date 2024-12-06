package controller;

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
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int imgId = Integer.parseInt(req.getParameter("img_id"));
        
        LoginService loginService = new LoginService();
        Image img = loginService.getImageByImgId(imgId);
        
        if (img != null) {
            resp.setContentType("image/jpeg");  // You can change this based on image type
            resp.getOutputStream().write(img.getData());
        } else {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Image not found");
        }
    }
}