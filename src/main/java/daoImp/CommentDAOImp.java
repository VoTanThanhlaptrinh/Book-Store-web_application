package daoImp;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import daoInterface.ICommentDAO;
import models.Comment;
import service.DatabaseConnection;

public class CommentDAOImp implements ICommentDAO {

	@Override
	public Comment getCommentByCommentId(int commentId) {
		Comment comment = null;
		try (Connection con = DatabaseConnection.getConnection();
				PreparedStatement statement = con.prepareStatement("select * from Comment where comment_id = ?");) {
			statement.setInt(1, commentId);
			try (ResultSet resultSet = statement.executeQuery();) {
				if (resultSet.next()) {
					int rating = resultSet.getInt(2);
					String content = resultSet.getNString(3);
					Date createDate = resultSet.getDate(4);
					Date updateDate = resultSet.getDate(5);
					comment = new Comment(commentId, rating, content, createDate, updateDate);
				}
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return comment;
	}

	@Override
	public int saveComment(Comment comment) {
		// TODO Auto-generated method stub
		int commentId = 0;
		try(Connection con = DatabaseConnection.getConnection();
			PreparedStatement preparedStatement = con.prepareStatement(
					"insert into Comment (rating,content,create_date,update_date) values(?,?,?,?)",
					Statement.RETURN_GENERATED_KEYS);) {
			preparedStatement.setInt(1, comment.getRating());
			preparedStatement.setNString(2, comment.getContent());
			preparedStatement.setDate(3, comment.getCreateDate());
			preparedStatement.setDate(4, comment.getUpdateDate());
			preparedStatement.executeUpdate();
			try(ResultSet resultSet = preparedStatement.getGeneratedKeys();) {
				if (resultSet.next()) {
					commentId = resultSet.getInt(1);
				}
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return commentId;
	}

	@Override
	public void updateComment(Comment comment) {
		// TODO Auto-generated method stub
		try (Connection con = DatabaseConnection.getConnection();
				PreparedStatement preparedStatement = con.prepareStatement(
						"update Comment set rating = ?, content = ?,update_date = ? where comment_id = ?");) {
			preparedStatement.setInt(1, comment.getRating());
			preparedStatement.setNString(2, comment.getContent());
			preparedStatement.setDate(3, comment.getUpdateDate());
			preparedStatement.setInt(4, comment.getCommentId());
			preparedStatement.executeUpdate();
			preparedStatement.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
