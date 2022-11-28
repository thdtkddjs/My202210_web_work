<%@page import="test.file.dao.FileDao"%>
<%@page import="test.file.dto.FileDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//로그인된 아이디를 읽어온다.(로그인을 하지 않았다면 null일수도 있다.)
	String id=(String)session.getAttribute("id");
	
	//페이지 당 보여줄 ROW의 갯수
	final int PAGE_ROW_COUNT=5;
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
	int totalRow=FileDao.getInstance().getCount();
	//전체 페이지의 갯수 구하기
	int totalPageCount=(int)Math.ceil(totalRow/(double)PAGE_DISPLAY_COUNT);
	//끝 페이지 번호가 전체 페이지 갯수보다 많다면 오류가 생긴다.
	if(endPageNum > totalPageCount){
		endPageNum=totalPageCount;//보정해준다.
	}
	FileDto dto=new FileDto();
	
	dto.setStartRowNum(startRowNum);
	dto.setEndRowNum(endRowNum);
	//파일 목록을 select 해온다.
	List<FileDto> list=FileDao.getInstance().getList(dto);
	
	//응답하기	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/file/list.jsp</title>
<style>
#uploadsymbol{
	margin : 0 0 0 300px;
}
</style>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<body>
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="file" name="thisPage"/>
	</jsp:include>
		<div class=container>
		<table>
			<tr class="table-light">
				<th colspan="2">
					<h3>자료실 목록 보기</h3>
				</th>
				<th class="text-end">
					<a href="${pageContext.request.contextPath }/file/private/upload_form.jsp">
					<svg id="uploadsymbol" xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-file-earmark-arrow-up" viewBox="0 0 16 16">
					  <path d="M8.5 11.5a.5.5 0 0 1-1 0V7.707L6.354 8.854a.5.5 0 1 1-.708-.708l2-2a.5.5 0 0 1 .708 0l2 2a.5.5 0 0 1-.708.708L8.5 7.707V11.5z"/>
					  <path d="M14 14V4.5L9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2zM9.5 3A1.5 1.5 0 0 0 11 4.5h2V14a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h5.5v2z"/>
					</svg>
					</a>
				</th>
			</tr>
		</table>
		<table class="table table-striped table-xlg">
			<thead class="table-dark">
				<tr>
					<th>번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>파일명</th>
					<th>크기</th>
					<th>등록일</th>
					<th>기능1</th>
				</tr>
			</thead>
			<tbody>
			<%for(FileDto tmp:list) {%>
				<tr>
					<td><%=tmp.getNum() %></td>
					<td><%=tmp.getWriter() %></td>
					<td><%=tmp.getTitle() %></td>
					<td>
					  <a href="download.jsp?num=<%=tmp.getNum()%>"><%=tmp.getOrgFileName() %></a>
					</td>
					<td><%=tmp.getFileSize() %></td>
					<td><%=tmp.getRegdate() %></td>
					<td>
						<%if(tmp.getWriter().equals(id)) {%>
							<a href="javascript:deleteConfirm(<%=tmp.getNum()%>)">삭제</a>
						<%} %>
					</td>
				</tr>
			<%} %>
			</tbody>
		</table>
		<nav aria-label="Page navigation example">
			<ul class="pagination pagination-sm">
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
	<script>
		function deleteConfirm(num){
			let isDel=confirm("삭제하시겠습니까?");
			if(isDel){
				location.href="delete.jsp?num="+num;
			}
		}
	
	</script>
</body>
</html>