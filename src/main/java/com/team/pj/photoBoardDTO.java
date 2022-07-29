package com.team.pj;

public class photoBoardDTO {
	int b_no;
	int m_no;
	String b_title;
	String b_date;
	String b_con;
	int views;
	String nick;
	String b_route;

	public photoBoardDTO() {
	}

	public int getB_no() {
		return b_no;
	}

	public void setB_no(int b_no) {
		this.b_no = b_no;
	}

	public int getM_no() {
		return m_no;
	}

	public void setM_no(int m_no) {
		this.m_no = m_no;
	}

	public String getB_title() {
		return b_title;
	}

	public void setB_title(String b_title) {
		this.b_title = b_title;
	}

	public String getB_date() {
		return b_date;
	}

	public void setB_date(String b_date) {
		this.b_date = b_date;
	}

	public String getB_con() {
		return b_con;
	}

	public void setB_con(String b_con) {
		this.b_con = b_con;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getB_route() {
		return b_route;
	}

	public void setB_route(String b_route) {
		this.b_route = b_route;
	}

}
