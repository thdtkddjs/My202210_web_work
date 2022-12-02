<%@page import="review.dao.ReviewDao"%>
<%@page import="review.dto.ReviewDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//클릭한 글 번호를 읽어낸다.
	int num=Integer.parseInt(request.getParameter("num"));
	//DB에서 해당 글의 정보를 읽는다.
	ReviewDto dto=ReviewDao.getInstance().getData(num);
	//글 조회수도 1 증가시킨다.
	ReviewDao.getInstance().addViewCount(num);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container-fluid">
		<h3>글 상세 보기</h3>
		<table class="table table-striped">
			<tr>
				<th>글번호</th>
				<td><%=dto.getNum() %></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><%=dto.getWriter() %></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><%=dto.getTitle() %></td>
			</tr>
			<tr>
				<th>조회수</th>
				<td><%=dto.getViewcount() %></td>
			</tr>
			<tr>
				<th>좋아요
				<a href="${pageContext.request.contextPath }/review/private/likeup.jsp?num2=<%=dto.getNum()%>&id2=<%=dto.getWriter()%>">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-hand-thumbs-up-fill" viewBox="0 0 16 16">
				  <path d="M6.956 1.745C7.021.81 7.908.087 8.864.325l.261.066c.463.116.874.456 1.012.965.22.816.533 2.511.062 4.51a9.84 9.84 0 0 1 .443-.051c.713-.065 1.669-.072 2.516.21.518.173.994.681 1.2 1.273.184.532.16 1.162-.234 1.733.058.119.103.242.138.363.077.27.113.567.113.856 0 .289-.036.586-.113.856-.039.135-.09.273-.16.404.169.387.107.819-.003 1.148a3.163 3.163 0 0 1-.488.901c.054.152.076.312.076.465 0 .305-.089.625-.253.912C13.1 15.522 12.437 16 11.5 16H8c-.605 0-1.07-.081-1.466-.218a4.82 4.82 0 0 1-.97-.484l-.048-.03c-.504-.307-.999-.609-2.068-.722C2.682 14.464 2 13.846 2 13V9c0-.85.685-1.432 1.357-1.615.849-.232 1.574-.787 2.132-1.41.56-.627.914-1.28 1.039-1.639.199-.575.356-1.539.428-2.59z"/>
				</svg>
				</a>
				</th>
				<td><%=dto.getLikes() %></td>
			</tr>
			<tr>
				<th>작성일</th>
				<td><%=dto.getRegdate() %></td>
			</tr>
			<%--
			textarea를 이용해서 문자열을 입력받으면
			tab기호, 공백, 개행기호도 같이 입력 받는다.
			해당 기호를 다시 재현하려면 아래와 같은 방법이 있다.
			1. textarea에 출력하기
			2. <pre></pre>요소 안에 출력하기
			3. 개행기호를 찾아서 <br>로 대체하기
			 --%>
			<tr class="table-light">
				<th colspan="2">
					<div><%=dto.getContent() %></div>
				</th>
			</tr>
		</table>
		<%
			//로그인된 아이디가 있으면 읽어온다.
			String id=(String)session.getAttribute("id");
		%>
		<%-- 만일 글 작성자가 로그인된 아이디와 같다면 수정, 삭제 링크를 제공한다. --%>
      <%if(dto.getWriter().equals(id)){ %>
         <a class="btn btn-primary" href="private/updateform.jsp?num=<%=dto.getNum()%>">수정</a>
         <a class="btn btn-secondary" href="javascript:" onclick="deleteConfirm()">삭제</a>
         <script>
            function deleteConfirm(){
               const isDelete=confirm("이 글을 삭제 하겠습니까?");
               if(isDelete){
                  location.href="private/delete.jsp?num=<%=dto.getNum()%>";
               }
            }
         </script>
      <%} %>      
		
		<a class="btn btn-warning" href="${pageContext.request.contextPath }/review/list.jsp">돌아가기</a>
	</div>
</body>
</html>