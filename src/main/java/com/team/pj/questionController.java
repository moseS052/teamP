package com.team.pj;

import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

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
	//여서부터 작성
	/*
	 * @RequestMapping(value = "/qna", method = RequestMethod.GET) public String
	 * qnaPage() {
	 * 
	 * return "Q&A"; }
	 */
	
	//get qna list
	@RequestMapping("/qna")
	public String QnaList(Model model) {
		iQuestion qa = sqlSession.getMapper(iQuestion.class);
		ArrayList<qnaDTO> qnalist = qa.qnaList();
		model.addAttribute("faqList",qnalist);
		
		return "Q&A";
	}
	@RequestMapping("/question")
	public String question(Model model) {

		return "question";
	}
	
	@RequestMapping("/qnaanswer")
	public String QnaAnsewr(@RequestParam("q_no") int q_no, Model mod) {
		iQuestion qa = sqlSession.getMapper(iQuestion.class);
		qnaDTO qdto = qa.answerList(q_no);	
		mod.addAttribute("qtitle", qdto.getQ_title());
		mod.addAttribute("qcontent", qdto.getQ_con());
		mod.addAttribute("qdate", qdto.getQ_date());
		mod.addAttribute("qmno", qdto.getQ_a());
		mod.addAttribute("qa", qdto.getQ_a());
		return "QnAanswer";
	}
	
	
}
