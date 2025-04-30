package service;

import java.util.concurrent.TimeUnit;

import com.github.benmanes.caffeine.cache.Cache;
import com.github.benmanes.caffeine.cache.Caffeine;

public class LoginSpamService {
	
	private static final Cache<String, Integer> loginCache;
	static {
		loginCache = Caffeine.newBuilder().expireAfterWrite(5, TimeUnit.MINUTES).maximumSize(1000).build();
	}

	private static Integer countLogin(String username) {
		Integer count = loginCache.getIfPresent(username);
		return (count == null) ? 0 : count;
	}

	public static boolean checkSpam(String username) {
		return countLogin(username) >= 5;
	}

	public static void putUsername(String username) {
		int count = countLogin(username) + 1;
		loginCache.put(username, count);
	}

	public static void removeUser(String user) {
		loginCache.invalidate(user);
	}
}
