package com.team.pj;

import java.util.ArrayList;

public interface iteamP {
	ArrayList<noteVO> getNoteCon(int m_no,int m_pa_no);
	void noteSend(int me,int you,String con);
	String getID(int m_no);
	int getM_no(String id);
	ArrayList<SearchVO> searchTNC(String title,String date,String seqno,String table,String titleName,String con,String search);
	int test1(String a);
}
