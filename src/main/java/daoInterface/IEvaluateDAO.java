package daoInterface;

import java.util.List;

import models.Evaluate;

public interface IEvaluateDAO {
	List<Evaluate> get5EvaluatesOfProduct(int productId);

	int saveEvaluate(Evaluate evaluate);

}
