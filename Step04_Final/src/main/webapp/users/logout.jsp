<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id=(String)session.getAttribute("id");
session.removeAttribute("id");
%>
<title>/users/logout.jsp</title>
	<script>
		alert("<%=id%>님이 로그아웃 되었습니다.")
		location.href="${pageContext.request.contextPath }/index.jsp"
	</script>
