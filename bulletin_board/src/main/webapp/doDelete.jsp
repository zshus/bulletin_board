<%@page import="org.login.data.MemberManager"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@include file="jspfs/chksession.jspf"%>

<%
String cmd="deleteFailed";
if(MemberManager.deleteMember(application, member.getU_id())){
	session.invalidate();
	cmd="deleteOk";
	
}
response.sendRedirect(request.getContextPath()+"?cmd="+cmd);
%>