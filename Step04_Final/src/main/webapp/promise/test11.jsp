<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/promise/test11.jsp</title>
</head>
<body>
	<input type="text" name="msg" id="msg" placeholder="메시지 입력..." />
	<button id="sendBtn">전송</button>
	<button id="sensBtn2">전송2</button>
	<script src="${pageContext.request.contextPath }/js/gura_util.js"></script>
	<script>
		/*
		input요소에 문자열을 입력하고 전송버튼을 누르면
		입력한 문자열이 send.jsp 페이지로 전송되게한다.
		단, 페이지 전환 없이
		*/
		
		document.querySelector("#sendBtn2").addEventListener("click",function{
			/*
			ajaxInputPromise(요청주소, input 요소의 참조값)
			- 해당 input요소에 입력한 문자열이 요청주소로 자동전송
			- ajaxInpuPromise 함수는 fetch함수가 리턴한
			Promise이므로 fetch함수의 사용법과 동일하다.
			*/
			ajaxInputPromise("send2.jsp", document.querySelect("#msg"))
			.then(function(response){
				return response.json();
			})
			.then(function(date){
				console.log(date);
			});
		});
		
		document.querySelector("#sendBtn").addEventListener("click",function(){
			let msg=document.querySelector("#msg").value;
			fetch("send2.jsp?msg="+msg)
			.then(function(response){
				console.log(response)
				return response.json();
			})
			.then(function(data){
				console.log(data);
				console.log(data.isSuccess)
			})
		})
	</script>
</body>
</html>