<%@page import="test.member.dto.MemberDto"%>
<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
/*
1. Get으로 전달되는 회원의 번호를 읽어온다.
2. MemberDao 객체로 회원 한명의 정보를 얻어온다.
3. 수정할 회원의 정보를 수정폼에 입력하여 출력하고, DB를 업데이트한다.
*/
//1.
int num=Integer.parseInt(request.getParameter("num"));
//2.
MemberDao dao=MemberDao.getInstance();
MemberDto dto=dao.getData(num);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/updateform.jsp</title>
</head>
<body>
<div>
	<h1>회원 정보 수정 폼</h1>
	<form action="update.jsp" method="post">
		<!-- 
		diable된 input 요소는 폼을 제출했을 때 전송이 안되므로 
		type이 hidden인 요소를 이용해서 회원의 번호가 폼을 제출했을 때 전송되도록 해준다.
		-->
		
		<input type="hidden" name="num" value="<%=num %>" />
		<div>
			<label for="num">번호</label>
			<input type="text" id="num" value="<%=num%>" disabled/>
		</div>
		<div>
			<label for="name">이름</label>
			<input type="text" name="name" id="name" value="<%=dto.getName()%>"/>
		</div>
		<div>
			<label for="addr">주소</label>
			<input type="text" name="addr" id="addr" value="<%=dto.getAddr()%>"/>
		</div>
		<button type="submit">수정확인</button>
		<button type="reset">취소</button>
	</form>
</div>
</body>
</html>