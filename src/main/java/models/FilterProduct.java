package models;

public class FilterProduct {
	 private int productId;
	    private String imgId;
	    private String title;
	    private double price;

	    public FilterProduct(int productId, String imgId, String title, double price) {
	        this.productId = productId;
	        this.imgId = imgId;
	        this.title = title;
	        this.price = price;
	    }


	    public int getProductId() { return productId; }
	    public void setProductId(int productId) { this.productId = productId; }

	    public String getImgId() { return imgId; }
	    public void setImgId(String imgId) { this.imgId = imgId; }

	    public String getTitle() { return title; }
	    public void setTitle(String title) { this.title = title; }

	    public double getPrice() { return price; }
	    public void setPrice(double price) { this.price = price; }
}
