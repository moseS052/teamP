package com.team.pj;

import java.util.ArrayList;

public interface iQuestion {
	ArrayList<qnaDTO> qnaList();
	qnaDTO answerList(int q_no);
	ArrayList<qnaDTO> question(int m_no);
	int insertContactus(String title, String contact, int m_no);
}
