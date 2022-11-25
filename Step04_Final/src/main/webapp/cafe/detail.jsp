<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//클릭한 글 번호를 읽어낸다.
	int num=Integer.parseInt(request.getParameter("num"));
	//DB에서 해당 글의 정보를 읽는다.
	CafeDto dto=CafeDao.getInstance().getData(num);
	//글 조회수도 1 증가시킨다.
	CafeDao.getInstance().addViewCount(num);
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<h3>글 상세 보기</h3>
		<table>
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
				<td><%=dto.getViewCount() %></td>
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
			<tr>
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
         <a href="private/updateform.jsp?num=<%=dto.getNum()%>">수정</a>
         <a href="javascript:" onclick="deleteConfirm()">삭제</a>
         <script>
            function deleteConfirm(){
               const isDelete=confirm("이 글을 삭제 하겠습니까?");
               if(isDelete){
                  location.href="private/delete.jsp?num=<%=dto.getNum()%>";
               }
            }
         </script>
      <%} %>      

	</div>
</body>
</html>