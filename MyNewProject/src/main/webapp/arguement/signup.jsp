
<%@page import="admin.dto.AdminDto"%>
<%@page import="admin.dao.AdminDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name=request.getParameter("name");
	String email=request.getParameter("email");
	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	int rank=Integer.parseInt(request.getParameter("rank"));
	
	AdminDto dto=new AdminDto();
	dto.setName(name);
	dto.setEmail(email);
	dto.setId(id);
	dto.setPwd(pwd);
	dto.setRank(rank);
	
	boolean isSuc=AdminDao.getInstance().insert(dto);
	String cpath=request.getContextPath();
	response.sendRedirect(cpath+"/arguement/list.jsp");
%>