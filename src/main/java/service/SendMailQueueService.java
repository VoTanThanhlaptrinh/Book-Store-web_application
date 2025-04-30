package service;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class SendMailQueueService {
	private static SendMailQueueService instance;
	private ISendMailService mailService;
	private ExecutorService executor;

	private SendMailQueueService() {
		this.mailService = new SendMailImp();
		this.executor = Executors.newFixedThreadPool(5);
	}

	public static synchronized SendMailQueueService getInstance() {
		if (instance == null) {
			instance = new SendMailQueueService();
		}
		return instance;
	}

	public void sendMail(String email, String content, String subject, String code) {
		this.executor.submit(() -> {
			// bỏ vào cache mã xác thực để dễ dàng lấy và kiểm tra hết hạn
			EmailSpamService.putCode(email, code);
			// bỏ vào cache đếm để kiểm tra spam
			EmailSpamService.putEmail(email);
			mailService.sendMail(email, content, subject);
		});
	}

	public void shutdown() {
		executor.shutdown();
	}
}
