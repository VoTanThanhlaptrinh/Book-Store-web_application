package daoImp;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import daoInterface.IEvaluateDAO;
import models.Evaluate;
import service.DatabaseConnection;

public class EvaluateDAOImp implements IEvaluateDAO {

	@Override
	public int saveEvaluate(Evaluate evaluate) {
		// TODO Auto-generated method stub
		Connection con = null;
		int evaluateId = 0;
		try {
			con = DatabaseConnection.getConnection();
			PreparedStatement preparedStatement = con.prepareStatement(
					"insert into Evaluate (user_id,product_id,comment_id,create_date,update_date) values(?,?,?,?,?)",
					PreparedStatement.RETURN_GENERATED_KEYS);
			preparedStatement.setInt(1, evaluate.getUserId());
			preparedStatement.setInt(2, evaluate.getProductId());
			preparedStatement.setInt(3, evaluate.getCommentId());
			preparedStatement.setDate(4, evaluate.getCreateDate());
			preparedStatement.setDate(5, evaluate.getUpdateDate());

			preparedStatement.executeUpdate();
			ResultSet re = preparedStatement.getGeneratedKeys();
			if (re.next()) {
				evaluateId = re.getInt(1);
			}
			preparedStatement.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			try {
				con.close();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		return evaluateId;
	}

	@Override
	public List<Evaluate> get5EvaluatesOfProduct(int productId) {
		Connection con = null;
		List<Evaluate> evaluates = new ArrayList<Evaluate>();
		try {
			con = DatabaseConnection.getConnection();
			PreparedStatement statement = con
					.prepareStatement("select top 5 from Evaluate where product_id = ? order by create_date desc");
			statement.setInt(1, productId);
			ResultSet resultSet = statement.executeQuery();
			while (resultSet.next()) {
				int evaluateId = resultSet.getInt(1);
				int userId = resultSet.getInt(2);
				int commentId = resultSet.getInt(4);
				Date createDate = resultSet.getDate(5);
				Date updateDate = resultSet.getDate(6);
				evaluates.add(new Evaluate(evaluateId, userId, productId, commentId, createDate, updateDate));
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
		return evaluates;
	}
}
