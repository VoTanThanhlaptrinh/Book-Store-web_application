package daoInterface;

import models.Comment;

public interface ICommentDAO {
	Comment getCommentByCommentId(int commentId);

	int saveComment(Comment comment);

	void updateComment(Comment comment);
}
