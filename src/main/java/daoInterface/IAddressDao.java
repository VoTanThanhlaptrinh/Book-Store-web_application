package daoInterface;

import models.Address;

public interface IAddressDao {
void saveAddress(Address address);
void updateDefaultStatus(int userID, int addressID);
}
