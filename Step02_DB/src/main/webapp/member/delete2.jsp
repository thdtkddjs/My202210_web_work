<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%
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
<title>/member/delete2.jsp</title>
</head>
<body>
	<script>
		alert("<%=str%>")
		//javascript를 활용한 페이지 이동(웹 브라우저가 새로운 경로로 요청을 다시 해야한다.)
		location.href="${pageContext.request.contextPath }/member/list.jsp"
	</script>
</body>
</html>