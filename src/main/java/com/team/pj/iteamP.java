package com.team.pj;

import java.util.ArrayList;

public interface iteamP {
	ArrayList<memberDTO> listMember();
	void insert(String id,String pw,String name,String nick,String phone,String gender,String mail,String birth);
	int count(String id,int pw);
}
