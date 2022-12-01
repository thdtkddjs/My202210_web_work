<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h>로그인 페이지</h>
	<form action="login.jsp" method="post">
		<div>
			<label for="id">아이디</label>
			<input type="text" name="id" id="id" />
		</div>
		<div>
			<label for="pwd">비밀번호</label>
			<input type="text" name="pwd" id="pwd" />
		</div>	
		<button type="submit">로그인</button>
	</form>
	<a href="${pageContext.request.contextPath }/users/loginform_admin.jsp">비밀통로</a>
</body>
</html>