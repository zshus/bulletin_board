<%@page import="org.login.data.MemberManager"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@include file="jspfs/chksession.jspf"%>

<%
member.setU_pw(request.getParameter("u_pw"));
member.setU_nick(request.getParameter("u_nick"));

String msg="�������� ����!";
String cmd="updateOk";
if(!MemberManager.updateMember(application, member)){
	msg="���������� ������ �߻��Ͽ����ϴ�!";
	cmd="updateFailed";
}

session.setAttribute("msg", msg);
response.sendRedirect(request.getContextPath()+"?cmd="+cmd);
%>
