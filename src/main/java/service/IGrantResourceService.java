package service;

import java.util.ArrayList;
import java.util.Map;

public interface IGrantResourceService {
	void grant(int userId, Map<String, ArrayList<Integer>> permission); 
}
