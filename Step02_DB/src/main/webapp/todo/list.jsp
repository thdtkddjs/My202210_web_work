<%@page import="test.todo.dto.TodoDto"%>
<%@page import="java.util.List"%>
<%@page import="test.todo.dao.TodoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	TodoDao dao=TodoDao.getInstance();

	List<TodoDto> list = dao.getList();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/list.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>
<jsp:include page="/include/navbar.jsp">
	<jsp:param value="todo" name="thisPage"/>
</jsp:include>

	<h1>할일 목록</h1>
	<table class="table table-hover table-striped">
	<thead class="table-primary">
		<tr>
			<th>번호</th>
			<th>내용</th>
			<th>날짜</th>
			<th>삭제</th>
			<th>수정</th>
		</tr>
	</thead>
	<tbody class="table">
	<%for(TodoDto tmp:list) {%>
		<tr>
			<td><%=tmp.getNum() %></td>
			<td><%=tmp.getContent() %></td>
			<td><%=tmp.getRegdate() %></td>
			<td><a href="delete.jsp?num=<%=tmp.getNum()%>"><button type="button" class="btn btn-danger"> X</button></a></td>
			<td><a href="updateform.jsp?num=<%=tmp.getNum()%>"><button type="button" class="btn btn-primary">수정</button></a></td>
		</tr>
	<%} %>
	</tbody>
	</table>
	
	<a href="${pageContext.request.contextPath }/todo/insertform.jsp"><button type="button" class="btn btn-dark">추가</button></a>
	</div>
</body>
</html>