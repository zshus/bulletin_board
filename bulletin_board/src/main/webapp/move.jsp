<%@page import="org.login.data.MemberManager"%>
<%@page import="org.login.data.BoardInfoManager"%>
<%@page import="org.login.bean.BoardInfo"%>
<%@page import="java.util.Vector"%>
<%@page import="org.login.bean.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%
String cmd=request.getParameter("cmd");
System.out.println("cmd:"+cmd);


Vector<BoardInfo> list=BoardInfoManager.getBoardInfoList(application);
System.out.println("list:"+list);
request.setAttribute("list", list);



if(cmd==null){
	cmd="start";
}
String nextPage="";
String msg=null;
if(cmd.equals("start")){
	nextPage="loginForm.jsp";
	msg="어서오세요";
}else if(cmd.equals("goJoin")){
	nextPage="join.jsp";
	msg="모든 사항은 필수입력입니다. ";
}else if(cmd.equals("cancelJoin")){
	nextPage="loginForm.jsp";
	msg="가입이 취소되었습니다. ";
}else if(cmd.equals("goWrite")){
	nextPage="write.jsp";
}else if(cmd.equals("goList")){
	Member member=(Member)session.getAttribute("loginMember");
	Vector<BoardInfo> vec=member.getVec();
	request.setAttribute("myList", vec);
	nextPage="list.jsp";
	
}else if(cmd.equals("saveContents")){
	//System.out.println(0);
	//Vector<BoardInfo> bl=(Vector<BoardInfo>)application.getAttribute("boardInfoList");
	String u_id=(String)session.getAttribute("u_id");
	String title=request.getParameter("title");
	String writer=request.getParameter("writer");
	String password=request.getParameter("password");
	String contents=request.getParameter("contents");
	
	BoardInfo info=new BoardInfo(u_id,title,writer,password,contents);	
	list.add(info);
	Member member=(Member)session.getAttribute("loginMember");
	//Member member=MemberManager.findMember(application,u_id);
	member.getVec().add(info);
	application.setAttribute("boardInfoList", list);
	nextPage="main.jsp";

}else if(cmd.equals("cancelContents")){
	nextPage="main.jsp";
}else if(cmd.equals("modify")){
	String idx=request.getParameter("idx");
	String str=request.getParameter("str");
	String nick=(String)session.getAttribute("u_id");
	BoardInfo binfo=list.get(Integer.parseInt(idx)-1);
	String u_id=binfo.getU_id();
	System.out.println(u_id);
	Vector<BoardInfo> temp=BoardInfoManager.getBoardInfoListByTitle(application, "title", str, u_id);
	BoardInfo b=((Vector<BoardInfo>)request.getAttribute("list")).get(Integer.parseInt(idx)-1);
	int index=b.getNum();
	BoardInfo info=BoardInfoManager.getBoardInfoContent(index, temp);
	request.setAttribute("boardInfo", info);
	session.setAttribute("idx", idx);
	nextPage="modify.jsp";

}else if(cmd.equals("chkModify")){
	BoardInfo info=(BoardInfo)session.getAttribute("boardInfo");
	System.out.println(info);
	
	String pw=request.getParameter("password");
	System.out.println(pw);

	String title=request.getParameter("title");
	String contents=request.getParameter("contents");
	info.setTitle(title);
	info.setContents(contents);
	if(pw.equals(info.getPassword())){
		nextPage="main.jsp";
	}else{
		nextPage="modify.jsp";
		request.setAttribute("boardInfo", info);
	}
	
}else if(cmd.equals("chkDelete")){
	BoardInfo info=(BoardInfo)session.getAttribute("boardInfo");
	String pw=request.getParameter("password");

	if(pw.equals(info.getPassword())){
		Vector<BoardInfo> allList=BoardInfoManager.getBoardInfoList(application);
		allList.remove(info);
		String u_id=(String)session.getAttribute("u_id");
		//Member member=MemberManager.findMember(application,u_id);
		Member member=(Member)session.getAttribute("loginMember");
		member.getVec().remove(info);
		
		nextPage="main.jsp";
	}else{
		nextPage="modify.jsp";
		request.setAttribute("boardInfo", info);
	}
}else if(cmd.equals("goInfo")){
	nextPage="info.jsp";
}else if(cmd.equals("doDelete")){
	Member member=(Member)session.getAttribute("loginMember");
	Vector<BoardInfo> oldVec=member.getVec();
	for(int i=list.size()-1;i>=0;i--){
		BoardInfo b1=list.get(i);
		for(BoardInfo b2:oldVec){
			if(b1.getNum()==b2.getNum() && b1.getU_id().equals(b2.getU_id())){
				list.remove(b1);
				break;
			}
		}
	}
	
	Vector<BoardInfo> newVec=new Vector<>();
	member.setVec(newVec);
	
	
	nextPage="list.jsp";
}




else if(cmd.equals("goLogout")){
	nextPage="logout.jsp";
	
}else if(cmd.equals("backToSuccess")){
	nextPage="list.jsp";
	//msg="정보수정이 취소되었습니다.";
	
	
	
	
}else if(cmd.equals("doDelete")){
	nextPage="doDelete.jsp";
	
}else if(cmd.equals("chkLogin")){
	nextPage="checkLogin.jsp";
	
}else if(cmd.equals("doJoin")){
	nextPage="doJoin.jsp";
	
}else if(cmd.equals("doUpdate")){
	nextPage="doUpdate.jsp";
	
}else if(cmd.equals("updateFailed")){
	nextPage="info.jsp";
	msg="정보변경 중 오류가 발생하였습니다.";
}else if(cmd.equals("updateOk")){
	nextPage="loginSuccess.jsp";
	msg="정보변경 성공";
}else if(cmd.equals("joinOk")){
	nextPage="loginForm.jsp";
	msg="회원가입에 성공하였습니다. 로그인해 주세요.";
}else if(cmd.equals("joinFailed")){
	nextPage="join.jsp";
	msg="이미 존재하는 ID입니다.";
}else if(cmd.equals("deleteFailed")){
	
	nextPage="info.jsp";
	msg="회원탈퇴 도중 오류가 발생하였습니다.";
}else if(cmd.equals("deleteOk")){
	nextPage="loginForm.jsp";
	msg="탈퇴처리 되었습니다. 이용해 주셔서 감사드립니다.";
}else if(cmd.equals("logout")){
	nextPage="loginForm.jsp";
	msg="로그아웃외었습니다.";
}else if(cmd.equals("idNotExists")){
	nextPage="loginForm.jsp";
	msg="등록되지 않은 ID입니다.";
}else if(cmd.equals("wrongPassword")){
	nextPage="loginForm.jsp";
	msg="비밀번호가 일치하지 않습니다.";
}else if(cmd.equals("loginOk")){
	//nextPage="loginSuccess.jsp";
	nextPage="main.jsp";
	Member member=(Member)session.getAttribute("loginMember");
	session.setAttribute("u_id", member.getU_nick());
	msg=member.getU_nick()+"님 환영합니다!";
}


else{
	nextPage="loginForm.jsp";
	msg="잘 못된 요청입니다.";
}
application.setAttribute("boardInfoList", list);
session.setAttribute("msg", msg);
System.out.println(nextPage);

%>
<jsp:forward page="<%=nextPage %>"></jsp:forward>



