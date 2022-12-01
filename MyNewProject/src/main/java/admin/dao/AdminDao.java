package admin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import admin.dto.AdminDto;
import test.util.DbcpBean;

public class AdminDao {
	//자신의 참조값을 저장할 static 필드
	private static AdminDao dao;
	//외부에서 객체를 생성하지 못하도록 
	//생성자의 접근지정자를 private로 한다.
	private AdminDao() {}
	//자신의 참조값을 리턴하는 static 메소드
	public static AdminDao getInstance() {
		if(dao==null) {
			dao=new AdminDao();
		}
		return dao;
	}
	
	public boolean Confirm(String id, String pwd) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();

			String sql = "select regdate"
					+ " from admin_user"
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
	
	public boolean insert(AdminDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();

			String sql = "insert into Admin_User"
					+ " (num, name, email, id, pwd, sal, rank, regdate)"
					+ " values(Admin_User_seq.nextval, ?, ?, ?, ?, 0, ?, sysdate)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getEmail());
			pstmt.setString(3, dto.getId());
			pstmt.setString(4, dto.getPwd());
			pstmt.setInt(5, dto.getRank());
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
		if (rowCount > 0) {
			return true;
		} else
			return false;
	}
}
