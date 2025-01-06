package daoInterface;

import java.util.List;

import models.HistorySearch;

public interface IHistorySearchDAO {
	List<HistorySearch> getHistorySearchsOfUser(int userId);

	void saveHistorySearch(HistorySearch historySearch);

	void updateHistorySearch(HistorySearch historySearch);
}
