package service;

import java.util.ArrayList;
import java.util.Map;
import java.util.ResourceBundle;

public interface IGrantResourceService {
	void grant(int userId, Map<String, ArrayList<Integer>> permission, ResourceBundle bundle); 
}
