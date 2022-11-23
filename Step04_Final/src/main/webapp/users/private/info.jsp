<%@page import="test.users.dto.UsersDto"%>
<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id=(String) session.getAttribute("id");

	UsersDao dao=UsersDao.getInstance();
	UsersDto dto=dao.getDate(id);
	
	session.setAttribute("id", id);
	session.setAttribute("pwd", dto.getPwd());
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/info.jsp</title>
</head>
<body>
   <div class="container">
      <h1>가입 정보 입니다.</h1>
      <table>
         <tr>
            <th>아이디</th>
            <td><%=id %></td>
         </tr>
         <tr>
            <th>프로필 이미지</th>
            <td>
               <%if(dto.getProfile()==null){ %>
                  <svg id="profileImage" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
                       <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
                       <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
                  </svg>
               <%}else{ %>
                  <img id="profileImage" 
                     src="${pageContext.request.contextPath }<%=dto.getProfile()%>">
               <%} %>
            </td>
         </tr>
         <tr>
            <th>비밀번호</th>
            <td><a href="pwd_updateform.jsp">수정하기</a></td>
         </tr>
         <tr>
            <th>이메일</th>
            <td><%=dto.getEmail() %></td>
         </tr>
         <tr>
            <th>가입일</th>
            <td><%=dto.getRegdate() %></td>
         </tr>
      </table>
      <a href="updateform.jsp">개인정보 수정</a>
      <a href="javascript:deleteConfirm()">탈퇴</a>
   </div>
   <script>
	
		function deleteConfirm(){
			let isDel=confirm("확인을 누르면 회원 탈퇴가 됩니다. 탈퇴하시겠습니까?")
			if(isDel){
				location.href="delete.jsp";
			}
		}
	</script>
</body>
</html>