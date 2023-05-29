package org.login.data;

import java.util.Vector;

import javax.servlet.ServletContext;

import org.login.bean.BoardInfo;
import org.login.bean.Member;

public class BoardInfoManager {
	
	public static Vector<BoardInfo> getBoardInfoList(ServletContext application ){
		Vector<BoardInfo> boardInfoList=(Vector<BoardInfo>)application.getAttribute("boardInfoList");
		
		if(boardInfoList==null) {
			boardInfoList=new Vector<BoardInfo>();
			application.setAttribute("boardInfoList", boardInfoList);
		}
		
		return boardInfoList;
	}
	
	public static Vector<BoardInfo> getBoardInfoListByTitle(ServletContext application,String title,String val,String u_id){
		Vector<BoardInfo> list=getBoardInfoByString(application,title,val,u_id);
		return list;
	}
	
	public static Vector<BoardInfo> getBoardInfoByWriter(ServletContext application,String writer,String val,String u_id){
		Vector<BoardInfo> list=getBoardInfoByString(application,writer,val,u_id);
		return list;
	}
	
	
	public static BoardInfo getBoardInfoContent(int num,Vector<BoardInfo> list ) {
		BoardInfo info=null;
		for(BoardInfo temp:list) {
			if(temp.getNum()==num) {
				info=temp;
			}
		}
		return info;
	}
	public static void update(ServletContext application,BoardInfo info ,int idx,Vector<BoardInfo> list) {		
		 list.set(idx, info);
	}
	
	
	private static Vector<BoardInfo> getBoardInfoByString(ServletContext application,String str,String val,String u_id){
		Vector<BoardInfo> list=new Vector<>();
		Vector<BoardInfo> boardInfoList=getBoardInfoList(application);
		for(BoardInfo info:boardInfoList ) {
			String temp="";
			if(str.equals("title")) {
				temp=info.getTitle();
			}else {
				temp=info.getWriter();
			}
			
			if(info.getU_id().equals(u_id)&& temp.equals(val)) {
				list.add(info);
			}
		}
		
		return list;
	}
	

}
