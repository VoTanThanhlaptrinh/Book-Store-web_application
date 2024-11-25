package daoInterface;

import models.Information;

public interface IInfoDao {
	
	int saveInfor(Information info);
	
	void deleteInfor(Information info);
	
	void updateInfor(Information info);
	
	Information findInfoByInfoId(int infoId);
}
