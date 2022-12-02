<%@page import="review.dao.ReviewDao"%>
<%@page import="review.dto.ReviewDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String str=null;
	String title=request.getParameter("title");
	String content=request.getParameter("content");
	String id=(String)session.getAttribute("id");
	
	ReviewDto dto = new ReviewDto();
	dto.setWriter(id);
	dto.setTitle(title);
	dto.setContent(content);
	
	boolean isSuc = ReviewDao.getInstance().insert(dto);
	
	if (isSuc) str="입력 성공";
	else str="입력 실패...";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/review/private/insert.jsp</title>
</head>
<body>
	<p><%=str %></p>
	<a href="${pageContext.request.contextPath }/review/list.jsp">돌아가기</a>
</body>
</html>