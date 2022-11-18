<%@page import="test.todo.dto.TodoDto"%>
<%@page import="test.todo.dao.TodoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8");

String content=request.getParameter("content");
String regdate=request.getParameter("regdate");
String str="불명";

TodoDao dao=TodoDao.getInstance();
TodoDto dto=new TodoDto(1, content, regdate);
boolean isSuc=dao.insert(dto);
if (isSuc) str="추가 성공!";
else str = "추가 실패...";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
	alert("날짜: <%=regdate%> 내용:<%=content%> <%=str%>")
	location.href="${pageContext.request.contextPath }/todo/list.jsp"
</script>
<%-- footer.jsp를 호출하여 페이지에 포함시킨다. --%>
	<jsp:include page="/include/footer.jsp"></jsp:include>

</body>
</html>