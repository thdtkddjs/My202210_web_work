<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String id=(String)session.getAttribute("id");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/private/study.jsp</title>
</head>
<body>
	<h1>공부 페이지입니다.</h1>
	<p><%=id %>님 열심히 공부를 해요!</p>
	
	<a href="../index.jsp">돌아가기</a>
</body>
</html>