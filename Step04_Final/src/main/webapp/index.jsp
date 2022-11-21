<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

String id = (String)session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/index.jsp</title>
</head>
<body>
	<div class="container">
		<% if(id!=null){%>
			<p>
				<a href="${pageContext.request.contextPath }/users/private/info.jsp"><strong><%=id %></strong></a>님 로그인 중...
				<a href="${pageContext.request.contextPath }/users/logout.jsp">로그아웃</a>
			</p>
		<%} else {%>
			<a href="${pageContext.request.contextPath }/users/loginform.jsp">로그인하기</a>
		<%} %>
		<h1>인덱스 페이지입니다.</h1>
		<ul>
			<li><a href="${pageContext.request.contextPath }/users/signup_form.jsp">회원가입</a></li>
			<li><a href="${pageContext.request.contextPath }/private/study.jsp">회원전용공간(공부)</a></li>
			<li><a href="${pageContext.request.contextPath }/private/game.jsp">회원전용공간(게임)</a></li>
		</ul>
	</div>


</body>
</html>