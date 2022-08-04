package com.team.pj;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class LcommentController {

	@Autowired
	private SqlSession sqlSession;
	
	// 댓글 등록
		@ResponseBody
		@RequestMapping(value = "/insertL_comment", method = RequestMethod.POST)
		public void insertComment(@RequestParam("l_no") int l_no, @RequestParam("c_con") String c_con,
				HttpServletRequest req) {
			HttpSession session=req.getSession();
			int m_no=(int)session.getAttribute("m_no");
			iLcomment ltp = sqlSession.getMapper(iLcomment.class);
			ltp.insertL_comment(l_no, c_con, m_no);
			
		}
		
		@ResponseBody
		@RequestMapping(value = "/LcommentList", produces = "application/json;charset=utf-8")
		public String comment(@RequestParam("page") int page, @RequestParam("pagenum") int pagenum) {
			iLcomment ltp = sqlSession.getMapper(iLcomment.class);
			
			ArrayList<LcommentDTO> Lcomlist = ltp.Lcomlist(pagenum,page);
			JSONArray ja = new JSONArray();
			for (int i = 0; i < Lcomlist.size(); i++) {
				LcommentDTO lcdto = Lcomlist.get(i);
				JSONObject jo = new JSONObject();
				jo.put("count", ltp.countLre_replylist(lcdto.getC_no()));
				jo.put("c_no", lcdto.getC_no());
				jo.put("l_no", lcdto.getL_no());
				jo.put("c_con", lcdto.getC_con());
				jo.put("m_no", lcdto.getM_no());
				jo.put("c_date", lcdto.getC_date());
				jo.put("c_pa_no", lcdto.getC_pa_no());
				jo.put("nick", lcdto.getNick());
				ja.add(jo);
			}
//			System.out.println(ja.toJSONString());
			return ja.toJSONString();
		}
		// 대댓글 등록
		@ResponseBody
		@RequestMapping(value = "/Lre_replyinsert", produces = "application/json;charset=utf-8", method = RequestMethod.POST)
		public String re_replyinsert(@RequestParam("l_no") int l_no, @RequestParam("c_pa_no") int c_pa_no,
				@RequestParam("c_con") String c_con, HttpServletRequest req) {
			iLcomment ltp = sqlSession.getMapper(iLcomment.class);
			HttpSession session=req.getSession();
			int m_no=(int)session.getAttribute("m_no");

			int reccount = ltp.insertL_ReRply(l_no, c_con, m_no, c_pa_no);

			return Integer.toString(reccount);
		}
		// 대댓글 삭제
		@ResponseBody
		@RequestMapping(value = "/Lre_replydelete", produces = "application/json;charset=utf-8", method = RequestMethod.POST)
		public String re_replydelete(@RequestParam("c_no") int c_no) {
			iLcomment ltp = sqlSession.getMapper(iLcomment.class);
			int reccount = ltp.deleteL_ReReply(c_no);
			return Integer.toString(reccount);
		}
		// 대댓글 목록 출력
		@ResponseBody
		@RequestMapping(value = "/Lre_reply", produces = "application/json;charset=utf-8")
		public String rereplylist(@RequestParam("c_no") int c_no) {
			iLcomment ltp = sqlSession.getMapper(iLcomment.class);

			ArrayList<LcommentDTO> re_replylist = ltp.Lre_replylist(c_no);
			JSONArray ja = new JSONArray();
			for (int i = 0; i < re_replylist.size(); i++) {
				LcommentDTO Ldto = re_replylist.get(i);
				JSONObject jo = new JSONObject();
				jo.put("c_no", Ldto.getC_no());
				jo.put("l_no", Ldto.getL_no());
				jo.put("c_con", Ldto.getC_con());
				jo.put("m_no", Ldto.getM_no());
				jo.put("c_date", Ldto.getC_date());
				jo.put("c_pa_no", Ldto.getC_pa_no());
				jo.put("nick", Ldto.getNick());
				ja.add(jo);
				
			}
			return ja.toJSONString();
		}
		// 대댓글 수정
		@ResponseBody
		@RequestMapping(value = "/Lre_replyupdate", produces = "application/json;charset=utf-8", method = RequestMethod.POST)
		public String re_replyupdate(@RequestParam("c_no") int c_no,
									 @RequestParam("l_no") int l_no,
									 @RequestParam("c_con") String c_con,
									 @RequestParam("m_no") int m_no,
									 @RequestParam("c_pa_no") int c_pa_no) {
			iLcomment ltp = sqlSession.getMapper(iLcomment.class);
			int reccount = ltp.updateLReReply(c_no, l_no, c_con, m_no, c_pa_no);
			return Integer.toString(reccount);
		}
		
		// 댓글 수정
		@ResponseBody
		@RequestMapping("/update_Lcomment")
		public String updatecommnet(@RequestParam("c_no") int c_no, @RequestParam("c_con") String c_con) {
			iLcomment ltp = sqlSession.getMapper(iLcomment.class);
			int reccount = ltp.updateLcomment(c_con, c_no);
			return Integer.toString(reccount);
		}
		
		// 댓글 삭제
		@ResponseBody
		@RequestMapping(value = "/delete_Lcomment", method = RequestMethod.GET)
		public String deleteComment(@RequestParam("c_no") int c_no) {
			iLcomment ltp = sqlSession.getMapper(iLcomment.class);
			int reccount = ltp.deleteLcomment(c_no);
			return Integer.toString(reccount);
		}
}
