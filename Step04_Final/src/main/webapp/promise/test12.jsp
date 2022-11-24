<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/promise/test12.jsp</title>
</head>
<body>
	<h3>ajax form 예제</h3>
	<!-- 본래 form 제출과 동시에 페이지 이동이 되지만
		페이지 이동 없이 파라미터 전달만 되도록 해보자.
	 -->
	<form action="insert.jsp" method="post" id="myForm">
		<input type="text" name="name" placeholder="이름 입력..." />
		<input type="text" name="addr" placeholder="주소 입력..." />
		<button type="submit">추가</button>
	</form>
	<script src="${pageContext.request.contextPath }/js/gura_util.js"></script>
	<script>
		//id가 myForm인 요소에 submit 이벤트를 실행할 함수
		document.querySelector("#myForm").addEventListener("submit",function(){
			//폼 제출을 강제로 막는 메소드
			event.preventDefault();
			//gura_util.js에 있는 함수를 이용해서 ajax 요청을 통해 전송한다.
			ajaxFormPromise(this)
			.then(function(response){
				return response.json();
			})
			.then(function(data){
				console.log(data);
			});
		});
	</script>
</body>
</html>