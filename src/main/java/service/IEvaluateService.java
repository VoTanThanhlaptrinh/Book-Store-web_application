package service;

import java.util.List;

import models.Comment;
import models.Evaluate;

public interface IEvaluateService {
	List<Evaluate> get5EvaluateByProductId(int productId);

	void saveEvaluate(Evaluate e);

	void updateEvaluate(Evaluate e);

	int saveComment(Comment c);

	void updateComment(Comment c);
	
	Comment getCommentByCommentId(int commentId);
}
