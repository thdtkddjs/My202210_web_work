<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%
   int num = Integer.parseInt(request.getParameter("num"));
	//2. 응답하기(어떤 응답?)
	MemberDao dao=MemberDao.getInstance();
	dao.delete(num);
	//이번엔 html, javascript 모두 응답하지 않을 것이다!
	/*
	요청을 한 클라이언트에 새로운 경로로 요청을 다시 하라고 강요하는
	응답을 할 수 있다.
	이것이 바로 redirect응답이다.
	절대 경로로 사용하는 것이 좋다.
	응답 직후 웹브라우저가 경로를 이동하므로 응답 후의 코드에는 의미가 없다.
	*/
	
	//java code 영역에서 context path를 얻어내려면
	//객체의 메소드를 이용해야한다.
	String cPath=request.getContextPath();
	response.sendRedirect(cPath+"/member/list.jsp");
   
   %>
