package daoInterface;

import models.Address;

public interface IAddressDao {
int saveAddressAndGetID(Address address);
void updateDefaultStatus(int userID, int addressID);
}
