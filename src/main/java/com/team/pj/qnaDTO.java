package com.team.pj;

import org.springframework.stereotype.Component;

@Component("faqVO")
public class qnaDTO {
	private int q_no;
	private String q_title;
	private String q_con;
	private String q_date;
	private int m_no;
	private String q_a;

	public qnaDTO() {
	}

	public int getQ_no() {
		return q_no;
	}

	public void setQ_no(int q_no) {
		this.q_no = q_no;
	}

	public String getQ_title() {
		return q_title;
	}

	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}

	public String getQ_con() {
		return q_con;
	}

	public void setQ_con(String q_con) {
		this.q_con = q_con;
	}

	public String getQ_date() {
		return q_date;
	}

	public void setQ_date(String q_date) {
		this.q_date = q_date;
	}

	public int getM_no() {
		return m_no;
	}

	public void setM_no(int m_no) {
		this.m_no = m_no;
	}

	public String getQ_a() {
		return q_a;
	}

	public void setQ_a(String q_a) {
		this.q_a = q_a;
	}

}
