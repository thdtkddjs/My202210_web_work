<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String str=null;
	request.setCharacterEncoding("utf-8");
	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	//입력된 정보로 유효한 데이터가 출력될 경우 로그인 성공으로 판정
	//로그인이 성공한 경우에는 로그인 처리도 한다.
	UsersDao dao=UsersDao.getInstance();
	
	boolean isSuc=dao.getDate(id, pwd);
	if(isSuc) {
		str="로그인 성공!";
		session.setAttribute("id", id);
	}else {
		str="id 혹은 pwd가 다릅니다. 확인 후 재시도 해주세요.";
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>로그인 결과</h1>
	<p><%=str %></p>
	<%if (isSuc) {%>
		<p>환영합니다! <strong><%=id %></strong> 님</p>
	<%} %>
	<a href="../index.jsp">돌아가기</a>
</body>
</html>