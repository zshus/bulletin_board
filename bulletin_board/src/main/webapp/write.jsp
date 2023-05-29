<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset="EUC-KR">
<title>자유 게시판</title>
<script type="text/javascript" src="script/scripts.js"></script>
</head>


<body>
<h1 align="center">게시판 내용 작성</h1>

<a href="move.jsp?cmd=loginOk">게시판 목록</a>
<hr>

<form>
<div class="fom1">
제목: <input type="text" name="title"/>
작성자: <input type="text" name="writer" value="<%=session.getAttribute("u_id")%>" readonly="readonly"/>
비밀번호: <input type="text" name="password"/>
</div>
<br>
<div class="fom2">
게시판 내용:<br>
<textarea rows="10" cols="100" name="contents"></textarea>
</div>
<br>
<div class="fom3">
<input type="button" value="작성" onclick="justMove(this.form,'saveContents')"/>
<input type="button" value="최소" onclick="justMove(this.form,'cancelContents')"/>
<input type="reset" value="리셋"/>
</div>
<input type="hidden" name="cmd" />
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