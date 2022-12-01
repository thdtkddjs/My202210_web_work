package shop.dao;


public class ShopDao {
	//자신의 참조값을 저장할 static 필드
		private static ShopDao dao;
		//외부에서 객체를 생성하지 못하도록 
		//생성자의 접근지정자를 private로 한다.
		private ShopDao() {}
		//자신의 참조값을 리턴하는 static 메소드
		public static ShopDao getInstance() {
			if(dao==null) {
				dao=new ShopDao();
			}
			return dao;
		}
}
