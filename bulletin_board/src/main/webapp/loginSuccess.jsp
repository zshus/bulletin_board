<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset="EUC-KR">
<title>Login Success</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<script type="text/javascript" src="script/scripts.js"></script>
</head>
<body>


	<p class="titleStr">Success!!</p>
	<form name="successForm">
		<div class="centerBox">
			<div class="btns">
				<input type="button" value="메인으로"
					onclick="justMove(this.form,'loginOk')" /> <input type="button"
					value="로그아웃" onclick="logout(this.form,'goLogout')" />
			</div>
		</div>
		<div class="msgBox">
			<%=session.getAttribute("msg")%>
		</div>
		<input type="hidden" name="cmd" />
	</form>


</body>
</html>
<%@include file="jspfs/removeMsg.jspf"%>