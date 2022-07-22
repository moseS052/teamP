package com.team.pj;

import java.util.ArrayList;

public interface iBoard {
	ArrayList<boardDTO> listBoard();
	boardDTO view(int seqbbs);
	void fb_insert(int m_no,String b_title,String b_con);
}
