package test.cafe.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.cafe.dto.CafeDto;
import test.util.DbcpBean;

public class CafeDao {

	private static CafeDao dao;
	/*
	 * static 메소드는 생성자를 호출하지 않고 
	 * 클래스명으로 바로 호출을 하기 떄문에
	 * 
	 * 메소드 호출 전에 무언가 준비 작업을 하고 싶다면
	 * static 블럭 안에서 하면 된다.
	 * 
	 * static 블럭은 해당 클래스를 최초로 사용할 때 한번만 실행되기 떄문에
	 * 초기화 작업을 하기 적당한 블럭이다.
	 */
	static {
		if(dao==null) {
		dao=new CafeDao();
		}
	}
	
	private CafeDao() {}
	
	public static CafeDao getInstance() {
		return dao;
	}
	
	public boolean insert(CafeDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();

			String sql = "insert into board_cafe"
					+ " (num, writer, title, content, viewcount, regdate)"
					+ " values(board_cafe_seq.nextval, ?, ?, ?, 0, sysdate)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
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

	public List<CafeDto> getList(){
		List<CafeDto> list=new ArrayList<>();
		//필요한 객체를 미리 생성해둔다.
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = new DbcpBean().getConn();

			String sql = "select * "
					+ " from board_cafe";

			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				CafeDto dto=new CafeDto();
				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setViewCount(rs.getInt("viewCount"));
				dto.setRegdate(rs.getString("regdate"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		return list;
	}
}