package com.team.pj;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class photoBoardController {
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/photoBoard")
	public String phothBoard(HttpServletRequest req, Model model,
			@RequestParam("stanum") int stanum,
			@RequestParam("endnum") int endnum) {
		HttpSession session = req.getSession();
		if (session.getAttribute("id") == null) { // 濡�洹몄�� ��
			model.addAttribute("userinfo", null);

		} else { // 濡�洹몄�� �깃났 ��
			model.addAttribute("userinfo", session.getAttribute("id"));
			model.addAttribute("m_no", session.getAttribute("m_no"));
			model.addAttribute("nick",session.getAttribute("nick"));
		}
		iphotoBoard ipt = sqlSession.getMapper(iphotoBoard.class);
//		System.out.println(req.getParameter("l_no"));
		if(req.getParameter("l_no")==null) {
			ipt.countCommentview(endnum);
			ArrayList<photoBoardDTO> pdtolist = ipt.photoTableList(stanum, endnum);
			int total=ipt.getTotal();
			model.addAttribute("photolist", pdtolist);
			model.addAttribute("total", total);
		}else {
			int l_no=Integer.parseInt(req.getParameter("l_no"));
			ArrayList<photoBoardDTO> pdtolist = ipt.goReview(l_no);
			model.addAttribute("photolist", pdtolist);		
		}
		
		return "phothBoard";
	}

	@RequestMapping("/donationReviwe")
	String donationReview(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		model.addAttribute("userinfo", session.getAttribute("id"));
		model.addAttribute("m_no", session.getAttribute("m_no"));	
		model.addAttribute("l_no",Integer.parseInt(req.getParameter("l_no")));
		model.addAttribute("lmno",Integer.parseInt(req.getParameter("lmno")));
		model.addAttribute("nick",session.getAttribute("nick"));

		return "donationReview";
	}

	@ResponseBody
	@RequestMapping(value = "/insertphotoBoard", produces = "application/text;charset=utf8")
	String insertPhotoBoard(HttpServletRequest req, Model model, @RequestParam("title") String title,
			@RequestParam("con") String con) {
		iphotoBoard ipt = sqlSession.getMapper(iphotoBoard.class);
		HttpSession session = req.getSession();
		ipt.insertPhotoBoard((int) session.getAttribute("m_no"), title, con);
		return "";
	}

	@ResponseBody
	@RequestMapping(value = "/findb_no", method = RequestMethod.POST, produces = "application/text;charset=utf8")
	String findB_no(HttpServletRequest req, MultipartHttpServletRequest request) {
		HttpSession session = req.getSession();
		iphotoBoard ipt = sqlSession.getMapper(iphotoBoard.class);
		int a = ipt.maxB_noFind((int) session.getAttribute("m_no"));
		String uploadFolder = "C:/Users/admin/eclipse-workspace/teamP/src/main/webapp/resources/assets/userimg/";
		String realDataFolder = "/resources/assets/userimg/";
		List<MultipartFile> filelist = request.getFiles("file");
		for (MultipartFile mf : filelist) {
			String fileRealName = mf.getOriginalFilename();
			String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());
			UUID uuid = UUID.randomUUID();
			String[] uuids = uuid.toString().split("-");
			String uniqueName = uuids[0];
			File saveFile = new File(uploadFolder + uniqueName + fileExtension);
			try {
				mf.transferTo(saveFile);
				ipt.insertphotoRoute(a, realDataFolder + uniqueName + fileExtension);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}

		}
		return "";
	}
	@RequestMapping("/ReadPhoto")
	public String ReadPhoto(@RequestParam("seq") int b_no, Model model, HttpServletRequest req) {
		HttpSession session = req.getSession();
		
		if (session.getAttribute("id") == null) { // 濡�洹몄�� ��
			model.addAttribute("userinfo", null);

		} else { // 濡�洹몄�� �깃났 ��
			model.addAttribute("userinfo", session.getAttribute("id"));
			model.addAttribute("m_no", session.getAttribute("m_no"));
			model.addAttribute("nick",session.getAttribute("nick"));
		}
		
		
		iphotoBoard ipt = sqlSession.getMapper(iphotoBoard.class);
		ipt.insertPhotoBoardView(b_no);
		ArrayList<photoBoardDTO> boardList=ipt.ReadPhotoBoard(b_no);
		String b_con;
		String b_title;
		String nick;
		String date;
		int view;
		int m_no;
		for(int i=0; i<boardList.size();i++) {
			b_con=boardList.get(i).getB_con();
			b_title=boardList.get(i).getB_title();
			nick=boardList.get(i).getNick();
			date=boardList.get(i).getB_date();
			view=boardList.get(i).getViews();
			m_no=boardList.get(i).getM_no();
			model.addAttribute("b_con", b_con);
			model.addAttribute("title", b_title);
			model.addAttribute("nick",nick);
			model.addAttribute("date",date);
			model.addAttribute("view",view);
			model.addAttribute("b_m_no", m_no);
		}
		iteamP ip = sqlSession.getMapper(iteamP.class);
		int count=ip.countComment_t(b_no);
		model.addAttribute("sessionm_no",session.getAttribute("m_no"));
		model.addAttribute("list",boardList);
		model.addAttribute("b_no",b_no);
		model.addAttribute("countComment",count);
		
		
		
		return "ReadphotoBoard";
	}
	@ResponseBody
	@RequestMapping("/delPhotoBoard")
	public String delPhotoBoard(@RequestParam("b_no") int b_no) {
		System.out.println(b_no);
		iphotoBoard ipt = sqlSession.getMapper(iphotoBoard.class);
		ipt.deletePhotoBoard(b_no);
		return "";
	}
	
	//setReview
	@ResponseBody
	@RequestMapping(value = "/setReview", produces = "application/text;charset=utf8")
	public String setReview(HttpServletRequest req) {
		HttpSession session = req.getSession();
		iphotoBoard ipt = sqlSession.getMapper(iphotoBoard.class);
		iteamP ip=sqlSession.getMapper(iteamP.class);
		int l_no=Integer.parseInt(req.getParameter("l_no"));
		int lmno=Integer.parseInt(req.getParameter("lmno"));
		int m_no = (int) session.getAttribute("m_no");
		int b_no=ipt.maxB_noFind(m_no);
		ipt.setReview(l_no, b_no);
		ArrayList<Integer> apMem= ip.getApplyMem(l_no);
		apMem.add(lmno);
		for(int i=0;i<apMem.size();i++) {
			if(m_no==apMem.get(i)) continue;
			String mes="&nbsp;&nbsp;&nbsp;&nbsp;회원님께서 참여하신 활동의 후기가 올라왔습니다.(<a id='goList' href='ReadPhoto?seq="+b_no+"'>게시판가기</a>)";
			ip.insertAlarm(apMem.get(i), mes);
		}
		return "";
	}
	
	//search nick
	@ResponseBody
	@RequestMapping(value="/searchPoNick",produces="application/text;charset=utf8",method = RequestMethod.POST)
	public String searchPoNick(HttpServletRequest req) {
		iphotoBoard ipt = sqlSession.getMapper(iphotoBoard.class);
		String table=req.getParameter("table");
		String search=req.getParameter("search");
		String board=req.getParameter("board");
		Map map=new HashMap();
		map.put("table", table);
		map.put("search", search);
		ArrayList<SearchPhoVO> arsvo=ipt.searchPoNick(map);
		JSONArray ja=new JSONArray();
		if(board.equals("P")) {
			for(int i=0;i<arsvo.size();i++) {
				SearchPhoVO spo=arsvo.get(i);
				JSONObject jo = new JSONObject();
				jo.put("b_no", spo.getB_no());
				jo.put("nick", spo.getNick());
				jo.put("route", spo.getRoute());
				jo.put("title", spo.getTitle());
				ja.add(jo);
			}
		}else if(board.equals("L")) {
			for(int i=0;i<arsvo.size();i++) {
				SearchPhoVO spo=arsvo.get(i);
				JSONObject jo = new JSONObject();
				jo.put("l_no", spo.getL_no());
				jo.put("nick", spo.getNick());
				jo.put("route", spo.getRoute());
				jo.put("title", spo.getTitle());
				jo.put("time", spo.getTime());
				jo.put("koo", spo.getL_koo());
				ja.add(jo);
			}
		}
		
		
		map.clear();
		return ja.toJSONString();
	}
	
	//search TNC photo
	@ResponseBody
	@RequestMapping(value="/searchPoTNC",produces="application/text;charset=utf8",method = RequestMethod.POST)
	public String searchPoTNC(HttpServletRequest req) {
		iphotoBoard ipt = sqlSession.getMapper(iphotoBoard.class);
		String search="'"+req.getParameter("search")+"'";
		
		Map map=new HashMap();
		map.put("search", search);
		
		ArrayList<SearchPhoVO> arsvo=ipt.searchPoTNC(map);
		JSONArray ja=new JSONArray();
		for(int i=0;i<arsvo.size();i++) {
			SearchPhoVO spo=arsvo.get(i);
			JSONObject jo = new JSONObject();
			jo.put("b_no", spo.getB_no());
			jo.put("route", spo.getRoute());
			jo.put("title", spo.getTitle());
			jo.put("con", spo.getCon());
			ja.add(jo);
		}
		
		map.clear();
		return ja.toJSONString();
	}
	
	//search TNC list
		@ResponseBody
		@RequestMapping(value="/searchLiTNC",produces="application/text;charset=utf8",method = RequestMethod.POST)
		public String searchLiTNC(HttpServletRequest req) {
			iphotoBoard ipt = sqlSession.getMapper(iphotoBoard.class);
			String search="'"+req.getParameter("search")+"'";
			
			Map map=new HashMap();
			map.put("search", search);
			
			ArrayList<SearchPhoVO> arsvo=ipt.searchLiTNC(map);
			JSONArray ja=new JSONArray();
			for(int i=0;i<arsvo.size();i++) {
				SearchPhoVO spo=arsvo.get(i);
				JSONObject jo = new JSONObject();
				jo.put("l_no", spo.getL_no());
				jo.put("route", spo.getRoute());
				jo.put("title", spo.getTitle());
				jo.put("con", spo.getCon());
				jo.put("nick", spo.getNick());
				jo.put("time", spo.getTime());
				jo.put("koo", spo.getL_koo());
				ja.add(jo);
			}
			
			map.clear();
			return ja.toJSONString();
		}
	
	
}
