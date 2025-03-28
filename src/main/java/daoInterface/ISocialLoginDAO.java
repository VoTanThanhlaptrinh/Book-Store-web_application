package daoInterface;

import models.SocialLogin;

public interface ISocialLoginDAO {
	void save(SocialLogin login);
	boolean checkIdSocialLogin(String id);
}
