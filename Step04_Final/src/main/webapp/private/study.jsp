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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>
<jsp:include page="/include/navbar.jsp">
		<jsp:param value="study" name="thisPage"/>
</jsp:include>
	<div class="container">
		<h1>공부 페이지입니다.</h1>
		<p><%=id %>님 열심히 공부해요!</p>
		<a href="../index.jsp">돌아가기</a>
	</div>
<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>