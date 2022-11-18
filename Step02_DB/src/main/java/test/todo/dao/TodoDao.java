package test.todo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.todo.dto.TodoDto;
import test.util.DbcpBean;

public class TodoDao {
	public static TodoDao dao;
	
	private TodoDao() {}
	
	public static TodoDao getInstance(){
		if(dao==null) {
			dao=new TodoDao();
		}
		return dao;
	}
	
	public List<TodoDto> getList(){
		
		List<TodoDto> list=new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();

			String sql = "select num,content,to_char(regdate,'yy.mm.dd') as regdate"
					+ " from todo"
					+ " order by num asc";

			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			while (rs.next()) {
				TodoDto dto=new TodoDto();
				dto.setNum(rs.getInt("num"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));
				
				list.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs!=null) rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		return list;
	}
	
	public TodoDto getData(int num) {
		TodoDto dto=null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();

			String sql = "select content,to_char(regdate,'yy.mm.dd') as regdate"
					+ " from todo"
					+ " where num=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			rs.next();
			dto=new TodoDto(num, rs.getString("content"), rs.getString("regdate"));
			
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
		
		return dto;
	}
	
	public boolean insert(TodoDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();

			String sql = "insert into todo "
					+ " (num, content, regdate)"
					+ " values(todo_seq.nextval, ?, ?)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getContent());
			pstmt.setString(2, dto.getRegdate());
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
	
	public boolean delete(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();

			String sql = "delete from todo"
					+ " where num=?";

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
	
	public boolean update(TodoDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();

			String sql = "update todo"
					+ " set content=?,regdate=?"
					+ " where num=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getContent());
			pstmt.setString(2, dto.getRegdate());
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
	
	
}
