package com.team.pj;

import java.util.ArrayList;

public interface iteamP {
	ArrayList<memberDTO> listMember();
	int insert(String id,String pw,String name,String nick,String phone,String gender,String mail,String birth);
	int count(String id,int pw);
	int talent(String t_no);
	int id(String id);
}
