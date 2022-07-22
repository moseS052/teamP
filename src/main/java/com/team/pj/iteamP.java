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
}
