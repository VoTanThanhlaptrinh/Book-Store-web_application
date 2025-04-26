package daoImp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import daoInterface.ILogDAO;
import models.Log;
import models.User;
import service.DatabaseConnection;

public class LogDAOImpl implements ILogDAO {

	@Override
	public void saveLog(Log log) {
		// TODO Auto-generated method stub
		try (Connection con = DatabaseConnection.getConnection();
				PreparedStatement preparedStatement = con.prepareStatement("insert into Log values(?,?,?,?,?,?,?,?,?)");) {
			preparedStatement.setInt(1, log.getUserId());
			preparedStatement.setNString(2, log.getLevel());
			preparedStatement.setNString(3, log.getIp());
			preparedStatement.setNString(4, log.getTarget());
			preparedStatement.setNString(5, log.getUrl());
			preparedStatement.setBytes(6, log.getPreviousData());
			preparedStatement.setBytes(7, log.getAfterData());
			preparedStatement.setNString(8, log.getMessage());
			preparedStatement.setDate(9, log.getCreateAt());
			preparedStatement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<Log> getLogsByUserId(User user) {
		List<Log> logs = new ArrayList<Log>();
		try (Connection con = DatabaseConnection.getConnection();
				PreparedStatement preparedStatement = con.prepareStatement("select * from Log where user_id = ?");) {
			preparedStatement.setInt(1, user.getUserId());
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				Log log = new Log(rs.getLong(1), // log_id: ID của bản ghi log
						rs.getInt(2), // user_id: ID người dùng (có thể null nếu log không liên quan người dùng)
						rs.getNString(3), // level: cấp độ log (ví dụ: INFO, WARNING, ERROR)
						rs.getNString(4), // ip: địa chỉ IP của người dùng
						rs.getNString(5), // target: đối tượng được tác động (ví dụ: User, Product, v.v.)
						rs.getNString(6), // url: URL mà hành động xảy ra
						rs.getBytes(7), // previousData: dữ liệu trước khi thay đổi (dạng nhị phân)
						rs.getBytes(8), // afterData: dữ liệu sau khi thay đổi (dạng nhị phân)
						rs.getNString(9), // message: mô tả hành động hoặc thông điệp log
						rs.getDate(10) // createAt: thời gian log được tạo
				);
				logs.add(log);

			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return logs;
	}
}
