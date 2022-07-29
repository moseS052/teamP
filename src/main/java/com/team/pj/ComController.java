package com.team.pj;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


/**
 * Handles requests for the application home page.
 */
@Controller
public class ComController {

	@Autowired
	private SqlSession sqlSession;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	//여기서부터 작성
	
	//댓글 jsp
	@RequestMapping("/com")
	public String doList() {
		return "comment";
	}

	// 댓글 리스트 불러오기
	@ResponseBody
	@RequestMapping(value = "/comment", produces = "application/json;charset=utf-8")
	public String comment(@RequestParam("page") int page) {
		iteamP tp = sqlSession.getMapper(iteamP.class);
		
		ArrayList<commentDTO> comlist = tp.comlist(page);
		JSONArray ja = new JSONArray();
		for (int i = 0; i < comlist.size(); i++) {
			commentDTO cdto = comlist.get(i);
			JSONObject jo = new JSONObject();
			jo.put("count", tp.countre_replylist(cdto.getC_no()));
			jo.put("c_no", cdto.getC_no());
			jo.put("b_no", cdto.getB_no());
			jo.put("c_con", cdto.getC_con());
			jo.put("m_no", cdto.getM_no());
			jo.put("c_date", cdto.getC_date());
			jo.put("c_pa_no", cdto.getC_pa_no());
			jo.put("nick", cdto.getNick());
			ja.add(jo);
		}
		System.out.println(ja.toJSONString());
		return ja.toJSONString();
	}

	// 댓글 등록
	@ResponseBody
	@RequestMapping(value = "/insertcomment", method = RequestMethod.POST)
	public void insertComment(@RequestParam("b_no") int b_no, @RequestParam("c_con") String c_con,
			HttpServletRequest req) {
		HttpSession session=req.getSession();
		int m_no=(int)session.getAttribute("m_no");
		iteamP tp = sqlSession.getMapper(iteamP.class);
		tp.insertcomment(b_no, c_con, m_no);

	}

	// 댓글 삭제
	@ResponseBody
	@RequestMapping(value = "/delete_comment", method = RequestMethod.GET)
	public String deleteComment(@RequestParam("c_no") int c_no) {
		iteamP tp = sqlSession.getMapper(iteamP.class);
		int reccount = tp.deletecomment(c_no);
		System.out.println("��湲�踰��몃��=" + c_no);
		return Integer.toString(reccount);
	}

	// 댓글 수정
	@ResponseBody
	@RequestMapping("/update_comment")
	public String updatecommnet(@RequestParam("c_no") int c_no, @RequestParam("c_con") String c_con) {
		iteamP tp = sqlSession.getMapper(iteamP.class);
		int reccount = tp.updatecomment(c_con, c_no);
		return Integer.toString(reccount);
	}

	// 대댓글 목록 출력
	@ResponseBody
	@RequestMapping(value = "/re_reply", produces = "application/json;charset=utf-8")
	public String rereplylist(@RequestParam("c_no") int c_no) {
		iteamP tp = sqlSession.getMapper(iteamP.class);

		ArrayList<commentDTO> re_replylist = tp.re_replylist(c_no);
		System.out.println(re_replylist.size());
		System.out.println("re_replylist:" + re_replylist);
		JSONArray ja = new JSONArray();
		for (int i = 0; i < re_replylist.size(); i++) {
			commentDTO adto = re_replylist.get(i);
			JSONObject jo = new JSONObject();
			jo.put("c_no", adto.getC_no());
			jo.put("b_no", adto.getB_no());
			jo.put("c_con", adto.getC_con());
			jo.put("m_no", adto.getM_no());
			jo.put("c_date", adto.getC_date());
			jo.put("c_pa_no", adto.getC_pa_no());
			jo.put("nick", adto.getNick());
			ja.add(jo);
			
		}
		return ja.toJSONString();
	}

	// 대댓글 등록
	@ResponseBody
	@RequestMapping(value = "/re_replyinsert", produces = "application/json;charset=utf-8", method = RequestMethod.POST)
	public String re_replyinsert(@RequestParam("b_no") int b_no, @RequestParam("c_pa_no") int c_pa_no,
			@RequestParam("c_con") String c_con, HttpServletRequest req) {
		iteamP tp = sqlSession.getMapper(iteamP.class);
		HttpSession session=req.getSession();
		int m_no=(int)session.getAttribute("m_no");

		int reccount = tp.insertReRply(b_no, c_con, m_no, c_pa_no);

		return Integer.toString(reccount);
	}

	// 대댓글 삭제
	@ResponseBody
	@RequestMapping(value = "/re_replydelete", produces = "application/json;charset=utf-8", method = RequestMethod.POST)
	public String re_replydelete(@RequestParam("c_no") int c_no) {
		iteamP tp = sqlSession.getMapper(iteamP.class);
		int reccount = tp.deleteReReply(c_no);
		return Integer.toString(reccount);
	}

	// 대댓글 수정
	@ResponseBody
	@RequestMapping(value = "/re_replyupdate", produces = "application/json;charset=utf-8", method = RequestMethod.POST)
	public String re_replyupdate(@RequestParam("c_no") int c_no,
								 @RequestParam("b_no") int b_no,
								 @RequestParam("c_con") String c_con,
								 @RequestParam("m_no") int m_no,
								 @RequestParam("c_pa_no") int c_pa_no) {
		iteamP tp = sqlSession.getMapper(iteamP.class);
		int reccount = tp.updateReReply(c_no, b_no, c_con, m_no, c_pa_no);
		return Integer.toString(reccount);
	}
	
	
	
	
	
	

	
}

