package admin.dto;

public class AdminDto {
	private int num;
	private String name;
	private String email;
	private String id;
	private String pwd;
	private int sal;
	private int rank;
	private String regdate;
	
	public AdminDto() {}

	public AdminDto(int num, String name, String email, String id, String pwd, int sal, int rank, String regdate) {
		super();
		this.num = num;
		this.name = name;
		this.email = email;
		this.id = id;
		this.pwd = pwd;
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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
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
