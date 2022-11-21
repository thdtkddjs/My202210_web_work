package test.users.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import test.users.dto.UsersDto;
import test.util.DbcpBean;

public class UsersDao {
		//자신의 참조값을 저장할 static 필드
		private static UsersDao dao;
		//외부에서 객체를 생성하지 못하도록 
		//생성자의 접근지정자를 private로 한다.
		private UsersDao() {}
		//자신의 참조값을 리턴하는 static 메소드
		public static UsersDao getInstance() {
			if(dao==null) {
				dao=new UsersDao();
			}
			return dao;
		}
	
	public boolean getDate(String id, String pwd) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();

			String sql = "select regdate"
					+ " from users"
					+ " where id=? and pwd=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rowCount = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		if(rowCount>0) return true;	
		else return false;
	}
	//UsersDto에 id, pwd, email이 있다.
	public boolean insert(UsersDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();

			String sql = "insert into users "
					+ " (id, pwd, email, regdate) "
					+ " values(?,?,?,sysdate)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPwd());
			pstmt.setString(3, dto.getEmail());
			pstmt.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		return true;
	}
	
}
