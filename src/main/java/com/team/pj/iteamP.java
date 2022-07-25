package com.team.pj;

import java.util.ArrayList;

public interface iteamP {
	ArrayList<noteVO> getNoteCon(int m_no,int m_pa_no);
	void noteSend(int me,int you,String con);
	ArrayList<commentDTO> comlist(int b_no);
	void insertcomment(int b_no, String c_con, int m_no);
	int deletecomment(int c_no);
	int updatecomment(String c_con, int c_no);
	int countre_replylist(int c_no);
	ArrayList<commentDTO> re_replylist(int c_no);
	int insertReRply(int b_no, String c_con, int m_no, int c_pa_no);
	int deleteReReply(int c_no);
	int updateReReply(int c_no, int b_no, String c_con, int m_no, int c_pa_no);
	ArrayList<memberDTO> listMember();
	void insert(String id,String pw,String name,String nick,String phone,String gender,String mail,String birth);
	int count(String id,int pw);
	void talent(int m_no,int t_no);
	int id(String id);
	int getM_no1(String id);
	int nick(String nick);
	ArrayList<L_listDTO> getM_noNick(int m_no);
	ArrayList<L_listDTO> Openl_list();
	ArrayList<L_listDTO> getL_list(String l_koo);
	L_listDTO l_read(int l_no);
	void new_ad(int m_no,String l_title,String l_con,String l_name, String l_address,String l_koo,String l_date);
	int checkl_no(int l_no,String l_date);
	void check_ad(int l_no,int t_no);
	String getNickById(String id);
	int L_del(int l_no);
	L_listDTO reto(int l_no);
	ArrayList<Integer> bringt_no(int l_no);
	void delcheck(int l_no);
	ArrayList<String> bringt_name(int l_no);
	int buttoncreate(int l_no,int m_no);
	ArrayList<L_listDTO>applist(int l_no);
	void applyad(int l_no , int m_no);
	void applydel(int l_no , int m_no);
	void l_views(int l_no);
	void prUodate(int m_no,String l_title,String l_content,String l_date,String l_name,String l_address,String l_koo,int l_no);
}
