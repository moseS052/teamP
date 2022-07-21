package com.team.pj;

import java.util.ArrayList;

public interface iteamP {
	ArrayList<memberDTO> listMember();
	void insert(String id,String pw,String name,String nick,String phone,String gender,String mail,String birth);
	int count(String id,int pw);
	void talent(int m_no,int t_no);
	int id(String id);
	int getM_no1(String id);
	int nick(String nick);
}
