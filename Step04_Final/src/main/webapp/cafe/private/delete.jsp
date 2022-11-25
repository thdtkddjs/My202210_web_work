<%@page import="test.cafe.dao.CafeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String str=null;
	int num=Integer.parseInt(request.getParameter("num"));
	
	String id=(String)session.getAttribute("id");
	String writer=CafeDao.getInstance().getData(num).getWriter();
	
	if(!writer.equals(id)){
		response.sendError(HttpServletResponse.SC_FORBIDDEN,"남의 글을 소중히합시다." );
		return;
	}
	
	boolean isSuc=CafeDao.getInstance().delete(num);
	
	if(isSuc) {
		str="삭제 성공";
	}else {
		str="삭제 실패...";
	}
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
		location.href="${pageContext.request.contextPath }/cafe/list.jsp";
	</script>
</body>
</html>