package com.team.pj;

import java.util.ArrayList;

public interface iteamP {
	ArrayList<L_listDTO> getL_list(String l_koo);
	int new_ad(String l_no,String l_title,String l_con,String l_name, String l_address,String l_koo,String l_date);
}
