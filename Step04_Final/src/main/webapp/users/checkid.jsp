<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//파라미터를 읽어오기	
	String inputId=request.getParameter("inputId");
	
	UsersDto dto=UsersDao.getInstance().getData(inputId);
%>
<%--만일 null이면 이미 존재하는 아이디. --%>
<%if(dto==null){%>
	{"isExist":false}
<%}else{%>
	{"isExist":true}
<%}	%>
