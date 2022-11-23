<%@page import="java.io.File"%>
<%@page import="test.file.dto.FileDto"%>
<%@page import="test.file.dao.FileDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1.삭제할 파일 번호를 읽어온다.
	int num=Integer.parseInt(request.getParameter("num"));
	//2.해당하는 파일의 정보를 DB에서 읽어온다.
	FileDto dto=FileDao.getInstance().getData(num);
	
	//삭제 작업을 하기 전에 로그인 여부를 확인한다.
	String id=(String)session.getAttribute("id");
	if(!dto.getWriter().equals(id)){
		response.sendError(HttpServletResponse.SC_FORBIDDEN, "다른 사람의 파일을 소중히합시다.");
		return;
	}
	//3.파일 시스템에서 삭제한다.
	String path=application.getRealPath("/upload")+File.separator+dto.getSaveFileName();
	//얻어온 파일의 전체 경로를 통해 해당하는 File 객체 생성 후 파일을 삭제하기
	File f=new File(path);
	f.delete();
	//4.DB에서 파일의 정보를 삭제한다.
	FileDao.getInstance().delete(num);	
	//5.응답하기
	String cpath=request.getContextPath();
	response.sendRedirect(cpath+"/file/list.jsp");//파일 목록보기로 리다일렉트
%>