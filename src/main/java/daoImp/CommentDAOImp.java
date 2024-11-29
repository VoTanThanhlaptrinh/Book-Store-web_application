package daoImp;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import daoInterface.ICommentDAO;
import models.Comment;
import service.DatabaseConnection;

public class CommentDAOImp implements ICommentDAO {

	@Override
	public Comment getCommentByCommentId(int commentId) {
		Connection con = null;
		Comment comment = null;
		try {
			con = DatabaseConnection.getConnection();
			PreparedStatement statement = con.prepareStatement("select * from Comment where comment_id = ?");
			statement.setInt(1, commentId);
			ResultSet resultSet = statement.executeQuery();
			if (resultSet.next()) {
				int rating = resultSet.getInt(2);
				String content = resultSet.getNString(3);
				Date createDate = resultSet.getDate(4);
				Date updateDate = resultSet.getDate(5);
				comment = new Comment(commentId, rating, content, createDate, updateDate);
			}
			resultSet.close();
			statement.close();
		} catch (Exception e) {
			// TODO: handle exception
			try {
				con.close();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		return comment;
	}

	@Override
	public int saveComment(Comment comment) {
		// TODO Auto-generated method stub
		Connection con = null;
		int commentId = 0;
		try {
			con = DatabaseConnection.getConnection();
			PreparedStatement preparedStatement = con.prepareStatement(
					"insert into Comment (rating,content,create_date,update_date) values(?,?,?,?)",
					PreparedStatement.RETURN_GENERATED_KEYS);
			preparedStatement.setInt(1, comment.getRating());
			preparedStatement.setNString(2, comment.getContent());
			preparedStatement.setDate(3, comment.getCreateDate());
			preparedStatement.setDate(4, comment.getUpdateDate());
			preparedStatement.executeUpdate();
			ResultSet resultSet = preparedStatement.getGeneratedKeys();
			if (resultSet.next())
				commentId = resultSet.getInt(1);
			preparedStatement.close();
		} catch (Exception e) {
			// TODO: handle exception
			try {
				con.close();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		return commentId;
	}

	@Override
	public void updateComment(Comment comment) {
		// TODO Auto-generated method stub
		Connection con = null;
		try {
			con = DatabaseConnection.getConnection();
			PreparedStatement preparedStatement = con
					.prepareStatement("update Comment rating = ?, content = ?,update_date = ? where comment_id = ?");
			preparedStatement.setInt(1, comment.getRating());
			preparedStatement.setNString(2, comment.getContent());
			preparedStatement.setDate(3, comment.getUpdateDate());
			preparedStatement.setInt(4, comment.getCommentId());
			preparedStatement.executeUpdate();
			preparedStatement.close();
		} catch (Exception e) {
			// TODO: handle exception
			try {
				con.close();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
	}

}
