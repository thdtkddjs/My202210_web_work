<%@page import="review.dao.ReviewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String str=null;
	String id=(String)session.getAttribute("id");
	String id2=request.getParameter("id2");
	int num=Integer.parseInt(request.getParameter("num2"));
	
	if(!id.equals(id2)){
		ReviewDao.getInstance().addLikesCount(num);
		str="좋아요!";
	} else{
		str="자추는 금지입니다!";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/review/private/likeup.sjp</title>
</head>
<body>
	<p><%=str %></p>
	<a href="../detail.jsp?num=<%=num%>">돌아가기</a>
</body>
</html>