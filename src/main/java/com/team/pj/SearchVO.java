package com.team.pj;

public class SearchVO {
	private String nick;
	private String title;
	private String time;
	private int seqno;
	private String con;
	private int views;
	private int m_no;
	
	public SearchVO() {
	}
	
	
	public int getM_no() {
		return m_no;
	}

	public void setM_no(int m_no) {
		this.m_no = m_no;
	}
	
	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}


	public String getCon() {
		return con;
	}

	public void setCon(String con) {
		this.con = con;
	}


	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public int getSeqno() {
		return seqno;
	}

	public void setSeqno(int seqno) {
		this.seqno = seqno;
	}

	
	
	
}
