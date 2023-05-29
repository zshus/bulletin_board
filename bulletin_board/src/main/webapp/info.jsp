<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="jspfs/chksession.jspf" %>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset="EUC-KR">
<title>정보수정</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<script type="text/javascript" src="script/scripts.js"></script>
</head>
<body>


<p class="titleStr">
정보수정
</p>

<form name="infoForm">
<div class="centerBox">
<label for="u_id">ID</label>
<input type="text" name="u_id" title="ID" readonly="readonly" value="<%=member.getU_id() %>"/><br>

<label for="u_pw">PW</label>
<input type="password" id="u_pw" name="u_pw" title="password"/><br>

<label for="u_re">Retry</label>
<input type="password" id="u_re" name="u_re" title="Retry"/><br>

<label for="u_name">NAME</label>
<input type="text" name="u_name" title="name" readonly="readonly" value="<%=member.getU_name() %>"/><br>

<label for="u_nick">Nick</label>
<input type="text" name="u_nick"  id="u_nick" title="Nickname" value="<%=member.getU_nick() %>"/><br>

<div class="btns">
<input type="button" value="수정" onclick="chkAndMove(this.form,'doUpdate',true)"/>
<input type="button" value="취소" onclick="justMove(this.form,'goList')"/>
<input type="button" value="회원탈퇴" onclick="doDelete(this.form)"/>
</div>
</div>
<%-- 
<div class="msgBox" id="msg">
<%=session.getAttribute("msg") %>
</div>
--%>
<input type="hidden" name="cmd"/>
</form>


</body>
</html>


<%@include file="jspfs/removeMsg.jspf"%>