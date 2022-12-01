package admin.dto;

public class AdminDto {
	private int num;
	private String name;
	private String email;
	private int sal;
	private int rank;
	private String regdate;
	
	public AdminDto() {}

	public AdminDto(int num, String name, String email, int sal, int rank, String regdate) {
		super();
		this.num = num;
		this.name = name;
		this.email = email;
		this.sal = sal;
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

	public int getSal() {
		return sal;
	}

	public void setSal(int sal) {
		this.sal = sal;
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
