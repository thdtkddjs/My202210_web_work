<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

String str=null;
String id= request.getParameter("id");
String pwd= request.getParameter("pwd");
String email= request.getParameter("email");

UsersDto dto=new UsersDto();
dto.setId(id);
dto.setPwd(pwd);
dto.setEmail(email);

UsersDao dao=UsersDao.getInstance();
boolean isSuc=dao.insert(dto);

if (isSuc) str="가입 성공!";
else str="가입 실패...";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul>
		<li>입력된 ID는 <%=id %></li>
		<li>입력된 PWD는 <%=pwd %></li>
		<li>입력된 Email은 <%=email %></li>
	</ul>
	<div><%=str %></div>
	<a href="../index.jsp">돌아가기</a>
</body>
</html>