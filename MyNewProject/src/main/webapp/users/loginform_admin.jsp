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
	<form action="login_admin.jsp" method="post">
		<input type="hidden" name="url" value="<%=url %>" />
		<div>
			<label for="id">아이디</label>
			<input type="text" name="id" id="id" />
		</div>
		<div>
			<label for="pwd">비밀번호</label>
			<input type="text" name="pwd" id="pwd" />
		</div>	
		<div class="form-check">
			<input class="form-check-input" type="checkbox" value="isRemem" name="flexCheckChecked" id="flexCheckChecked" checked>
			<label class="form-check-label" for="flexCheckChecked">
				  아이디 저장
			</label>
		</div>
		<button type="submit">로그인</button>
	</form>
</body>
</html>