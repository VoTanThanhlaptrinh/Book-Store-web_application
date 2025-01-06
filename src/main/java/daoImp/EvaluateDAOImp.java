package daoImp;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import daoInterface.IEvaluateDAO;
import models.Evaluate;
import service.DatabaseConnection;

public class EvaluateDAOImp implements IEvaluateDAO {

	@Override
	public int saveEvaluate(Evaluate evaluate) {
		// TODO Auto-generated method stub
		int evaluateId = 0;
		try (Connection con = DatabaseConnection.getConnection();
				PreparedStatement preparedStatement = con.prepareStatement(
						"insert into Evaluate (user_id,product_id,comment_id,create_date,update_date) values(?,?,?,?,?)",
						Statement.RETURN_GENERATED_KEYS)) {
			preparedStatement.setInt(1, evaluate.getUserId());
			preparedStatement.setInt(2, evaluate.getProductId());
			preparedStatement.setInt(3, evaluate.getCommentId());
			preparedStatement.setDate(4, evaluate.getCreateDate());
			preparedStatement.setDate(5, evaluate.getUpdateDate());

			preparedStatement.executeUpdate();
			try (ResultSet re = preparedStatement.getGeneratedKeys();) {
				if (re.next()) {
					evaluateId = re.getInt(1);
				}
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return evaluateId;
	}

	@Override
	public List<Evaluate> get5EvaluatesOfProduct(int productId) {
		List<Evaluate> evaluates = new ArrayList<>();
		try (Connection con = DatabaseConnection.getConnection();
				PreparedStatement statement = con
						.prepareStatement("select top(5)* from Evaluate where product_id = ? order by update_date desc")) {
			statement.setInt(1, productId);
			try (ResultSet resultSet = statement.executeQuery()) {
				while (resultSet.next()) {
					int evaluateId = resultSet.getInt(1);
					int userId = resultSet.getInt(2);
					int commentId = resultSet.getInt(4);
					Date createDate = resultSet.getDate(5);
					Date updateDate = resultSet.getDate(6);
					evaluates.add(new Evaluate(evaluateId, userId, productId, commentId, createDate, updateDate));
				}
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return evaluates;
	}

	@Override
	public void updateEvaluate(Evaluate evaluate) {
		// TODO Auto-generated method stub
		try (Connection con = DatabaseConnection.getConnection();
				PreparedStatement preparedStatement = con
						.prepareStatement("update Evaluate update_date = ? where evaluateId = ?")) {
			preparedStatement.setDate(1, new Date(System.currentTimeMillis()));
			preparedStatement.setInt(2, evaluate.getEvaluateId());
			preparedStatement.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
