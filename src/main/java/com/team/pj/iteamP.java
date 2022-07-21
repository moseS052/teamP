package com.team.pj;

import java.util.ArrayList;

public interface iteamP {
	ArrayList<L_listDTO> nick(int m_no);
	ArrayList<L_listDTO> Openl_list();
	ArrayList<L_listDTO> getL_list(String l_koo);
	ArrayList<L_listDTO> l_Read(int l_no);
	
	void new_ad(int m_no,String l_title,String l_con,String l_name, String l_address,String l_koo,String l_date);
	int checkl_no(int l_no,String l_date);
	void check_ad(int l_no,int t_no);
}
