<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String pwd=(String)session.getAttribute("pwd");
	String id=(String)session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/pwd_updateform.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
	<form action="pwd_update.jsp" id="myForm">
		<input type="hidden" name="cpwd" value="<%=pwd %>" />
		<input type="hidden" name="id" value="<%=id %>" />
		<div>
			<label for="pwd">현재 비밀번호</label>
			<input type="password" name="pwd" id="pwd"/>
		</div>
		<div>
			<label for="upwd">변경할 비밀번호</label>
			<input type="password" name="upwd" id="upwd" />
		</div>
		<div>
			<label for="uupwd">변경할 비밀번호(확인)</label>
			<input type="password" name="uupwd" id="uupwd"/>
		</div>
		<button class="btn btn-primary" type="submit">수정하기</button>
		<button class="btn btn-warning" type="reset">리셋</button>
	</form>
	</div>
	<script>
		//폼에 submit이벤트가 일어났을때 실행할 함수 등록
		document.querySelector("#myForm").addEventListener("submit",function(evnet){
			let pwd1=document.querySelector("#upwd").value;
			let pwd2=document.querySelector("#uupwd").value;
			if(pwd1!=pwd2){
				alert("비밀번호를 확인 하세요!");
				event.preventDefault();
			}
		})
	
	</script>
</body>
</html>