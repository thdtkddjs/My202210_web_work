<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 회원 한명의 정보 삭제하기(몇 번을 삭제해야하지?)
	//답: 그 열의 번호를 Get 방식 파라미터로 전달시킨 후,
	//파라미터를 읽어낸다.
	int num = Integer.parseInt(request.getParameter("num"));
	String str="불명";
	//2. 응답하기(어떤 응답?)
	MemberDao dao=MemberDao.getInstance();
	boolean isDelete=dao.delete(num);
	if(isDelete){
		str="삭제 성공!";
	}else str="삭제 실패...";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/selete.jsp</title>
</head>
<body>
<p>삭제된 번호는 <%=num %>입니다. <a href="list.jsp">돌아가기</a></p>
<p><%=str %></p>
</body>
</html>