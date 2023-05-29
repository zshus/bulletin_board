<%@page import="org.login.data.MemberManager"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@page import="org.login.bean.*" import="org.login.data.*"%>
<jsp:useBean id="member" class="org.login.bean.Member"/>
<jsp:setProperty property="*" name="member"/>
<%
String cmd="joinOk";
if(!MemberManager.addMember(application, member)){
	cmd="joinFailed";
}
response.sendRedirect(request.getContextPath()+"?cmd="+cmd);
%>