package service;

import java.util.Properties;

import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.AddressException;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

public class SendMailImp implements ISendMailService {
	private String from;
	private String pass;

	public SendMailImp() {
		super();
		this.from = "vtthanh32004@gmail.com";
		this.pass = "rldl qiwm hkuw nety";
//		this.from = "votanthanh32004@gmail.com";
//		this.pass = "wvxk oyvr meiu bghq";
//		this.from = "22130257@st.hcmuaf.edu.vn";
//		this.pass = "euza ktrq dzei uywj";
	}

	@Override
	public void sendMail(String email, String content, String subject) {
		// TODO Auto-generated method stub
		String to = email;
		String host = "smtp.gmail.com";

		// configure SMTP details
		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", "587");

		// create the mail Session object
		Session session = Session.getInstance(props);
		session.setDebug(true);
		try {
			// create a MimeMessage object
			Message message = new MimeMessage(session);
			// set From email field
			message.setFrom(new InternetAddress(from));
			// set To email field
			message.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
			// set email subject field
			message.setSubject(subject);
			// set the content of the email message
			message.setText(content);
			Transport transport = session.getTransport("smtp");
			transport.connect(host, from, pass);
			transport.sendMessage(message, message.getAllRecipients());
			transport.close();

		} catch (AddressException ae) {
			ae.printStackTrace();
		} catch (MessagingException me) {
			me.printStackTrace();
		}
	}
}
