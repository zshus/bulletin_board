<%@page import="org.login.data.MemberManager"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@include file="jspfs/chksession.jspf"%>

<%
member.setU_pw(request.getParameter("u_pw"));
member.setU_nick(request.getParameter("u_nick"));

String msg="정보변경 성공!";
String cmd="updateOk";
if(!MemberManager.updateMember(application, member)){
	msg="정보변경중 오류가 발생하였습니다!";
	cmd="updateFailed";
}

session.setAttribute("msg", msg);
response.sendRedirect(request.getContextPath()+"?cmd="+cmd);
%>
