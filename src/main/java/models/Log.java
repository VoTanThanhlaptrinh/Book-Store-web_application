package models;

import java.sql.Date;

public class Log {
	// id của log
	private long id;
	private int userId;
	// cấp độ của log ví dụ info, warning,...
	private String level;
	// địa chỉ ip
	private String ip;
	// đối tượng đang được hướng tới. Ví dụ đăng nhập thì là User.
	private String target;
	// url mà người dùng hiện thời đang ở. ví dụ /login
	private String url;
	// nếu người thay đổi data thì đây là data trước khi thay đổi
	private byte[] previousData;
	// nếu người thay đổi data thì đây là data sau khi thay đổi
	private byte[] afterData;
	// thông điệp thường là tình trạng thành công hay thất bại. Có thể là mô tả chi tiết hành động User
	private String message;
	// thời gian log được tạo ra
	private Date createAt;
	
	
	public Log(long id, int userId, String level, String ip, String target, String url, byte[] previousData,
			byte[] afterData, String message, Date createAt) {
		super();
		this.id = id;
		this.userId = userId;
		this.level = level;
		this.ip = ip;
		this.target = target;
		this.url = url;
		this.previousData = previousData;
		this.afterData = afterData;
		this.message = message;
		this.createAt = createAt;
	}

	public Log(int userId, String level, String ip, String target, String url, byte[] previousData, byte[] afterData,
			String message) {
		super();
		this.userId = userId;
		this.level = level;
		this.ip = ip;
		this.target = target;
		this.url = url;
		this.previousData = previousData;
		this.afterData = afterData;
		this.message = message;
		this.createAt = new Date(System.currentTimeMillis());
	}
	
	public Log(int userId, String level, String target, String url, String message) {
		super();
		this.userId = userId;
		this.level = level;
		this.target = target;
		this.url = url;
		this.message = message;
		this.createAt = new Date(System.currentTimeMillis());
	}

	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	
	public String getTarget() {
		return target;
	}
	public void setTarget(String target) {
		this.target = target;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public byte[] getPreviousData() {
		return previousData;
	}
	public void setPreviousData(byte[] previousData) {
		this.previousData = previousData;
	}
	public byte[] getAfterData() {
		return afterData;
	}
	public void setAfterData(byte[] afterData) {
		this.afterData = afterData;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Date getCreateAt() {
		return createAt;
	}
	public void setCreateAt(Date createAt) {
		this.createAt = createAt;
	}
}
