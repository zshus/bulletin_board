<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@include file="jspfs/chksession.jspf"%>
<%
session.invalidate();
response.sendRedirect(request.getContextPath()+"?cmd=logout");
%>