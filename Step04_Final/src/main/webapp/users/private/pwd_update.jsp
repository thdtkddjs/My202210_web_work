<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String pwd=request.getParameter("pwd");
	String cpwd=request.getParameter("cpwd");
	String upwd=request.getParameter("upwd");
	String uupwd=request.getParameter("uupwd");
	String id=request.getParameter("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/pwd_update.jsp</title>
</head>
<body>
	<%if(!pwd.equals(cpwd)){ %>
		<p>현재 비밀번호를 다르게 입력하셨습니다.</p>
	<% 
	session.setAttribute("pwd", pwd);
	session.setAttribute("id", id);	%>
		<a href="../private/pwd_updateform.jsp">돌아가기</a>
	<%}else if(!upwd.equals(uupwd)){ %>
		<p>변경할 비밀번호를 다시 확인해주세요.</p>
	<%
	session.setAttribute("pwd", pwd);
	session.setAttribute("id", id);	%>
		<a href="../private/pwd_updateform.jsp">돌아가기</a>
	<%}else{ %>
		<p>수정 작업 진행중...</p>
		<%
			String str=null;
		
			boolean isSuc=UsersDao.getInstance().pwd_Update(id, upwd);
			
			if(isSuc) str="수정 성공!";
			else str="수정 실패...";
		%>
		<p><%=str %></p>
		<a href="${pageContext.request.contextPath }/index.jsp">돌아가기</a>
	<%} %>
</body>
</html>