package daoImp;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import daoInterface.IEvaluateDAO;
import models.Evaluate;
import service.DatabaseConnection;

public class EvaluateDAOImp implements IEvaluateDAO {

	@Override
	public List<Evaluate> getEvaluatesOfUserForEachProduct(int userId, int productId) {
		Connection con = null;
		List<Evaluate> evaluates = new ArrayList<Evaluate>();
		try {
			con = DatabaseConnection.getConnection();
			Statement statement = con.createStatement();
			ResultSet resultSet = statement
					.executeQuery("select * from Evaluate where user_id = " + userId + " and product_id =" + productId);
			while (resultSet.next()) {
				int evaluateId = resultSet.getInt(1);
				int rating = resultSet.getInt(4);
				Date createDate = resultSet.getDate(5);
				Date updateDate = resultSet.getDate(6);
				evaluates.add(new Evaluate(evaluateId, userId, productId, rating, createDate, updateDate));
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
		return null;
	}

	@Override
	public int saveEvaluate(Evaluate evaluate) {
		// TODO Auto-generated method stub
		Connection con = null;
		int evaluateId = 0;
		try {
			con = DatabaseConnection.getConnection();
			PreparedStatement preparedStatement = con.prepareStatement(
					"insert into Evaluate (user_id,product_id,rating,create_date,update_date) values(?,?,?,?,?)",
					Statement.RETURN_GENERATED_KEYS);
			preparedStatement.setInt(1, evaluate.getUserId());
			preparedStatement.setInt(2, evaluate.getProductId());
			preparedStatement.setInt(3, evaluate.getRating());
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
}
