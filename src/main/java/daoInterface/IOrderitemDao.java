package daoInterface;

public interface IOrderitemDao {
public void createOrderItem(int orderId, int productId, int quantity, double price);
}
