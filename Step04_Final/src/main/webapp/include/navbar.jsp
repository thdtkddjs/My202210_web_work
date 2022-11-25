<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

//이 navbar.jsp가 어디에 include 되었는지 판정한다.
String thisPage=request.getParameter("thisPage");
String id=(String)session.getAttribute("id");
%>    

	<div class="container">
			<nav class="navbar navbar-expand-lg bg-light fw-bold">
			<div class="container-fluid">
			<a class="navbar-brand" href="${pageContext.request.contextPath }/index.jsp">Navbar</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">
				<%if(id!=null){ %>
				<li class="nav-item">
					<a class="nav-link <%=thisPage.equals("study") ? "active" : "" %>"  href="${pageContext.request.contextPath }/private/study.jsp">회원전용공간(공부)</a>
				</li>
				<li class="nav-item">
					<a class="nav-link <%=thisPage.equals("game") ? "active" : "" %>"  href="${pageContext.request.contextPath }/private/game.jsp">회원전용공간(게임)</a>
				</li>
				<%}else{ %>
				<li class="nav-item">
					<a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath }/users/signup_form.jsp">회원가입</a>
				</li>
				<%} %>
				<li class="nav-item">
					<a class="nav-link <%=thisPage.equals("file") ? "active" : "" %>"  href="${pageContext.request.contextPath }/file/list.jsp">자료실</a>
				</li>
				<li class="nav-item">
					<a class="nav-link <%=thisPage.equals("cafe") ? "active" : "" %>"  href="${pageContext.request.contextPath }/cafe/list.jsp">글 목록보기</a>
				</li>
			</ul>
			<% if(id!=null){%>
					<a class="nav-link" href="${pageContext.request.contextPath }/users/private/info.jsp"><strong><%=id %></strong></a>님 로그인 중...
					<a class="nav-link" href="${pageContext.request.contextPath }/users/logout.jsp">로그아웃</a>
			<%} else {%>
				<a class="nav-link" href="${pageContext.request.contextPath }/users/loginform.jsp">로그인하기</a>
			<%} %>
			</div>
			</div>
		</nav>
	</div>