package models;

public class Address {
	private int addressID;
	private int userID;
	private String full_name;
	private String phone;
	private int districtID;
	private String ward_code;
	private String address_detail;
	private String address_type;
	private String provinceName;
	private String districtName;
	private String wardName;
	private boolean is_default;
	
	

	public Address(int addressID, int userID, String full_name, String phone, int districtID, String ward_code,
			String address_detail, String address_type, boolean is_default) {
		super();
		this.addressID = addressID;
		this.userID = userID;
		this.full_name = full_name;
		this.phone = phone;
		this.districtID = districtID;
		this.ward_code = ward_code;
		this.address_detail = address_detail;
		this.address_type = address_type;
		this.is_default = is_default;
	}

	public Address(int userID, String full_name, String phone, int districtID, String ward_code, String address_detail,
			String address_type, boolean is_default) {
		super();
		this.userID = userID;
		this.full_name = full_name;
		this.phone = phone;
		this.districtID = districtID;
		this.ward_code = ward_code;
		this.address_detail = address_detail;
		this.address_type = address_type;
		this.is_default = is_default;
	}

	public Address(int userID, String full_name, String phone, int districtID, String ward_code, String address_detail,
			String address_type, String provinceName, String districtName, String wardName, boolean is_default) {
		super();
		this.userID = userID;
		this.full_name = full_name;
		this.phone = phone;
		this.districtID = districtID;
		this.ward_code = ward_code;
		this.address_detail = address_detail;
		this.address_type = address_type;
		this.provinceName = provinceName;
		this.districtName = districtName;
		this.wardName = wardName;
		this.is_default = is_default;
	}

	public String getProvinceName() {
		return provinceName;
	}

	public void setProvinceName(String provinceName) {
		this.provinceName = provinceName;
	}

	public String getDistrictName() {
		return districtName;
	}

	public void setDistrictName(String districtName) {
		this.districtName = districtName;
	}

	public String getWardName() {
		return wardName;
	}

	public void setWardName(String wardName) {
		this.wardName = wardName;
	}

	public int getAddressID() {
		return addressID;
	}

	public void setAddressID(int addressID) {
		this.addressID = addressID;
	}

	public int getUserID() {
		return userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
	}

	public String getFull_name() {
		return full_name;
	}

	public void setFull_name(String full_name) {
		this.full_name = full_name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getDistrictID() {
		return districtID;
	}

	public void setDistrictID(int districtID) {
		this.districtID = districtID;
	}

	public String getWard_code() {
		return ward_code;
	}

	public void setWard_code(String ward_code) {
		this.ward_code = ward_code;
	}

	public String getAddress_detail() {
		return address_detail;
	}

	public void setAddress_detail(String address_detail) {
		this.address_detail = address_detail;
	}

	public boolean isIs_default() {
		return is_default;
	}

	public void setIs_default(boolean is_default) {
		this.is_default = is_default;
	}

	public String getAddress_type() {
		return address_type;
	}

	public void setAddress_type(String address_type) {
		this.address_type = address_type;
	}

	@Override
	public String toString() {
		return "Address [addressID=" + addressID + ", userID=" + userID + ", full_name=" + full_name + ", phone="
				+ phone + ", districtID=" + districtID + ", ward_code=" + ward_code + ", address_detail="
				+ address_detail + ", address_type=" + address_type + ", provinceName=" + provinceName
				+ ", districtName=" + districtName + ", wardName=" + wardName + ", is_default=" + is_default + "]";
	}
}

