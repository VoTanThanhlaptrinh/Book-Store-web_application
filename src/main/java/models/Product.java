package models;

import java.util.Date;

public class Product {
	private int productId;
    private int addedByAdmin;
    private String title;
    private double price;
    private String description;
    private String type;
    private int imgId;
    private Date createDate;
    private Date updateDate;
	public Product(int productId, int addedByAdmin, String title, double price, String description, String type,
			int imgId, Date createDate, Date updateDate) {
		super();
		this.productId = productId;
		this.addedByAdmin = addedByAdmin;
		this.title = title;
		this.price = price;
		this.description = description;
		this.type = type;
		this.imgId = imgId;
		this.createDate = createDate;
		this.updateDate = updateDate;
	}
	public Product() {
		
	}
    
}
