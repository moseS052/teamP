package com.team.pj;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public interface iteamP {
	ArrayList<noteVO> getNoteCon(int m_no,int m_pa_no);
	void noteSend(int me,int you,String con);
	String getID(int m_no);
	int getM_no(String id);
	ArrayList<SearchVO> searchTNC(Map map);
	ArrayList<SearchVO> searchNick(Map map);
	ArrayList<Integer> searchMno(String nick);
}
