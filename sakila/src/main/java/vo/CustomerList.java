package vo;

public class CustomerList {
	private int id;
	private String name;
	private String address;
	private int zipCode;
	private long phone;
	private String city;
	private String country;
	private String notes;
	private int sId;
	
	
	@Override
	public String toString() {
		return "CustomerList [id=" + id + ", name=" + name + ", address=" + address + ", zipCode=" + zipCode
				+ ", phone=" + phone + ", city=" + city + ", country=" + country + ", notes=" + notes + ", sId=" + sId
				+ "]";
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getZipCode() {
		return zipCode;
	}
	public void setZipCode(int zipCode) {
		this.zipCode = zipCode;
	}
	public long getPhone() {
		return phone;
	}
	public void setPhone(long phone) {
		this.phone = phone;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getNotes() {
		return notes;
	}
	public void setNotes(String notes) {
		this.notes = notes;
	}
	public int getsId() {
		return sId;
	}
	public void setsId(int sId) {
		this.sId = sId;
	}
	

}

