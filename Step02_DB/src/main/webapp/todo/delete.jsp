<%@page import="test.todo.dao.TodoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int num = Integer.parseInt(request.getParameter("num"));
String str="불명";
TodoDao dao=TodoDao.getInstance();
boolean isSuc= dao.delete(num);
if (isSuc) str="삭제 성공!";
else str = "삭제 실패...";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
	alert("<%=str%>")
	location.href="${pageContext.request.contextPath }/todo/list.jsp"
</script>
<%-- footer.jsp를 호출하여 페이지에 포함시킨다. --%>
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>