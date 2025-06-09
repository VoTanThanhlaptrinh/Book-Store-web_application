package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.UUID;

public class PublicKeyEmailVerification {

    public String generateVerificationToken() {
        return UUID.randomUUID().toString();
    }

    public boolean saveTokenToDatabase(int userId, String token, Timestamp expiresAt) {
        String sql = "INSERT INTO email_verification_token (user_id, token, created_at, expires_at, is_used) VALUES (?, ?, GETDATE(), ?, 0)";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, userId);
            stmt.setString(2, token);
            stmt.setTimestamp(3, expiresAt);  // Java Timestamp ánh xạ với DATETIME trong SQL Server

            int rowsInserted = stmt.executeUpdate();
            return rowsInserted > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    public boolean isTokenValid(String token) {
        String sql = "SELECT expires_at FROM email_verification_token WHERE token = ?";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, token);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    Timestamp expiresAt = rs.getTimestamp("expires_at");
                    Timestamp now = new Timestamp(System.currentTimeMillis());

                    return expiresAt != null && expiresAt.after(now);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return false; // Không tìm thấy token hoặc lỗi
    }

    public int getUserIdFromToken(String token) {
        int userId = -1; // -1 nếu không tìm thấy
        String sql = "SELECT user_id FROM email_verification_token WHERE token = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, token);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                userId = rs.getInt("user_id");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return userId;
    }
}

