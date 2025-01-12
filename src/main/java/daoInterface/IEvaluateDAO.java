package daoInterface;

import java.util.List;

import models.Evaluate;

public interface IEvaluateDAO {
	List<Evaluate> get5EvaluatesOfProduct(int productId);

	int saveEvaluate(Evaluate evaluate);

	void updateEvaluate(Evaluate evaluate);

	boolean checkProduct(int productId, int userId);

	List<Evaluate> getEvaluatesByProductId(int productId);

	Evaluate getEvaluateOfProductByUser(int productId, int userId);
}
