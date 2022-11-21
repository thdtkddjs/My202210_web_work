<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id=(String)session.getAttribute("id");
	String pwd=(String)session.getAttribute("pwd");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1><%=id %>님의 정보를 수정합니다.</h1>
	<div>
	<form action="update.jsp">
		<input type="hidden" name="id" value="<%=id%>"/>
		<input type="hidden" name="pwd" value="<%=pwd%>" />
		<div>
			<label for="email">email</label>
			<input type="text" name="email" id="email" />
		</div>
		<div>
			<label for="profile">프로필</label>
			<input type="text" name="profile" id="profile" />
		</div>
		<div>
			<label for="regdate">가입 날짜</label>
			<input type="text" name="regdate" id="regdate"/>
		</div>
		<button class="btn btn-primary" type="submit">수정하기</button>
	</form>
	</div>
</body>
</html>