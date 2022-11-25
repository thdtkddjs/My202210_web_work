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
	
	public boolean update(CafeDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();

			String sql = "update board_cafe"
					+ " set title=?, content=?"
					+ " where num=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setInt(3, dto.getNum());
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
	
	public boolean delete(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();

			String sql = "delete from board_cafe"
					+ " where num = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
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
	
	//글의 조회수를 올리는 메소드
	public boolean addViewCount(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();

			String sql = "update board_cafe"
					+ " set viewcount=viewcount+1"
					+ " where num=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
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
	
	public int getCount() {
		//필요한 객체를 미리 생성해둔다.
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		try {
			conn = new DbcpBean().getConn();

			String sql = "select max(rownum) as num"
					+ " from board_cafe";

			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				count=rs.getInt("num");
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
		return count;
	}

	public List<CafeDto> getList(CafeDto dto){
		List<CafeDto> list=new ArrayList<>();
		//필요한 객체를 미리 생성해둔다.
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = new DbcpBean().getConn();

			String sql = "select *"
					+ " from"
					+ "	(select result1.*, rownum as rnum"
					+ "	from "
					+ "		(select num, writer, title, content, viewCount, regdate"
					+ "		from board_cafe"
					+ "		order by num desc) result1)"
					+ " where rnum between ? and ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getStartRowNum());
			pstmt.setInt(2, dto.getEndRowNum());

			rs = pstmt.executeQuery();
			while (rs.next()) {
				CafeDto tmp=new CafeDto();
				tmp.setNum(rs.getInt("num"));
				tmp.setWriter(rs.getString("writer"));
				tmp.setTitle(rs.getString("title"));
				tmp.setContent(rs.getString("content"));
				tmp.setViewCount(rs.getInt("viewCount"));
				tmp.setRegdate(rs.getString("regdate"));
				list.add(tmp);
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
	
	   //글 하나의 정보를 리턴해주는 메소드
	   public CafeDto getData(int num) {
	      CafeDto dto=null;
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      try {
	         conn = new DbcpBean().getConn();
	         //select 문의 뼈대 구성하기
	         String sql = "SELECT writer, title, content, viewCount, regdate"
	               + " FROM board_cafe"
	               + " WHERE num=?";
	         pstmt = conn.prepareStatement(sql);
	         //? 에 값 바인딩 할게 있으면 하기
	         pstmt.setInt(1, num);
	         //sql 문 수행하고 ResultSet 객체 얻어내기
	         rs = pstmt.executeQuery();
	         if (rs.next()) {
	            dto=new CafeDto();
	            dto.setNum(num);
	            dto.setWriter(rs.getString("writer"));
	            dto.setTitle(rs.getString("title"));
	            dto.setContent(rs.getString("content"));
	            dto.setViewCount(rs.getInt("viewCount"));
	            dto.setRegdate(rs.getString("regdate"));
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
	      return dto;      
	   }
	   
}