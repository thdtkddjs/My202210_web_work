<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String str=null;
	
	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	String email=request.getParameter("email");
	String profile=request.getParameter("profile");
	String regdate=request.getParameter("regdate");
	
	UsersDto dto=new UsersDto(id,pwd,email,profile,regdate);
	boolean isSuc = UsersDao.getInstance().Update(dto);
	
	if(isSuc) str="수정 성공!";
	else str="수정 실패...";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/update.jsp</title>
</head>
<body>
	<p><%=str %></p>
	<a href="${pageContext.request.contextPath }/index.jsp">인덱스로 돌아가기</a>
</body>
</html>