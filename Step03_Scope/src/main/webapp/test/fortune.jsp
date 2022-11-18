<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//request scope에 저장된 값을 읽어와서
	//원래 타입으로 캐스팅
	String fortuneToday= (String)request.getAttribute("fortuneToday");
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/fortune.jsp</title>
</head>
<body>
	<p>오늘의 운세 : <strong><%=fortuneToday %></strong></p>
</body>
</html>