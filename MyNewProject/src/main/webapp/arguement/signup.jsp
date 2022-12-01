<%@page import="admin.dao.AdminDao"%>
<%@page import="admin.dto.AdminDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name=request.getParameter("name");
	String email=request.getParameter("email");
	int rank=Integer.parseInt(request.getParameter("rank"));
	
	AdminDto dto=new AdminDto();
	dto.setName(name);
	dto.setEmail(email);
	dto.setRank(rank);
	
	boolean isSuc=AdminDao.getInstance().insert(dto);
	String cpath=request.getContextPath();
	response.sendRedirect(cpath+"/arguement/list.jsp");
%>