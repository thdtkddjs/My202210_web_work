<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 등록</title>
</head>
<body>
	<form action="signup.jsp" method="post">
		<div>
			<label for="id">아이디</label>
			<input type="text" name="id" id="id"/>
		</div>
		<div>
			<label for="pwd">비밀번호</label>
			<input type="text" name="pwd" id="pwd"/>
		</div>
		<div>
			<label for="name">이름</label>
			<input type="text" name="name" id="name"/>
		</div>
		<div>
			<label for="email">이메일</label>
			<input type="text" name="email" id="email"/>
		</div>
		<div>
			<label for="rank">등급</label>
			<input type="text" name="rank" id="rank"/>
		</div>
		<button type="submit">관리자 계정 생성</button>
	</form>
</body>
</html>