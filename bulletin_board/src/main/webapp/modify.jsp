<%@page import="org.login.bean.BoardInfo"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<script type="text/javascript" src="script/scripts.js"></script>
<title>���� �Խ���</title>
</head>
<%
BoardInfo info=(BoardInfo)request.getAttribute("boardInfo");
System.out.println(info);
session.setAttribute("boardInfo", info);
%>
<body>
<h1 align="center">�Խ��� ���� �ۼ�</h1>

<a href="move.jsp?cmd=loginOk">�Խ��� ���</a>
<hr>

<form>
<div class="fom1">

����: <input type="text" name="title" value="<%=info.getTitle()%>"/>
�ۼ���: <input type="text" name="writer" value="<%=info.getWriter()%>" readonly="readonly"/>
</div>
<br>

<div class="fom2">
�Խ��� ����:<br>
<textarea rows="10" cols="100" name="contents"><%=info.getContents() %></textarea>
</div>
<br>

<div class="fom3">
�����̳� ������ �Ϸ��� ��й�ȣ�� �Է��ϼ���:<br>
<input type="text" name="password"/>
<br><br>
<input type="button" value="�����ϱ�" onclick="justMove(this.form,'chkModify')"/>
<input type="button" value="�����ϱ�" onclick="justMove(this.form,'chkDelete')"/>
<input type="reset" value="����"/>
</div>
<input type="hidden" name="cmd"/>
</form>
</body>
<style>
.fom1 {
margin-left: 2%;
}
.fom2 {
margin-left: 2%;
}
.fom3 {
margin-left: 2%;
}
</style>

</html>
