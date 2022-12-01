package user.dto;

public class UserDto {
	private int num;
	private String name;
	private String email;
	private int rank;
	private String regdate;
	
	private UserDto() {}

	public UserDto(int num, String name, String email, int rank, String regdate) {
		super();
		this.num = num;
		this.name = name;
		this.email = email;
		this.rank = rank;
		this.regdate = regdate;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getRank() {
		return rank;
	}

	public void setRank(int rank) {
		this.rank = rank;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	
}
