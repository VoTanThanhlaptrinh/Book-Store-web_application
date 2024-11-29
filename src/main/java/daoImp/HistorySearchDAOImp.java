package daoImp;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import daoInterface.IHistorySearchDAO;
import models.HistorySearch;
import service.DatabaseConnection;

public class HistorySearchDAOImp implements IHistorySearchDAO {

	@Override
	public List<HistorySearch> getHistorySearchsOfUser(int userId) {
		// TODO Auto-generated method stub
		Connection con = null;
		List<HistorySearch> hisList = new ArrayList<HistorySearch>();
		try {
			con = DatabaseConnection.getConnection();
			PreparedStatement statement = con
					.prepareStatement("select 10 from History_search where user_id = ? order by create_date desc");
			statement.setInt(1, userId);
			ResultSet resultSet = statement.executeQuery();
			while (resultSet.next()) {
				int id = resultSet.getInt(1);
				String content = resultSet.getNString(3);
				Date createDate = resultSet.getDate(4);
				hisList.add(new HistorySearch(id, userId, content, createDate));
			}
			resultSet.close();
			statement.close();
		} catch (Exception e) {
			try {
				con.close();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		return hisList;
	}

	@Override
	public void saveHistorySearch(HistorySearch historySearch) {
		// TODO Auto-generated method stub
		Connection con = null;
		try {
			con = DatabaseConnection.getConnection();
			PreparedStatement preStatement = con
					.prepareStatement("insert into History_search (user_id,content,create_date) values(?,?,?)");
			preStatement.setInt(1, historySearch.getHisId());
			preStatement.setNString(2, historySearch.getContent());
			preStatement.setDate(3, historySearch.getCreateDate());
			preStatement.executeUpdate();
			preStatement.close();
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
	public void updateHistorySearch(HistorySearch historySearch) {
		// TODO Auto-generated method stub
		Connection con = null;
		try {
			con = DatabaseConnection.getConnection();
			PreparedStatement preStatement = con
					.prepareStatement("update History_search set user_id = ?,content = ? where his_id = ?");
			preStatement.setInt(1, historySearch.getHisId());
			preStatement.setNString(2, historySearch.getContent());
			preStatement.setInt(3, historySearch.getHisId());
			preStatement.executeUpdate();
			preStatement.close();
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
