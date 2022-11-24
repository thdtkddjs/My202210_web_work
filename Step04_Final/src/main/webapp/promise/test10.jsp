<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/promise test.10.jsp</title>
</head>
<body>
	<input type="text" id="msg" placeholder="메시지 입력..." />
	<button id="sendBtn">전송</button>
	<script>
		/*
		input요소에 문자열을 입력하고 전송버튼을 누르면
		입력한 문자열이 send.jsp 페이지로 전송되게한다.
		단, 페이지 전환 없이
		*/
		let result1;
		let result2;
		let result3;
		
		document.querySelector("#sendBtn").addEventListener("click",function(){
			let msg=document.querySelector("#msg").value;
			fetch("send.jsp?msg="+msg)
			.then(function(response){
				return response.text();
			})
			.then(function(data){
				console.log(data);
				result1 = data;
				result2 = JSON.parse(data);
				result3 = JSON.stringify(result2);
			})
		})
	</script>
</body>
</html>