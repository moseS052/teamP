package com.team.pj;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class addController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	private SqlSession sqlSession;
	//go to free board
	@RequestMapping(value="/freeboard", method=RequestMethod.GET)
	public String doFreeboard(HttpServletRequest req, Model mod) {
		HttpSession session =req.getSession();
		mod.addAttribute("m_no", session.getAttribute("m_no")); 
		return "freeboard";
	}
	//view list on free board
	@RequestMapping(value="/list", method=RequestMethod.POST)
	public String doList() {
		return "";
	}
	//go to new post page in free board
	@RequestMapping("/newpost_write")
	public String doNewPost() {
		return "newpost_fb";
	}
	//insert new post in free board
	@RequestMapping(value="/insert_fb",method=RequestMethod.POST)
	public String doInsert_fb(HttpServletRequest req,Model model) {
		iBoard b=sqlSession.getMapper(iBoard.class);
		HttpSession session=req.getSession();
		String btitle=req.getParameter("title");
		String bcontent=req.getParameter("content");		
		System.out.println("title="+btitle);
		System.out.println("content="+bcontent);
		System.out.println("writer="+(int)session.getAttribute("m_no"));
		b.fb_insert((int)session.getAttribute("m_no"),btitle, bcontent);
		return "redirect:/";
	}
}
