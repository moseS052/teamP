package com.team.pj;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class photoBoardController {
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/photoBoard")
	public String phothBoard(HttpServletRequest req, Model model) {
		HttpSession session=req.getSession();
		if(session.getAttribute("id")==null) { //로그인 전
			model.addAttribute("userinfo",null);
			

		}else { //로그인 성공 후
			model.addAttribute("userinfo",session.getAttribute("id"));
			
		}
		return"phothBoard";
	}
}
