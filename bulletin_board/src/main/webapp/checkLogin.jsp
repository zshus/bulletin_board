<%@page import="org.login.data.MemberManager"%>
<%@page import="org.login.bean.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="org.login.bean.*" import="org.login.data.*"%>
<!DOCTYPE html>
<%
String uid=request.getParameter("u_id");
String upw=request.getParameter("u_pw");

Member member=MemberManager.findMember(application, uid);

String cmd;
if(member==null){
	cmd="idNotExists";
}else{
	if(!member.getU_pw().equals(upw)){
		cmd="wrongPassword";
	}else{
		session.setAttribute("loginMember", member);
		cmd="loginOk";
	}
}

response.sendRedirect(request.getContextPath()+"?cmd="+cmd);
%>