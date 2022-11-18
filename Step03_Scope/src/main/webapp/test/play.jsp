<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/play.jsp</title>
</head>
<body>
	<%
	/*
	HttpSession 객체에 nick이라는 키값으로 저장된 값이 있는지
   (session scope)
	읽어와본다. 없다면 null이 리턴된다.
	*/
		String nick=(String)session.getAttribute("nick");
		//60 초동안 다시 요청을 해오지 않으면 자동으로 삭제되도록 설정
		session.setMaxInactiveInterval(60);
	%>
	<h3>노는 페이지입니다.</h3>
	<%if(nick==null){ %>
		<p>session 영역에 nick 키값으로 저장된 값이 없습니다.</p>
	<%}else { %>
		<p>
			<strong><%=nick %></strong>님이 놀러오셨네요? 신나게 놀다가세요!
			<a href="logout.jsp">세션에 저장된 nick 삭제(로그아웃)</a>
		</p>
	<%} %>
</body>
</html>