<%@page import="org.login.bean.BoardInfo"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� �Խ���</title>
<script type="text/javascript" src="script/scripts.js"></script>
</head>

<body>
<h1 align="center"><%=session.getAttribute("u_id") %>���� �� ����Դϴ�.</h1>
<br>
<a href="move.jsp?cmd=loginOk">�Խ��� ���</a>
<hr>


<div class="fom1">
<table >

		<thead>
		
		<tr>
		<th colspan="4">
		<form>
		<select>
		<option>����</option>
		<option>�ۼ���</option>
		</select> 				
		����: <input type="text"/> 
		<input type="button" value="go" onclick="doDelete(this.form)"/>
		</form>
		</th>
		
		</tr>
		
		<tr>
		<th>��ȣ</th>
		<th>����</th>
		<th>�ۼ���</th>
		<th>�ۼ���</th>
		</tr>	
		</thead>
		
		<tbody>
		<%
		Vector<BoardInfo> list=(Vector<BoardInfo>)request.getAttribute("myList");
		if( list!=null&&list.size()!=0){
			for(int i=0; i<list.size();i++){
				BoardInfo info=list.get(i);
		%>
		<tr>
		<td><%=i+1 %></td>
		<td><%=info.getTitle() %></td>
		<td><%=info.getWriter() %></td>
		<td><%=info.getStringDate() %></td>
		</tr>	
		<%
		
			}
		}else{
		%>
		<tr>
		<td colspan="4">no data</td>
		</tr>
		
		<%
		}
		%>
		</tbody>
		
		
		<tfoot >
		<tr>
		<th colspan="4">
		<input type="button" value="before"/>
	<%
	for(int i=1; i<=1/4+1;i++){
	%>
	<%=i%>
	<%
	}
	%>
		<input type=button value="next"/>
		</th>
		</tr>
		</tfoot>
		
		</table>
		<br>
		<form action="move.jsp?cmd=goInfo" method="post">
		<input type="submit" value="�� ���� ����" />			
		<input type="button" value="��� �� ����" onclick="justMove(this.form,'doDelete')" />
		<input type="hidden" name="cmd"/>
		</form>
		
</div>

		



</body>
<style>
.fom1 {
margin-left: 2%;
}
table,
td,
th {
border: 1.5px solid gray;
border-collapse: collapse;
}

table {
	margin-top: 1em;
	width: 90%;
	}
td {
text-align: center;
}


</style>





</html>
