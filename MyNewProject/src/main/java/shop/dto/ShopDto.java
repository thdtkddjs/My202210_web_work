package shop.dto;

public class ShopDto {
	private int num;
	private String name;
	private String phone;
	private int claim;
	private int rank;
	
	private ShopDto() {}

	public ShopDto(int num, String name, String phone, int claim, int rank) {
		super();
		this.num = num;
		this.name = name;
		this.phone = phone;
		this.claim = claim;
		this.rank = rank;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getClaim() {
		return claim;
	}

	public void setClaim(int claim) {
		this.claim = claim;
	}

	public int getRank() {
		return rank;
	}

	public void setRank(int rank) {
		this.rank = rank;
	}
	
	
	
}
