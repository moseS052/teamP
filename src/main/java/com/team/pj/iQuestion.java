package com.team.pj;

import java.util.ArrayList;

public interface iQuestion {
	ArrayList<qnaDTO> qnaList();
	qnaDTO answerList(int q_no);
	ArrayList<qnaDTO> question(int m_no);
	int insertContactus(String title, String contact, int m_no);
	ArrayList<boardDTO>f_BoardRead();
	ArrayList<qnaDTO> adminqnaList();
	void updateQuestion(String q_a, int qno);
}
