<%@page import="org.login.bean.BoardInfo"%>
<%@page import="java.util.Vector"%>
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
	<p class="titleStr">게시판 목록</p>		
	<form name="successForm">
	
		<div class="centerBox">
		<div class="msgBox">
			<%=session.getAttribute("u_id")+"님 환영합니다!"%>
		</div>
			<div class="btns">
				<input type="button" value="내 글 목록 보기" onclick="justMove(this.form,'goList')" id="lbtn"/> 
				<input type="button" value="로그아웃" onclick="logout(this.form,'goLogout')" id="cbtn"/>				
				<input type="button" value="글쓰기" onclick="justMove(this.form,'goWrite')"  id="rbtn"/> 	
			</div>
			
			
			
		<table>
		<thead>
		<tr>
		<th colspan="4">
		<select>
		<option>제목</option>
		<option>작성자</option>
		</select> 
		내용: <input type="text"/> <input type="button" value="go"/>
		</th>
		</tr>
		<tr>
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성일</th>
		</tr>		
		</thead>
		
		<tbody>
		<%
		Vector<BoardInfo> list=(Vector<BoardInfo>)request.getAttribute("list");
		if( list!=null&&list.size()!=0){
			for(int i=0; i<list.size();i++){
				BoardInfo info=list.get(i);
		%>
		<tr>
		<td><%=i+1 %></td>
		<td><a href="move.jsp?cmd=modify&idx=<%= i+1%>&str=<%=info.getTitle()%>"><%=info.getTitle() %></a></td>
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
		</div>
		<input type="hidden" name="cmd"/>
	</form>

	
</body>

<style>
	.msgBox {
	margin-top: 0.5em;
	margin-left: 1 em;
	font-size: 0.9em;
	font-weight: bold;	
	}	
	
	.titleStr {
	text-align: center;
	font-size: 2em;
	font-weight: bold;
	}
	
	.btns {
	margin-top: 0.5em;
	margin-left: 0 auto;
	
	}
	
	#rbtn {
	margin-top: -5em;
	margin-left: 53%;	
	
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
	align: center;
	}
	td {
	text-align: center;
	}
	td a {
	color: black;
	}
	
	.centerBox {
	width: 80%;
	margin-top: 5%;
	margin-left: 10%;
	padding: 2em;	
	
}
	
</style>

</html>



