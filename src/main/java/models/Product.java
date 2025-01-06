package models;

import java.util.Date;

public class Product {
	private int productId;
	private int addedByUser;
	private String title;
	private double price;
	
	private String description;
	private String type;
	private int imgId;
	private Date createDate;
	private Date updateDate;
	private int quantity;

	public Product(int productId, int addedByUser, String title, double price, String description, String type,
			int imgId, Date createDate, Date updateDate, int quantity) {
		super();
		this.productId = productId;
		this.addedByUser = addedByUser;
		this.title = title;
		this.price = price;
		this.description = description;
		this.type = type;
		this.imgId = imgId;
		this.createDate = createDate;
		this.updateDate = updateDate;
		this.quantity = quantity;
	}

	public Product(int addedByUser, String title, double price, String description, String type, int imgId,
			Date createDate, Date updateDate, int quantity) {
		super();
		this.addedByUser = addedByUser;
		this.title = title;
		this.price = price;
		this.description = description;
		this.type = type;
		this.imgId = imgId;
		this.createDate = createDate;
		this.updateDate = updateDate;
		this.quantity = quantity;
	}

	public Product() {

	}

	public boolean hasSameId(int id) {
		return this.productId == id;
	}

	public int getProductId() {
		return productId;
	}

	
	public int getAddedByUser() {
		return addedByUser;
	}

	public String getTitle() {
		return title;
	}

	public double getPrice() {
		return price;
	}

	public String getDescription() {
		return description;
	}

	public String getType() {
		return type;
	}

	public int getImgId() {
		return imgId;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public int getQuantity() {
		return quantity;
	}
}
