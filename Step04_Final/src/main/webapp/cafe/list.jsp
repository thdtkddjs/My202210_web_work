<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	//페이지 당 보여줄 ROW의 갯수
	final int PAGE_ROW_COUNT=10;
	//하단 페이지를 몇개까지 표기할 것인지
	final int PAGE_DISPLAY_COUNT=5;
	//보여줄 페이지의 번호를 일단 1이라고 가정
	int pageNum=1;
	//페이지 번호가 파라미터로 전달되었는지 확인
	String StrPageNum=request.getParameter("pageNum");
	//전달되었다면 전달된 파라미터를 pageNum으로 지정한다.
	if(StrPageNum !=null){
		pageNum=Integer.parseInt(StrPageNum);
	}
	//보여줄 페이지의 시작 rownum
	int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
	//끝 rownum
	int endRowNum=pageNum*PAGE_ROW_COUNT;

	//하단 시작 페이지 번호
	int startPageNum=1+((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
	//하단 끝 페이지 번호
	int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
	//전체 글의 갯수
	int totalRow=CafeDao.getInstance().getCount();
	//전체 페이지의 갯수 구하기
	int totalPageCount=(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
	//끝 페이지 번호가 전체 페이지 갯수보다 많다면 오류가 생긴다.
	if(endPageNum > totalPageCount){
		endPageNum=totalPageCount;//보정해준다.
	}
	
	//처리 완료 후 범위를 한정하여 불러오기.
	CafeDto dto=new CafeDto();
	dto.setStartRowNum(startRowNum);
	dto.setEndRowNum(endRowNum);
	
	List<CafeDto> list=CafeDao.getInstance().getList(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/list.jsp</title>
<style>
#writesymbol{
	margin : 0 0 0 300px;
}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>
<jsp:include page="/include/navbar.jsp">
	<jsp:param value="cafe" name="thisPage"/>
</jsp:include>
	<div class="container">
		<table>
			<tr class="table-light">
				<th colspan="2">
					<h3>카페 글 목록입니다.</h3>
				</th>
				<th class="text-end">
				<a href="${pageContext.request.contextPath }/cafe/private/insertform.jsp">
				<svg id="writesymbol" xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
				  <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
				  <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
				</svg>
				</a>
				</th>
			</tr>
		</table>
		<table class="table table-lg">
			<thead class="table table-dark">
				<tr>
					<th>글번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>조회수</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody class="table table-striped">
				<%for(CafeDto tmp:list){ %>
				<tr>
					<th><%=tmp.getNum() %></th>
					<th><%=tmp.getWriter() %></th>
					<th>
						<a href="detail.jsp?num=<%=tmp.getNum()%>"><%=tmp.getTitle() %></a>
					</th>
					<th><%=tmp.getViewCount() %></th>
					<th><%=tmp.getRegdate() %></th>
				</tr>
				<%} %>
			</tbody>
		</table>
		<nav aria-label="Page navigation example">
			<ul class="pagination pagination-lg">
				<%if(startPageNum !=1){ %>
					<li class="page-item">
						<a class="page-link" href="list.jsp?pageNum=<%=startPageNum-1%>"><<</a>
					</li>
				<%} %>
				<%for(int i=startPageNum; i<=endPageNum; i++) {%>
					<li class="page-item <%=pageNum == i ? "active" : "" %>">
						<a class="page-link" href="list.jsp?pageNum=<%=i %>"><%=i %></a>
					</li>
				<%} %>	
				<%if(endPageNum<totalPageCount) {%>
					<li class="page-item">
						<a class="page-link" href="list.jsp?pageNum=<%=endPageNum+1%>">>></a>
					</li>
				<%} %>
			</ul>
		</nav>
	</div>
<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>