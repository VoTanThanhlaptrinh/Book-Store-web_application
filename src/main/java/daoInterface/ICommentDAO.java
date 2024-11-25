package daoInterface;

import java.util.List;

import models.Comment;

public interface ICommentDAO {
	List<Comment> getComments(int evaluateId);

	void saveComment(Comment comment);

	void updateComment(Comment comment);
}
