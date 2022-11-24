<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	List<CafeDto> list=CafeDao.getInstance().getList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/list.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<a href="${pageContext.request.contextPath }/cafe/private/insertform.jsp">새글 작성</a>
		<h3>카페 글 목록입니다.</h3>
		<table class="table">
			<thead class="table table-dark">
				<tr>
					<th>글번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>조회수</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody class="table table-striped">
				<%for(CafeDto tmp:list){ %>
				<tr>
					<th><%=tmp.getNum() %></th>
					<th><%=tmp.getWriter() %></th>
					<th><%=tmp.getTitle() %></th>
					<th><%=tmp.getViewCount() %></th>
					<th><%=tmp.getRegdate() %></th>
				</tr>
				<%} %>
			</tbody>
		</table>
	</div>
</body>
</html>