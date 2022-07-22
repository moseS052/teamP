package com.team.pj;

import java.util.ArrayList;

public interface iQuestion {
	ArrayList<qnaDTO> qnaList();
	qnaDTO answerList(int q_no);
}
