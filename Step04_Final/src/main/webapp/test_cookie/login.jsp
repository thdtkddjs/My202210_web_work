<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//가상의 로그인 페이지
	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	
	String isSave=request.getParameter("isSave");
	
	if(isSave !=null){
		//아이디 비밀번호를 쿠키로 응답하고 1주일 동안 유지되도록 설정
		Cookie cook1=new Cookie("savedId", id);
		Cookie cook2=new Cookie("savedPwd", pwd);
		cook1.setMaxAge(60*24*7);
		cook2.setMaxAge(60*24*7);
		response.addCookie(cook1);
		response.addCookie(cook2);
	}else{
		//쿠키에 저장된 값을 삭제(초기화 하는 개념에 가까움)
		Cookie cook1=new Cookie("savedId", "");
		Cookie cook2=new Cookie("savedPwd", null);
		cook1.setMaxAge(60*24*7);
		cook2.setMaxAge(60*24*7);
		response.addCookie(cook1);
		response.addCookie(cook2);
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test_cookie/login.jsp</title>
</head>
<body>
	<p><%=id %>님이 로그인 되었습니다.</p>
	<a href="cookie_form3.jsp">다시 테스트</a>
</body>
</html>