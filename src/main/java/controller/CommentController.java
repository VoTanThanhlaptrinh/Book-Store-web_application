package controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.Comment;
import models.Evaluate;
import models.User;
import service.EvaluateService;
import service.IEvaluateService;

@WebServlet("/comment")
public class CommentController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private IEvaluateService evaluateService;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		HttpSession session = req.getSession();

		User user = (User) session.getAttribute("user");

		int productId = Integer.valueOf(req.getParameter("productId"));
		int rating = Integer.valueOf(req.getParameter("rating"));
		String content = req.getParameter("content");
		if (evaluateService.checkProductHasBeenEvaluated(productId, user.getUserId())) {
			Evaluate evaluate = evaluateService.getEvaluateOfProductByUser(productId, user.getUserId());
			Comment comment = evaluateService.getCommentByCommentId(evaluate.getCommentId());
			comment.setContent(content);
			comment.setRating(rating);
			comment.setUpdateDate(new Date(System.currentTimeMillis()));
			evaluateService.updateComment(comment);
		} else {
			Comment comment = new Comment(rating, content, new Date(System.currentTimeMillis()),
					new Date(System.currentTimeMillis()));

			int commentId = evaluateService.saveComment(comment);
			Evaluate evaluate = new Evaluate(user.getUserId(), productId, commentId,
					new Date(System.currentTimeMillis()), new Date(System.currentTimeMillis()));
			evaluateService.saveEvaluate(evaluate);
		}
	}

	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		evaluateService = new EvaluateService();
	}
}
