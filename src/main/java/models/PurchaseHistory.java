package models;

import java.sql.Date;

public class PurchaseHistory {
	 int orderId;
	  int productId;
	    String productName;
	   int imgId;    
	    int quantity;
	    double price;
	    double totalPricePerProduct;
	     Date createDate;//ngày tạo đơn hàng
	     String status; 
	     boolean canCancel;//biến hủy đơn hàng nếu trong thời gian hợp lệ
	    public PurchaseHistory() {
			// TODO Auto-generated constructor stub
		}
		public PurchaseHistory(int orderId,int productId, String productName, int imgId, int quantity, double price,
				double totalPricePerProduct, Date createDate, String status) {
			super();
			this.orderId = orderId;
			this.productId = productId;
			this.productName = productName;
			this.imgId = imgId;
			this.quantity = quantity;
			this.price = price;
			this.totalPricePerProduct = totalPricePerProduct;
			this.createDate = createDate;
			this.status = status;
		}
		public int getProductId() {
			return productId;
		}
		public void setProductId(int productId) {
			this.productId = productId;
		}
		public String getProductName() {
			return productName;
		}
		public void setProductName(String productName) {
			this.productName = productName;
		}
		public int getImgId() {
			return imgId;
		}
		public void setImgId(int imgId) {
			this.imgId = imgId;
		}
		public int getQuantity() {
			return quantity;
		}
		public void setQuantity(int quantity) {
			this.quantity = quantity;
		}
		public double getPrice() {
			return price;
		}
		public void setPrice(double price) {
			this.price = price;
		}
		public double getTotalPricePerProduct() {
			return totalPricePerProduct;
		}
		public void setTotalPricePerProduct(double totalPricePerProduct) {
			this.totalPricePerProduct = totalPricePerProduct;
		}
		public Date getCreateDate() {
			return createDate;
		}
		public void setCreateDate(Date createDate) {
			this.createDate = createDate;
		}
		public String getStatus() {
			return status;
		}
		public void setStatus(String status) {
			this.status = status;
		}
		   public boolean isCanCancel() {
		        return canCancel;
		    }

		    public void setCanCancel(boolean canCancel) {
		        this.canCancel = canCancel;
		    }
		    
		public int getOrderId() {
				return orderId;
			}
			public void setOrderId(int orderId) {
				this.orderId = orderId;
			}
			@Override
			public String toString() {
				return "PurchaseHistory [orderId=" + orderId + ", productId=" + productId + ", productName="
						+ productName + ", imgId=" + imgId + ", quantity=" + quantity + ", price=" + price
						+ ", totalPricePerProduct=" + totalPricePerProduct + ", createDate=" + createDate + ", status="
						+ status + ", canCancel=" + canCancel + "]";
			}

	    
}
