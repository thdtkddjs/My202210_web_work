<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
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
<title>/users/loginform.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h1>로그인 페이지</h1>
		<form action="login.jsp" method="post">
			<!-- 로그인 성공 후 갈 장소에 대한 정보를 전달 -->
			<input type="hidden" name="url" value="<%=url %>" />
			<div>
				<label class="form-label" for="id">ID</label>
				<input class="form-control" type="text" name="id" id="id" />
			</div>
			<div>
				<label class="form-label" for="pwd">패스워드</label>
				<input class="form-control" type="password" name="pwd" id="pwd" />
			</div>
			<button class="btn btn-primary" type="submit">로그인</button>		
		</form>
	</div>
</body>
</html>