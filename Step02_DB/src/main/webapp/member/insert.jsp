<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
	1. 폼 전송되는 회원의 이름과 주소를 읽어온다.
	2. memberdao에 memberdto를 전달하면
	   db에 저장을 하고 작업 성공여부를 리턴하는 
	   insert() 메소드를 만든다.
	   회원 번호는 시퀀스를 이용한다.
	3. 위에 추출한 회원의 이름과 주소를 memberdto 객체에 담는다.
	4. memberdao 객체로 회원 정보를 db에 입력한다.
	5. 작업의 성공 여부를 클라이언트에게 응답한다.
	*/
request.setCharacterEncoding("utf-8");
String str="불명";
String name=request.getParameter("name");
String addr=request.getParameter("addr");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/insert.jsp</title>
</head>
<body>
<p>입력된 name: <%=name %></p>
<p>입력된 addr: <%=addr %></p>
<%

MemberDto dto=new MemberDto();
dto.setName(name);
dto.setAddr(addr);

MemberDao a=MemberDao.getInstance();
boolean isSuccess=a.insert(dto);

if (isSuccess==true){
	str="작업 성공!";
}
else str="작업 실패...";
%>
<p><%=str %></p>
<a href="${pageContext.request.contextPath }/index.jsp">초기 화면으로 돌아가기</a>
</body>
</html>