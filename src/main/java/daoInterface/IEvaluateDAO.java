package daoInterface;

import java.util.List;

import models.Evaluate;

public interface IEvaluateDAO {
	List<Evaluate> getEvaluatesOfUserForEachProduct(int userId, int productId);

	int saveEvaluate(Evaluate evaluate);

}
