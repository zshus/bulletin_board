<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset="EUC-KR">
<title>���� �Խ���</title>
<script type="text/javascript" src="script/scripts.js"></script>
</head>


<body>
<h1 align="center">�Խ��� ���� �ۼ�</h1>

<a href="move.jsp?cmd=loginOk">�Խ��� ���</a>
<hr>

<form>
<div class="fom1">
����: <input type="text" name="title"/>
�ۼ���: <input type="text" name="writer" value="<%=session.getAttribute("u_id")%>" readonly="readonly"/>
��й�ȣ: <input type="text" name="password"/>
</div>
<br>
<div class="fom2">
�Խ��� ����:<br>
<textarea rows="10" cols="100" name="contents"></textarea>
</div>
<br>
<div class="fom3">
<input type="button" value="�ۼ�" onclick="justMove(this.form,'saveContents')"/>
<input type="button" value="�ּ�" onclick="justMove(this.form,'cancelContents')"/>
<input type="reset" value="����"/>
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