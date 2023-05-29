<%@page import="org.login.bean.BoardInfo"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<script type="text/javascript" src="script/scripts.js"></script>
<title>자유 게시판</title>
</head>
<%
BoardInfo info=(BoardInfo)request.getAttribute("boardInfo");
System.out.println(info);
session.setAttribute("boardInfo", info);
%>
<body>
<h1 align="center">게시판 내용 작성</h1>

<a href="move.jsp?cmd=loginOk">게시판 목록</a>
<hr>

<form>
<div class="fom1">

제목: <input type="text" name="title" value="<%=info.getTitle()%>"/>
작성자: <input type="text" name="writer" value="<%=info.getWriter()%>" readonly="readonly"/>
</div>
<br>

<div class="fom2">
게시판 내용:<br>
<textarea rows="10" cols="100" name="contents"><%=info.getContents() %></textarea>
</div>
<br>

<div class="fom3">
수정이나 삭제를 하려면 비밀번호를 입력하세요:<br>
<input type="text" name="password"/>
<br><br>
<input type="button" value="수정하기" onclick="justMove(this.form,'chkModify')"/>
<input type="button" value="삭제하기" onclick="justMove(this.form,'chkDelete')"/>
<input type="reset" value="리셋"/>
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
