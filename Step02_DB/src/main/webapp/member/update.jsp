<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/*
1.전송될 회원의 정보를 읽어온다.
2.memberdao 객체를 이용해 db에 업데이트한다.
3.응답한다.
*/
//1.
request.setCharacterEncoding("utf-8");
int num=Integer.parseInt(request.getParameter("num"));
String name=request.getParameter("name");
String addr=request.getParameter("addr");
String str="불명";
//2.
MemberDto dto=new MemberDto(num, name, addr);
MemberDao a=MemberDao.getInstance();
boolean isUpdate=a.update(dto);
if(isUpdate){
	str="수정 완료";
} else str="수정 실패";
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/update.jsp</title>
</head>
<body>
	<%if (isUpdate){%>
		<script>
			alert("<%=num%> 번 회원의 정보를 수정했습니다.");
			location.href="list.jsp"
		</script>
	<%} else{ %>
		<script>
			alert("<%=str%>");
			location.href="updateform.jsp?num=<%=num%>";
		</script>
	<%} %>
</body>
</html>