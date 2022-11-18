package test.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.member.dto.MemberDto;
import test.util.DbcpBean;

public class MemberDao {
	//자신의 참조값을 저장할 static 필드
	private static MemberDao dao;
	
	//외부에서 객체를 생성하지 못하도록 
	//생성자의 접근지정자를 private로 한다.
	private MemberDao() {}
	
	//자신의 참조값을 리턴하는 static 메소드
	public static MemberDao getInstance() {
		//최초로 이루어진 호출이라면 객체를 생성해서 static 필드에 담아둔다.
		if(dao==null) {
			dao=new MemberDao();
		}
		//필드에 있는 자신의 참조값을 리턴
		return dao;
	}
	//insert 하는 method
	public boolean insert(MemberDto dto) {
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		int rowCount=0;
		try {
			conn=new DbcpBean().getConn();
			
			String sql="insert into member"
					+ " values(member_seq.nextval,?,?) ";
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getAddr());
			rowCount=pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception e) {}
		}
		if(rowCount>0) {
			return true;
		} else return false;
	}
	//삭제하는 method
	public boolean delete(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();

			String sql = "delete from member "
					+ "where num = ?";
			
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeQuery();
			rowCount = pstmt.executeUpdate();
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
		if (rowCount > 0) {
		} 
			return true;
	}
	//update 하기 전에 대상이 되는 열의 정보를 얻어내기
	public MemberDto getData(int num) {
		//필요한 객체를 미리 생성해둔다.
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberDto dto=null;
		try {
			conn = new DbcpBean().getConn();

			String sql = "select name, addr"
					+ " from member"
					+ " where num=? ";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				//MemberDto 객체를 생성하고, 회원 한명의 정보를 담는다.
				dto=new MemberDto();
				dto.setNum(num);
				dto.setName(rs.getString("name"));
				dto.setAddr(rs.getString("addr"));
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
	
	public boolean update(MemberDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();

			String sql = "update member"
					+ " set name=?, addr=?"
					+ " where num=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getAddr());
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
	
	//전체 회원 목록을 리턴하는 메소드
	public List<MemberDto> getList(){
		List<MemberDto> list = new ArrayList<>();
		
		//필요한 객체를 미리 생성해둔다.
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			conn=new DbcpBean().getConn();
			
			String sql="select num,name,addr"
					+ " from member "
					+ " order by num asc";
			
			pstmt=conn.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			while(rs.next()) {
				MemberDto dto=new MemberDto();
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setAddr(rs.getString("addr"));
				
				list.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception e) {}
		}
		
		return list;
	}
}
