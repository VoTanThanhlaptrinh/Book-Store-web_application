package controller.product;

import java.io.IOException;
import java.sql.Date;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Comment;
import service.EvaluateService;
import service.IEvaluateService;

@WebServlet("/updateComment")
public class UpdateCommentController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private IEvaluateService evaluateService;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int commentId = Integer.valueOf(req.getParameter("commentId"));
		int rating = Integer.valueOf(req.getParameter("rating"));
		String content = req.getParameter("content");
		Comment comment = evaluateService.getCommentByCommentId(commentId);
		comment.setContent(content);
		comment.setRating(rating);
		comment.setUpdateDate(new Date(System.currentTimeMillis()));

		evaluateService.updateComment(comment);
	}

	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		evaluateService = new EvaluateService();
	}
}
