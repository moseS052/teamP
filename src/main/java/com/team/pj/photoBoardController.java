package com.team.pj;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
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
		if (session.getAttribute("id") == null) { // 로그인 전
			model.addAttribute("userinfo", null);

		} else { // 로그인 성공 후
			model.addAttribute("userinfo", session.getAttribute("id"));

		}
		

		
		iphotoBoard ipt = sqlSession.getMapper(iphotoBoard.class);
		
		ArrayList<photoBoardDTO> pdtolist = ipt.photoTableList(stanum, endnum);
		int total=ipt.getTotal();
		 model.addAttribute("photolist", pdtolist);
		 model.addAttribute("total", total);
		

		return "phothBoard";
	}

	@RequestMapping("/donationReviwe")
	String donationReview(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		if (session.getAttribute("id") == null) { // 로그인 전
			model.addAttribute("userinfo", null);

		} else { // 로그인 성공 후
			model.addAttribute("userinfo", session.getAttribute("id"));

		}

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
		String uploadFolder = "C:/Users/admin/teampro/teamP/src/main/webapp/resources/assets/userimg/";
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
		if (session.getAttribute("id") == null) { // 로그인 전
			model.addAttribute("userinfo", null);

		} else { // 로그인 성공 후
			model.addAttribute("userinfo", session.getAttribute("id"));

		}
		
		
		iphotoBoard ipt = sqlSession.getMapper(iphotoBoard.class);
		ArrayList<photoBoardDTO> boardList=ipt.ReadPhotoBoard(b_no);
				
		model.addAttribute("list",boardList);
		
		return "ReadphotoBoard";
	}
}
