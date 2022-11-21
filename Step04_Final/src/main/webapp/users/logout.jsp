<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id=(String)session.getAttribute("id");
session.removeAttribute("id");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p><strong><%=id %></strong>님이 로그아웃 되었습니다.</p>
	<a href="../index.jsp">돌아가기</a>
</body>
</html>