package com.team.pj;

import java.util.ArrayList;

public interface iphotoBoard {
	ArrayList<photoBoardDTO> photoTableList();
	int insertPhotoBoard(int m_no, String title, String con);
	int maxB_noFind(int m_no);
	int insertphotoRoute(int b_no, String b_route);
}
