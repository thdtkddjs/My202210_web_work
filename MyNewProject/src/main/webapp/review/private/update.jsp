
<%@page import="review.dao.ReviewDao"%>
<%@page import="review.dto.ReviewDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String str=null;
	int num=Integer.parseInt(request.getParameter("num"));
	String title=request.getParameter("title");
	String content=request.getParameter("content");
	
	ReviewDto dto=new ReviewDto();
	dto.setNum(num);
	dto.setTitle(title);
	dto.setContent(content);
	
	boolean isSuc = ReviewDao.getInstance().update(dto);
	if(isSuc) str="갱신 성공";
	else str="갱신 실패...";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/private/update.jsp</title>
</head>
<body>
	<script>
		alert("<%=str%>")
		location.href="${pageContext.request.contextPath }/review/detail.jsp?num=<%=dto.getNum()%>";
	</script>
</body>
</html>