<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

String id = (String)session.getAttribute("id");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All New Seoul Reviewer</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

</head>
<body>
	<h>시작하기</h>
	<a href="${pageContext.request.contextPath }/users/loginform.jsp">로그인하기</a>
	<a href="${pageContext.request.contextPath }/review/list.jsp">리뷰 목록</a>
	<a href="${pageContext.request.contextPath }/claim/list.jsp">사장님들 쉼터</a>
	<a href="${pageContext.request.contextPath }/arguement/list.jsp">관리자 공간</a>
	
	<% if(id!=null){%>
		<a href="${pageContext.request.contextPath }/users/private/info.jsp"><strong><%=id %></strong></a>님 로그인 중...
		<a href="${pageContext.request.contextPath }/users/logout.jsp">로그아웃</a>
	<%} else {%>
		<a href="${pageContext.request.contextPath }/users/loginform.jsp">로그인하기</a>
	<%} %>

</body>
</html>