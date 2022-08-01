package com.team.pj;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

@Controller
public class questionController {
	
	@Autowired
	private SqlSession sqlSession;
	//�ъ��遺��� ����
	/*
	 * @RequestMapping(value = "/qna", method = RequestMethod.GET) public String
	 * qnaPage() {
	 * 
	 * return "Q&A"; }
	 */
	
	//get faq list
	@RequestMapping("/qna")
	public String QnaList(HttpServletRequest req, Model model) {
		HttpSession session=req.getSession();
		if(session.getAttribute("id")==null) { //濡�洹몄�� ��
			model.addAttribute("userinfo",null);
			

		}else { //濡�洹몄�� �깃났 ��
			model.addAttribute("userinfo",session.getAttribute("id"));
			model.addAttribute("m_no", session.getAttribute("m_no"));
		}
		
		iQuestion qa = sqlSession.getMapper(iQuestion.class);
		ArrayList<qnaDTO> qnalist = qa.qnaList();
		model.addAttribute("faqList",qnalist);
		model.addAttribute("userinfo",session.getAttribute("id"));
		
		return "Q&A";
	}
	//faq answer
		@RequestMapping("/qnaanswer")
		public String QnaAnsewr(@RequestParam("q_no") int q_no, Model mod, HttpServletRequest req) {
			HttpSession session=req.getSession();
			if(session.getAttribute("id")==null) { //濡�洹몄�� ��
				mod.addAttribute("userinfo",null);
				

			}else { //濡�洹몄�� �깃났 ��
				mod.addAttribute("userinfo",session.getAttribute("id"));
				mod.addAttribute("m_no", session.getAttribute("m_no"));
			}
			iQuestion qa = sqlSession.getMapper(iQuestion.class);
			qnaDTO qdto = qa.answerList(q_no);	
			mod.addAttribute("qtitle", qdto.getQ_title());
			mod.addAttribute("qcontent", qdto.getQ_con());
			mod.addAttribute("qdate", qdto.getQ_date());
			mod.addAttribute("qmno", qdto.getQ_a());
			mod.addAttribute("qa", qdto.getQ_a());
			return "QnAanswer";
		}
	
	//get 1:1question list
	@RequestMapping("/question")
	public String question(HttpServletRequest req, Model model) {
		HttpSession session=req.getSession();
		iQuestion qa = sqlSession.getMapper(iQuestion.class);
		Integer m_no=(int) session.getAttribute("m_no");
		System.out.println(m_no);
		ArrayList<qnaDTO> qnalist=qa.question(m_no);
		JSONArray ja= new JSONArray();
		for(int i=0;i<qnalist.size();i++) {
			qnaDTO qdto= qnalist.get(i);
			JSONObject jo = new JSONObject();
			jo.put("q_no", qdto.getQ_no());
			jo.put("q_title", qdto.getQ_title());
			jo.put("q_con", qdto.getQ_con());
			jo.put("q_date", qdto.getQ_date());
			jo.put("m_no", qdto.getM_no());
			jo.put("q_a", qdto.getQ_a());
			ja.add(jo);
		}
		
			
			
	  model.addAttribute("userinfo",session.getAttribute("id"));		
	  model.addAttribute("list", ja); 
	  model.addAttribute("datalist", ja); 
	  model.addAttribute("answerlist", ja);
	  return "question";
			
//		return "question";
	}
	//1:1臾몄�� �듬�
	@RequestMapping("/questionAnswer")
	public String questionAnswer(@RequestParam("q_no") int q_no, Model mod) {
		iQuestion qa = sqlSession.getMapper(iQuestion.class);
		qnaDTO qdto = qa.answerList(q_no);	
		mod.addAttribute("qno", qdto.getQ_no());
		mod.addAttribute("qtitle", qdto.getQ_title());
		mod.addAttribute("qcontent", qdto.getQ_con());
		mod.addAttribute("qdate", qdto.getQ_date());
		mod.addAttribute("qmno", qdto.getQ_a());
		mod.addAttribute("qa", qdto.getQ_a());
		return "questionAnswer";
	}
	//1:1contact us
	@RequestMapping("/contactus")
	public String Contactus() {
		return "conTactus";
	}
	@ResponseBody
	@RequestMapping(value="/insertcontactus", produces="application/text;charset=utf8")
	public String insertContact(@RequestParam("title") String title,
								@RequestParam("content") String content,  HttpServletRequest req) {
		 HttpSession session=req.getSession(); 
		iQuestion qa = sqlSession.getMapper(iQuestion.class);
		int m_no=(int) session.getAttribute("m_no");
		qa.insertContactus(title, content, m_no);
		return "";
	}
}
