package models;

import java.util.Date;
import java.util.Random;

public class Product {
	private int productId;
	private int addedByUser;
	private String title;
	private double price;
	private String description;
	private int imgId;
	private Date createDate;
	private Date updateDate;
	private int quantity;
	private int category_parent;
	private int category_id;
	private String language;
	private int page;
	private String author;
	private int publishYear;
	private int height;
	private int length;
	private int width;
	private int weight;
	private Random rand;
	
	private String unsignedTitle;

	public Product(int productId, int addedByUser, String title, double price, String description, int imgId,
			Date createDate, Date updateDate, int quantity, int category_parent, int category_id, String language,
			int page, String author, int publishYear) {
		super();
		this.productId = productId;
		this.addedByUser = addedByUser;
		this.title = title;
		this.price = price;
		this.description = description;
		this.imgId = imgId;
		this.createDate = createDate;
		this.updateDate = updateDate;
		this.quantity = quantity;
		this.category_parent = category_parent;
		this.category_id = category_id;
		this.language = language;
		this.page = page;
		this.author = author;
		this.publishYear = publishYear;
		/*
		 * this.rand= new Random(title.hashCode() + publishYear); this.height =
		 * rand.nextInt(5 - 1 + 1) + 1; this.length = rand.nextInt(20 - 10 + 1) + 10;
		 * this.width = rand.nextInt(20 - 10 + 1) + 10; this.weight = rand.nextInt(700 -
		 * 100 + 1) + 100;
		 */
	}

	public Product(int addedByUser, String title, double price, String description, int imgId, Date createDate,
			Date updateDate, int quantity, int category_parent, int category_id, String language, int page,
			String author, int publishYear) {
		super();
		this.addedByUser = addedByUser;
		this.title = title;
		this.price = price;
		this.description = description;
		this.imgId = imgId;
		this.createDate = createDate;
		this.updateDate = updateDate;
		this.quantity = quantity;
		this.category_parent = category_parent;
		this.category_id = category_id;
		this.language = language;
		this.page = page;
		this.author = author;
		this.publishYear = publishYear;
		
		
		/*
		 * this.rand = new Random(title.hashCode() + publishYear); this.height =
		 * rand.nextInt(5 - 1 + 1) + 1; this.length = rand.nextInt(20 - 10 + 1) + 10;
		 * this.width = rand.nextInt(20 - 10 + 1) + 10; this.weight = rand.nextInt(700 -
		 * 100 + 1) + 100;
		 */
	}

	public Product() {
	}

	


	public Product(String title, int height, int length, int width, int weight) {
		super();
		this.title = title;
		this.height = height;
		this.length = length;
		this.width = width;
		this.weight = weight;
	}

	public int getProductId() {
		return productId;
	}


	public void setProductId(int productId) {
		this.productId = productId;
	}



	public int getAddedByUser() {
		return addedByUser;
	}



	public void setAddedByUser(int addedByUser) {
		this.addedByUser = addedByUser;
	}



	public String getTitle() {
		return title;
	}



	public void setTitle(String title) {
		this.title = title;
	}



	public double getPrice() {
		return price;
	}



	public void setPrice(double price) {
		this.price = price;
	}



	public String getDescription() {
		return description;
	}



	public void setDescription(String description) {
		this.description = description;
	}



	public int getImgId() {
		return imgId;
	}



	public void setImgId(int imgId) {
		this.imgId = imgId;
	}



	public Date getCreateDate() {
		return createDate;
	}



	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}



	public Date getUpdateDate() {
		return updateDate;
	}



	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}



	public int getQuantity() {
		return quantity;
	}



	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}



	public int getCategory_parent() {
		return category_parent;
	}



	public void setCategory_parent(int category_parent) {
		this.category_parent = category_parent;
	}



	public int getCategory_id() {
		return category_id;
	}



	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}



	public String getLanguage() {
		return language;
	}



	public void setLanguage(String language) {
		this.language = language;
	}



	public int getPage() {
		return page;
	}



	public void setPage(int page) {
		this.page = page;
	}



	public String getAuthor() {
		return author;
	}



	public void setAuthor(String author) {
		this.author = author;
	}



	public int getPublishYear() {
		return publishYear;
	}



	public void setPublishYear(int publishYear) {
		this.publishYear = publishYear;
	}

	public int getHeight() {
		return height;
	}

	public int getLength() {
		return length;
	}

	public int getWidth() {
		return width;
	}

	public int getWeight() {
		return weight;
	}
	@Override
	public String toString() {
		return "Product [productId=" + productId + ", addedByUser=" + addedByUser + ", title=" + title + ", price="
				+ price + ", description=" + description + ", imgId=" + imgId + ", createDate=" + createDate
				+ ", updateDate=" + updateDate + ", quantity=" + quantity + ", category_parent=" + category_parent
				+ ", category_id=" + category_id + ", language=" + language + ", page=" + page + ", author=" + author
				+ ", publishYear=" + publishYear + "]";
	}

	public String getUnsignedTitle() {
		return unsignedTitle;
	}

	public void setUnsignedTitle(String unsignedTitle) {
		this.unsignedTitle = unsignedTitle;
	}


	
}
