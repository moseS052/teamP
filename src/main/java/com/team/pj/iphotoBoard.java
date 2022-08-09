package com.team.pj;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public interface iphotoBoard {
	ArrayList<photoBoardDTO> home_photoList();	
	ArrayList<photoBoardDTO> photoTableList(int startnum, int endnum);
	int insertPhotoBoard(int m_no, String title, String con);
	int maxB_noFind(int m_no);
	int insertphotoRoute(int b_no, String b_route);
	int getTotal();
	ArrayList<photoBoardDTO> ReadPhotoBoard(int b_no);
	int insertPhotoBoardView(int b_no);
	int countCommentview(int b_no);
	int deletePhotoBoard(int b_no);
	void setReview(int l_no,int b_no);
	ArrayList<photoBoardDTO> goReview(int l_no);
	ArrayList<SearchPhoVO> searchPoNick(Map map);
	ArrayList<SearchPhoVO> searchPoTNC(Map map);
	ArrayList<SearchPhoVO> searchLiTNC(Map map);
	ArrayList<photoBoardDTO> updatePhotoBoard_Read(int b_no);
	void updateDelPhotoBoard(int b_no, String b_route);
	void updatePhotoTitle_and_con(int b_no, String title, String con);
	void deleteRoutePhoto(int b_no, String route);
}
