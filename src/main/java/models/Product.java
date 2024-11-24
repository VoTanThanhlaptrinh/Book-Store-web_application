package models;

import java.util.Date;

public class Product {
	private int productId;
	private int addedByAdmin;
	private String title;
	private double price;
	private String description;
	private String type;
	private Image img;
	private Date createDate;
	private Date updateDate;

	public Product(int productId, int addedByAdmin, String title, double price, String description, String type,
			Image img, Date createDate, Date updateDate) {
		super();
		this.productId = productId;
		this.addedByAdmin = addedByAdmin;
		this.title = title;
		this.price = price;
		this.description = description;
		this.type = type;
		this.img = img;
		this.createDate = createDate;
		this.updateDate = updateDate;
	}

	public Product() {

	}

	public boolean hasSameId(int id) {
		return this.productId == id;
	}

	public int getProductId() {
		return productId;
	}

	public int getAddedByAdmin() {
		return addedByAdmin;
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

	public Image getImg() {
		return img;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

}
