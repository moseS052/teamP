package com.team.pj;

import java.util.ArrayList;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class boardController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	private SqlSession sqlSession;
	//----------------------------------------------------free board
	//go to free board
	@RequestMapping(value="/freeboard", method=RequestMethod.GET)
	public String doFreeboard(HttpServletRequest req, Model mod) {
		iteamP p=sqlSession.getMapper(iteamP.class);
		HttpSession session =req.getSession();
		
		if(session.getAttribute("m_no")!=null) {
			mod.addAttribute("m_no", session.getAttribute("m_no"));
			mod.addAttribute("id",session.getAttribute("id"));
		}else {
			mod.addAttribute("m_no", null);
		}
		ArrayList<boardDTO> blist=p.listBoard();
		mod.addAttribute("boardlist",blist);
		return "freeboard";
	}	
	//go to new post page in free board
	@RequestMapping("/newpost_write")
	public String doNewPost(HttpServletRequest req, Model model) {
		HttpSession session=req.getSession();
		model.addAttribute("m_no", session.getAttribute("m_no"));
		model.addAttribute("id",session.getAttribute("id"));
		
		return "newpost_fb";
	}
	//insert new post in free board
	@RequestMapping(value="/insert_free")
	public String doInsert_free(HttpServletRequest req,Model model) {
		iteamP p=sqlSession.getMapper(iteamP.class);
		HttpSession session=req.getSession();
		String btitle=req.getParameter("title");
		String bcontent=req.getParameter("content");		
		System.out.println("title="+btitle);
		System.out.println("content="+bcontent);
		System.out.println("writer="+(int)session.getAttribute("m_no"));
		p.free_insert((int)session.getAttribute("m_no"),btitle, bcontent);
		return "redirect:/freeboard";
	}
	//delete in free board & req board
	@ResponseBody
	@RequestMapping("/delete_free")
	public String doDelete_free(HttpServletRequest req,Model model) {
		iteamP p=sqlSession.getMapper(iteamP.class);
		//HttpSession session=req.getSession();
		int bseq=Integer.parseInt(req.getParameter("b_no"));
		System.out.println("delete b_no"+bseq);
		p.free_delete(bseq);
		return "";
	}
	//view detail on free board
	@RequestMapping("/freedetail")
	public String doDetail(HttpServletRequest req ,Model model) {
		iteamP p=sqlSession.getMapper(iteamP.class);
		HttpSession session =req.getSession();		
		model.addAttribute("m_no", session.getAttribute("m_no"));
		model.addAttribute("id",session.getAttribute("id"));
		int b_no=Integer.parseInt(req.getParameter("b_no"));
		p.free_viewcnt(b_no);
		boardDTO bdto=p.free_detail(b_no);
		model.addAttribute("b_no",b_no);
		model.addAttribute("bdto",bdto);
		model.addAttribute("sessionm_no",session.getAttribute("m_no"));
		
		return "freedetail";
	}
	//view update page on free board
	@RequestMapping("/updetail")
	public String doUpdetail(HttpServletRequest req,Model model) {
		iteamP p=sqlSession.getMapper(iteamP.class);
		HttpSession session =req.getSession();		
		model.addAttribute("m_no", session.getAttribute("m_no"));
		model.addAttribute("id",session.getAttribute("id"));
		int b_no=Integer.parseInt(req.getParameter("b_no"));
		boardDTO bdto=p.free_detail(b_no);
		model.addAttribute("bdto",bdto);
		return "updetail";
	}
	//update in free board & req board
	@ResponseBody
	@RequestMapping("/update_free")
	public String doUpdate(HttpServletRequest req,Model model) {
		String btitle=req.getParameter("b_title");
		String bcontent=req.getParameter("b_con");
		int bseq=Integer.parseInt(req.getParameter("b_no"));
		System.out.println("update title="+btitle);
		System.out.println("update content="+bcontent);
		System.out.println("update seqbbs="+bseq);
		iteamP p=sqlSession.getMapper(iteamP.class);
		p.free_update(btitle,bcontent,bseq);		
		return "";
	}
	//---------------------------------------------request board
	//go to request board
	@RequestMapping(value="/reqboard", method=RequestMethod.GET)
	public String doRequestboard(HttpServletRequest req, Model mod) {
		iteamP p=sqlSession.getMapper(iteamP.class);
		HttpSession session =req.getSession();
		
		if(session.getAttribute("m_no")!=null) {
			mod.addAttribute("m_no", session.getAttribute("m_no"));
			mod.addAttribute("id",session.getAttribute("id"));
		}else {
			mod.addAttribute("m_no", null);
		}	

		ArrayList<boardDTO> blist=p.reqBoard();
		mod.addAttribute("boardlist",blist);
		return "reqboard";
	}	
	//go to new post page in request board
	@RequestMapping("/newpost_req")
	public String doNewrequest(HttpServletRequest req, Model model) {
		HttpSession session=req.getSession();
		model.addAttribute("m_no", session.getAttribute("m_no"));
		model.addAttribute("id",session.getAttribute("id"));
		
		return "newpost_req";
	}
	//insert new post in request board
	@RequestMapping(value="/insert_req")
	public String doInsert_req(HttpServletRequest req,Model model) {
		iteamP p=sqlSession.getMapper(iteamP.class);
		HttpSession session=req.getSession();
		String btitle=req.getParameter("title");
		String bcontent=req.getParameter("content");		
		System.out.println("title="+btitle);
		System.out.println("content="+bcontent);
		System.out.println("writer="+(int)session.getAttribute("m_no"));
		p.req_insert((int)session.getAttribute("m_no"),btitle, bcontent);
		return "redirect:/reqboard";
	}
	//view detail on request board
	@RequestMapping("/reqdetail")
	public String doDetail_req(HttpServletRequest req ,Model model) {
		iteamP p=sqlSession.getMapper(iteamP.class);
		HttpSession session =req.getSession();		
		model.addAttribute("m_no", session.getAttribute("m_no"));
		model.addAttribute("id",session.getAttribute("id"));
		int b_no=Integer.parseInt(req.getParameter("b_no"));
		p.free_viewcnt(b_no);
		boardDTO bdto=p.req_detail(b_no);
		model.addAttribute("bdto",bdto);
		model.addAttribute("sessionm_no",session.getAttribute("m_no"));
		return "reqdetail";
	}
	//view update page on request board
	@RequestMapping("/requpdetail")
	public String doReq_updetail(HttpServletRequest req,Model model) {
		iteamP p=sqlSession.getMapper(iteamP.class);
		HttpSession session =req.getSession();		
		model.addAttribute("m_no", session.getAttribute("m_no"));
		model.addAttribute("id",session.getAttribute("id"));
		int b_no=Integer.parseInt(req.getParameter("b_no"));
		boardDTO bdto=p.req_detail(b_no);
		model.addAttribute("bdto",bdto);
		return "requpdetail";
	}
}
