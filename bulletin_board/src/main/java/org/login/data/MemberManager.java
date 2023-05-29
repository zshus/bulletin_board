package org.login.data;

import java.util.Vector;

import javax.servlet.ServletContext;

import org.login.bean.BoardInfo;
import org.login.bean.Member;

public class MemberManager {
	
	public static Vector<Member> getMemberList(ServletContext application ){
		Vector<Member> memberList=(Vector<Member>)application.getAttribute("memberList");
		
		if(memberList==null) {
			memberList=new Vector<Member>();
			application.setAttribute("memberList", memberList);
		}
		return memberList;
	}
	
	public static boolean addMember(ServletContext application, Member member) {
		Vector<Member> memberList=getMemberList(application);
		
		boolean flag=false;
		if(findMember(application, member.getU_id())==null) {
			member.setVec(new Vector<BoardInfo>());
			memberList.add(member);
			flag=true;
		}
		return flag;
	}
	
	public static Member findMember(ServletContext application,String u_id) {
		System.out.println(u_id);
		Vector<Member> memberList=getMemberList(application);
		Member member=null;
		int idx=memberList.indexOf(new Member(u_id));
		if(idx!=-1) {
			member=memberList.get(idx);
		}
		System.out.println(member);
		return member;
	}
	
	public static boolean deleteMember(ServletContext application,String u_id) {
		Vector<Member> memberList=getMemberList(application);
		return memberList.remove(new Member(u_id));
	}
	
	
	public static boolean updateMember(ServletContext application, Member member) {
		Vector<Member> memberList=getMemberList(application);
		int idx= memberList.indexOf(member);
		boolean flag=true;
		
		if(idx!=-1) {
			memberList.set(idx, member);
			
		}else {
			flag=false;
		}
		return flag;
	}

}
