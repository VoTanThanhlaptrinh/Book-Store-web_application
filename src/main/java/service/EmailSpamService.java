package service;

import java.util.concurrent.TimeUnit;

import com.github.benmanes.caffeine.cache.Cache;
import com.github.benmanes.caffeine.cache.Caffeine;

public class EmailSpamService {
	private static final Cache<String, String> otpCache;
	private static final Cache<String, Integer> mailCache;
	static {
		otpCache = Caffeine.newBuilder().expireAfterWrite(5, TimeUnit.MINUTES).maximumSize(1000).build();
		mailCache = Caffeine.newBuilder().expireAfterWrite(5, TimeUnit.MINUTES).maximumSize(1000).build();
	}

	public static void putCode(String email, String code) {
		otpCache.put(email, code);
	}

	// get code nếu có, không có hoặc hết hạn trả về null
	public static String getCode(String email) {
		return otpCache.getIfPresent(email);
	}

	// xoá code
	public static void removeCode(String key) {
		otpCache.invalidate(key);
	}
	private static Integer countSendMail(String username) {
		Integer count = mailCache.getIfPresent(username);
		return (count == null) ? 0 : count;
	}

	public static boolean checkSpam(String email) {
		return countSendMail(email) >= 5;
	}

	public static void putEmail(String email) {
		int count = countSendMail(email) + 1;
		mailCache.put(email, count);
	}

	public static void removeUser(String email) {
		mailCache.invalidate(email);
	}
}
