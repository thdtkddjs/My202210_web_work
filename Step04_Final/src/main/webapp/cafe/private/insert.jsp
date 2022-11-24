<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String str=null;
	String title=request.getParameter("title");
	String content=request.getParameter("content");
	String id=(String)session.getAttribute("id");
	
	CafeDto dto = new CafeDto();
	dto.setWriter(id);
	dto.setTitle(title);
	dto.setContent(content);
	
	boolean isSuc = CafeDao.getInstance().insert(dto);
	
	if (isSuc) str="입력 성공";
	else str="입력 실패...";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/private/insert.jsp</title>
</head>
<body>
	<p><%=str %></p>
	<a href="${pageContext.request.contextPath }/cafe/list.jsp">돌아가기</a>
</body>
</html>