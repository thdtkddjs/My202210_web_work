<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//아이디 저장으로 세션에 저장된 ID가 30분 안에 있었는데 확인
	String id=(String)session.getAttribute("id2");
	//get 방식 파라미터 url이라는 이름으로 전달되는 값이 있는지 확인
	String url=request.getParameter("url");
	//만일 넘어오는 값이 없다면
	if(url==null){
		//로그인 후에 인덱스 페이지로 갈 수 있도록 한다.
		String cpath=request.getContextPath();
		url=cpath+"/index.jsp";
	}else{
		
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h>로그인 페이지</h>
	<form action="login.jsp" method="post">
		<input type="hidden" name="url" value="<%=url %>" />
		<div>
			<label for="id">아이디</label>
			<input type="text" name="id" id="id" />
		</div>
		<div>
			<label for="pwd">비밀번호</label>
			<input type="text" name="pwd" id="pwd" />
		</div>	
		<button type="submit">로그인</button>
	</form>
	<a href="${pageContext.request.contextPath }/users/loginform_admin.jsp">비밀통로</a>
</body>
</html>