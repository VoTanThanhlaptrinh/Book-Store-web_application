package models;

public class Resource {
	private String url;
	private int permission;

	public Resource(String url, int permission) {
		super();
		this.url = url;
		this.permission = permission;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public int getPermission() {
		return permission;
	}

	public void setPermission(int permission) {
		this.permission = permission;
	}

	public boolean checkPath(String path) {
		return url.equals(path) && permission >= 2;
	}
}
