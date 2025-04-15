package models;

import java.util.Objects;

public class Resource {
	private String url;
	private int permission;
	private String name;
	public Resource(String url, int permission) {
		super();
		this.url = (url == null) ? "" : url;
		this.permission = permission;
	}

	public Resource(String url, String name) {
		super();
		this.url = url;
		this.name = name;
	}
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	@Override
	public int hashCode() {
		return Objects.hash(permission, url);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Resource other = (Resource) obj;
		return permission == other.permission && Objects.equals(url, other.url);
	}

	@Override
	public String toString() {
		return "Resource [url=" + url + ", permission=" + permission + "]";
	}
	
}
