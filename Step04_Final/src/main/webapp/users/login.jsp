<%@page import="java.net.URLEncoder"%>
<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//로그인 완료 후 가야할 목적지에 대한 정보
	String url=request.getParameter("url");
	//혹시 실패할 때를 대비한 목적지 정보 역시 준비한다.
	String encodedUrl=URLEncoder.encode(url);
	
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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>
	<h1>로그인 결과</h1>
	<div class="container">
		<p></p>
		<%if (isSuc) {%>
			<p class="alert alert-sucess">
				<%=str %> 
				환영합니다! <strong><%=id %></strong> 님
				<a href="<%=url%>">확인</a>	
			</p>
		<%} else{%>
			<p class="alert alert-danger">
				<%=str %>
			<a href="${pageContext.request.contextPath }/users/loginform.jsp?url=encodedUrl">다시 시도</a>
			</p>
		<%} %>
	</div>
</body>
</html>