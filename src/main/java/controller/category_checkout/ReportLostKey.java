package controller.category_checkout;

import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.User;
import service.PublicKeyEmailVerification;

import java.io.IOException;
import java.sql.Timestamp;
import java.time.Duration;
import java.time.Instant;
import java.util.Properties;
import java.util.UUID;

@WebServlet("/reportLostKey")
public class ReportLostKey extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportLostKey() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
	    
	    User user = (User) session.getAttribute("user");

	    PublicKeyEmailVerification keyService = new PublicKeyEmailVerification();
	    
	    String token =  keyService.generateVerificationToken();
	    
	    Timestamp expiresAt = Timestamp.from(Instant.now().plus(Duration.ofMinutes(15)));
	    
	    keyService.saveTokenToDatabase(user.getUserId(), token, expiresAt); // lưu vào DB với thời gian hết hạn
	    
	    sendVerificationEmail(user.getEmail(), token);
	    request.setAttribute("token", token);

	    // 4. Phản hồi
	    request.setAttribute("message", "Hệ thống đã gửi email xác minh. Vui lòng kiểm tra hộp thư.");
	    request.getRequestDispatcher("webPage/giohang/lichsu.jsp").forward(request, response);
	}
	public static void sendVerificationEmail(String toEmail, String token) {
        final String fromEmail = "phamquocthien180103@gmail.com";
        final String password = "tygb cqjq ymem fbci";

        String subject = "Xác minh cập nhật khóa";
        String link = "http://localhost:8081/BOOK_STORE/verifyKeyReset?token=" + token;
        String body = "Nhấn vào link để xác minh: " + link;

        // Gửi email
        try {
            Properties props = new Properties();
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.port", "587");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");

            Session session = Session.getInstance(props, new Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(fromEmail, password);
                }
            });

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(fromEmail));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
            message.setSubject(subject);
            message.setText(body);

            Transport.send(message);
            System.out.println("Email sent successfully");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
