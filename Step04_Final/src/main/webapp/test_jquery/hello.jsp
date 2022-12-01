<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test_jquery/hello.jsp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<body>
	<h3>제에에에목</h3>
	<p id="one">아무것도 아님</p>
	<p id="two">이것도 아무것도 아님</p>
	<div>1</div>
	<div>2</div>
	<div>3</div>
	<div>4</div>
	<div>5</div>
	<input type="text" id="inputMsg" />
	<button id="sendBtn">전송</button>
	<script>
		//위의 모든 div의 innerText를 김구라로 바꾸려면?
				
		const div=document.querySelectorAll("div")
		for(let i=0;i<div.length;i++){
			div[i].innerText="김구라";
		}
		//전송 버튼을 눌렀을 때 실행할 함수 등록
		$("sendBtn").on("click", function(){
			alert("전송합니다");
		});
		
		
		/*
		
		$("선택자").action1().action2()...와 같은 형태로 
		jquery가 사용된다.
		
		$()함수는 jquery의 기능이 추가된 배열을 리턴한다.
		
		$()함수가 리턴하는 배열에는 선택지에 부합하는 문서 객체
		의 참조값이 들어있다.              (div, p, input, body)
		
		$().action()처럼 특정 동작을 하면 $()함수가 리턴한 배열 안에
		들어있는 모든 문서 객체에 동작이 적용된다.
		
		$()action1().action2()처럼 chain 형식의 동작은 가능할때도 있고
		불가능할때도 있다.
		만약 어떤 동작이 무언가를 읽어오는 동작이라면 chain 형태 동작이 불가능하다.
		
		*/
		
		$("#one").text("김구라").css("color", "blue");
		
		$("#two").text("송상언").css("fonsize", "20px").css("background-color", "yellow");
		
		$("div").css("color","pink");
		
		$("#sendBtn").on("click", function(){
			const msg=$("#inputMsg").val;
			alert(msg+"를 전송합니다.");
		});
	</script>
</body>
</html>