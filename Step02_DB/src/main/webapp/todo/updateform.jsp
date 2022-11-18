<%@page import="test.todo.dto.TodoDto"%>
<%@page import="test.todo.dao.TodoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
TodoDao dao=TodoDao.getInstance();
int num=Integer.parseInt(request.getParameter("num"));
TodoDto dto=dao.getData(num);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	<h1>회원 정보 수정 폼</h1>
	<form action="update.jsp" method="post">
		<input type="hidden" name="num" value="<%=num %>" />
		<div>
			<label for="num">번호</label>
			<input type="text" id="num" value="<%=num%>" disabled/>
		</div>
		<div>
			<label for="name">내용</label>
			<input type="text" name="content" id="content" value="<%=dto.getContent()%>"/>
		</div>
		<div>
			<label for="addr">날짜</label>
			<input type="text" name="regdate" id="regdate" value="<%=dto.getRegdate()%>"/>
		</div>
		<button type="submit">수정확인</button>
		<button type="reset">취소</button>
	</form>
</div>
</body>
</html>