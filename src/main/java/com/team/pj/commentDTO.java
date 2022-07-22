package com.team.pj;

public class commentDTO {
	private int c_no;
	private int b_no;
	private String c_con;
	private int m_no;
	private String c_date;
	private int c_pa_no;
	private int replycount;

	public commentDTO() {
	}

	public int getC_no() {
		return c_no;
	}

	public void setC_no(int c_no) {
		this.c_no = c_no;
	}

	public int getB_no() {
		return b_no;
	}

	public void setB_no(int b_no) {
		this.b_no = b_no;
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

}
