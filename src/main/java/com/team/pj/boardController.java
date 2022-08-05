package com.team.pj;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
		int countFree_board=p.countFree_board();
		int pagenum=Integer.parseInt(req.getParameter("pagenum"));
		ArrayList<boardDTO> blist=p.listBoard(pagenum);
		mod.addAttribute("boardlist",blist);
		mod.addAttribute("countFree_board",countFree_board);
		mod.addAttribute("pagenum",pagenum);
		return "freeboard";
	}	
	//go to new post page in free board
	@RequestMapping("/newpost_fb")
	public String doNewPost(HttpServletRequest req, Model model) {
		HttpSession session=req.getSession();
		model.addAttribute("m_no", session.getAttribute("m_no"));
		model.addAttribute("id",session.getAttribute("id"));
		
		return "newpost_fb";
	}
	//insert new post in free board
	@ResponseBody
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
		return "";
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
		int count=p.countComment_t(b_no);
		model.addAttribute("countComment",count);
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
		int pagenum=Integer.parseInt(req.getParameter("pagenum"));
		int countboardq=p.countBoardq();
		ArrayList<boardDTO> blist=p.reqBoard(pagenum);
		mod.addAttribute("boardlist",blist);
		mod.addAttribute("countboardq",countboardq);
		mod.addAttribute("pagenum",pagenum);
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
		return "redirect:/reqboard?pagenum=1";
	}
	//view detail on request board
	@RequestMapping("/reqdetail")
	public String doDetail_req(HttpServletRequest req ,Model model) {
		iteamP p=sqlSession.getMapper(iteamP.class);
		HttpSession session =req.getSession();		
		model.addAttribute("m_no", session.getAttribute("m_no"));
		model.addAttribute("id",session.getAttribute("id"));
		int b_no=Integer.parseInt(req.getParameter("b_no"));
		int count=p.countComment_t(b_no);
		p.free_viewcnt(b_no);
		boardDTO bdto=p.req_detail(b_no);
		model.addAttribute("bdto",bdto);
		model.addAttribute("sessionm_no",session.getAttribute("m_no"));
		model.addAttribute("countComment",count);
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
	//freeboard in Photo
	@ResponseBody
	@RequestMapping(value="/freeBoard_inPhoto", method=RequestMethod.POST,  produces = "application/text;charset=utf8")
	public String freeBoard_insertPhoto(HttpServletRequest req, MultipartHttpServletRequest request) {
		HttpSession session =req.getSession();
		iphotoBoard ipt = sqlSession.getMapper(iphotoBoard.class);
		iteamP p=sqlSession.getMapper(iteamP.class);
		int maxb_no=p.findMaxb_no((int)session.getAttribute("m_no"));
		System.out.println("제발="+maxb_no);
		String uploadFolder = "C:/Users/admin/teampro/teamP/src/main/webapp/resources/assets/freeBoard/";
		String realDataFolder = "/resources/assets/freeBoard/";
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
				 ipt.insertphotoRoute(maxb_no, realDataFolder + uniqueName + fileExtension);
				 
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}

		}
		return"";
	}
}
