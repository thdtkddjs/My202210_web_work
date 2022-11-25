<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<ul class="nav justify-content-end">
  <li class="nav-item">
    <a class="nav-link" href="javascript:alertme()">원작자</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="javascript:alertyou()">조력자</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="javascript:alertbootstraps()">Special Thanks</a>
  </li>
  <li class="nav-item">
    <a class="nav-link disabled"></a>
  </li>
</ul>
<div class="container text-end">
	<h3>2022-11-25</h3>
</div>
<script>
	function alertme(){
		alert("Amor fati");
	}
	function alertyou(){
		alert("I like you");
	}
	function alertbootstraps(){
		alert("I love this site")
		confirm("Shall we?");
		location.href="https://getbootstrap.com/";
	}

</script>