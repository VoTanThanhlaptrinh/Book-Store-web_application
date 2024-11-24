package daoInterface;

import models.Infomation;

public interface IInfoDao {
	
	int saveInfor(Infomation info);
	
	void deleteInfor(Infomation info);
	
	void updateInfor(Infomation info);
	
	Infomation findInfoByInfoId(int infoId);
}
