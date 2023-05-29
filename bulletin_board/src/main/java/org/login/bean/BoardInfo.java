package org.login.bean;

import java.net.NoRouteToHostException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Objects;

public class BoardInfo {
	
	private String u_id;
	private String title;
	private String writer;
	private String password;
	private String contents;
	private Date date;
	private static int number=1;
	private int num;

	
	public BoardInfo() {
		super();		
	}
	
	//글 num는 idx이다.
	public BoardInfo(String u_id, String title, String writer, String password, String contents) {
		super();
		this.u_id = u_id;
		this.title = title;
		this.writer = writer;
		this.password = password;
		this.contents = contents;
		this.date=new Date();
		this.num=number++;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}
	
	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
	
	public String getStringDate() {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(date);
	}
	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	@Override
	public String toString() {
		return "BoardInfo [u_id=" + u_id + ", title=" + title + ", writer=" + writer + ", password=" + password
				+ ", contents=" + contents + ", date=" + date + ", num=" + num + "]";
	}
	

	@Override
	public boolean equals(Object obj) {
		if(obj==null||!(obj instanceof BoardInfo)) {
			return false;
		}
		
		BoardInfo other=(BoardInfo)obj;
		return other.num==num;
	}


	
	
	
	
	

}
