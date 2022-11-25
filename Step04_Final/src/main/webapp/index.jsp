<%@page import="test.file.dao.FileDao"%>
<%@page import="test.cafe.dao.CafeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

String id = (String)session.getAttribute("id");

int num1=FileDao.getInstance().getCount();
int num2=CafeDao.getInstance().getCount();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/index.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>
<jsp:include page="/include/navbar.jsp">
	<jsp:param value="index" name="thisPage"/>
</jsp:include>
	<div class="container">
		<div class="card col-12" style="width: 18rem;">
 		 <img src="https://img2.daumcdn.net/thumb/R658x0.q70/?fname=http://t1.daumcdn.net/news/201610/28/itdonga/20161028135202330weix.jpg" class="card-img-top" alt="...">
		 <div class="card-body">
		    <h5 class="card-title">자료실</h5>
    		<p class="card-text">저장된 자료의 갯수 : <%=num1 %> </p>
	    	<a href="/cafe/list.jsp" class="btn btn-primary">보관하러 가기</a>
		  </div>
		</div>	
		<br />
		<div class="card col-12" style="width: 18rem;">
	 	 <img src="https://www.pitman-training.com/media/6311/adobestock_225442477.jpeg" class="card-img-top" alt="...">
		 <div class="card-body">
		    <h5 class="card-title">우리들의 광장</h5>
	    	<p class="card-text">이제까지 쓰인 글의 갯수 : <%=num2 %></p>
	    	<a href="/file/list.jsp" class="btn btn-primary">글 쓰러 가기</a>
		  </div>
		</div>
	</div>
<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>