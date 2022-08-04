package com.team.pj;

public class LcommentDTO {
	private int c_no;
	private int l_no;
	private String c_con;
	private int m_no;
	private String c_date;
	private int c_pa_no;
	private int replycount;
	private String nick;

	public LcommentDTO() {
	}

	public int getC_no() {
		return c_no;
	}

	public void setC_no(int c_no) {
		this.c_no = c_no;
	}

	public int getL_no() {
		return l_no;
	}

	public void setL_no(int l_no) {
		this.l_no = l_no;
	}

	public String getC_con() {
		return c_con;
	}

	public void setC_con(String c_con) {
		this.c_con = c_con;
	}

	public int getM_no() {
		return m_no;
	}

	public void setM_no(int m_no) {
		this.m_no = m_no;
	}

	public String getC_date() {
		return c_date;
	}

	public void setC_date(String c_date) {
		this.c_date = c_date;
	}

	public int getC_pa_no() {
		return c_pa_no;
	}

	public void setC_pa_no(int c_pa_no) {
		this.c_pa_no = c_pa_no;
	}

	public int getReplycount() {
		return replycount;
	}

	public void setReplycount(int replycount) {
		this.replycount = replycount;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

}
