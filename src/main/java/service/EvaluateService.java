package service;

import java.util.List;

import daoImp.CommentDAOImp;
import daoImp.EvaluateDAOImp;
import daoInterface.ICommentDAO;
import daoInterface.IEvaluateDAO;
import models.Comment;
import models.Evaluate;

public class EvaluateService implements IEvaluateService {
	private ICommentDAO commentDAO;
	private IEvaluateDAO evaluateDAO;

	public EvaluateService() {
		commentDAO = new CommentDAOImp();
		evaluateDAO = new EvaluateDAOImp();
	}

	@Override
	public List<Evaluate> get5EvaluateByProductId(int productId) {
		return evaluateDAO.get5EvaluatesOfProduct(productId);
	}

	@Override
	public void saveEvaluate(Evaluate e) {
		// TODO Auto-generated method stub
		evaluateDAO.saveEvaluate(e);
	}

	@Override
	public void updateEvaluate(Evaluate e) {
		// TODO Auto-generated method stub
		evaluateDAO.updateEvaluate(e);
	}

	@Override
	public int saveComment(Comment c) {
		// TODO Auto-generated method stub
		return commentDAO.saveComment(c);
	}

	@Override
	public void updateComment(Comment c) {
		// TODO Auto-generated method stub
		commentDAO.updateComment(c);
	}

	@Override
	public Comment getCommentByCommentId(int commentId) {
		// TODO Auto-generated method stub
		return commentDAO.getCommentByCommentId(commentId);
	}

}
