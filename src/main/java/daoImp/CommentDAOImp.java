package daoImp;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import daoInterface.ICommentDAO;
import models.Comment;
import service.DatabaseConnection;

public class CommentDAOImp implements ICommentDAO {

	@Override
	public List<Comment> getComments(int evaluateId) {
		Connection con = null;
		List<Comment> comments = new ArrayList<Comment>();
		try {
			con = DatabaseConnection.getConnection();
			Statement statement = con.createStatement();
			ResultSet resultSet = statement.executeQuery("select * from Comment where evaluate_id =" + evaluateId);
			while (resultSet.next()) {
				int commentId = resultSet.getInt(1);
				String content = resultSet.getNString(3);
				Date createDate = resultSet.getDate(4);
				Date updateDate = resultSet.getDate(5);
				comments.add(new Comment(commentId, evaluateId, content, createDate, updateDate));
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
		return comments;
	}

	@Override
	public void saveComment(Comment comment) {
		// TODO Auto-generated method stub
		Connection con = null;
		try {
			con = DatabaseConnection.getConnection();
			PreparedStatement preparedStatement = con.prepareStatement(
					"insert into Comment (evaluate_id,content,create_date,update_date) values(?,?,?,?)");
			preparedStatement.setInt(1, comment.getEvaluateId());
			preparedStatement.setNString(2, comment.getContent());
			preparedStatement.setDate(3, comment.getCreateDate());
			preparedStatement.setDate(4, comment.getUpdateDate());
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

	@Override
	public void updateComment(Comment comment) {
		// TODO Auto-generated method stub
		Connection con = null;
		try {
			con = DatabaseConnection.getConnection();
			PreparedStatement preparedStatement = con.prepareStatement(
					"update Comment content = ?,update_date = ? where comment_id =" + comment.getCommentId());
			preparedStatement.setNString(1, comment.getContent());
			preparedStatement.setDate(2, comment.getUpdateDate());
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
