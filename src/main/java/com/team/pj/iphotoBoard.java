package com.team.pj;

import java.util.ArrayList;
import java.util.List;

public interface iphotoBoard {
	ArrayList<photoBoardDTO> photoTableList(int startnum, int endnum);
	int insertPhotoBoard(int m_no, String title, String con);
	int maxB_noFind(int m_no);
	int insertphotoRoute(int b_no, String b_route);
	int getTotal();
	ArrayList<photoBoardDTO> ReadPhotoBoard(int b_no);
	int insertPhotoBoardView(int b_no);
	int countCommentview(int b_no);
	int deletePhotoBoard(int b_no);
}
