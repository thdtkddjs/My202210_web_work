<%@page import="test.todo.dto.TodoDto"%>
<%@page import="test.todo.dao.TodoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

request.setCharacterEncoding("utf-8");
int num = Integer.parseInt(request.getParameter("num"));
String content=request.getParameter("content");
String regdate=request.getParameter("regdate");
String str="불명";

TodoDao dao=TodoDao.getInstance();
TodoDto dto=new TodoDto(num, content, regdate);
boolean isSuc=dao.update(dto);
if (isSuc) str="갱신 성공!";
else str="갱신 실패...";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
	alert("<%=regdate%> 에 <%=content%> 을 저장한 것을 <%=num%> 에 입력하는것을 <%=str%> 했습니다.")
	location.href="${pageContext.request.contextPath }/todo/list.jsp"
</script>
</body>
</html>