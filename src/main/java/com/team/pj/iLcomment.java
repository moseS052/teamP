package com.team.pj;

import java.util.ArrayList;

public interface iLcomment {
	void insertL_comment(int l_no, String c_con, int m_no);
	ArrayList<LcommentDTO> Lcomlist(int pagenum, int l_no);
	int countLre_replylist(int c_no);
	int insertL_ReRply(int l_no, String c_con, int m_no, int c_pa_no);
	int deleteL_ReReply(int c_no);
	ArrayList<LcommentDTO> Lre_replylist(int c_no);
	int updateLReReply(int c_no, int b_no, String c_con, int m_no, int c_pa_no);
	int updateLcomment(String c_con, int c_no);
	int deleteLcomment(int c_no);
	int countLComment_t(int l_no);
}
