package com.team.pj;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

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



/**
 * Handles requests for the application home page.
 */
@Controller
public class addController {
	
	@Autowired
	private SqlSession sqlSession;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	//여기서부터 작성
//	@RequestMapping(value = "/", method = RequestMethod.GET)
//	public String home(HttpServletRequest req, Model model) {
//		HttpSession session=req.getSession();
//		if(session.getAttribute("newuser")==null) { //로그인 하기 전 상태
//			model.addAttribute("userinfo","");
//
//		}else { //로그인 성공 후
//			model.addAttribute("userinfo",session.getAttribute("newuser"));
//		}
//		
//		return "redirect:/";
//	}
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String doLogin() {
		return "login";
	}
	@RequestMapping(value="/user_check", method=RequestMethod.POST)
	public String doCheck(HttpServletRequest req,Model model) {
		HttpSession session=req.getSession();
		iteamP m=sqlSession.getMapper(iteamP.class);
		ArrayList<memberDTO> mlist=m.listMember();
		model.addAttribute("signlist",mlist);
		int n=m.count(req.getParameter("id"),Integer.parseInt(req.getParameter("pw")));
		model.addAttribute("cnt",n);
		
		String user_id=req.getParameter("id");
		String password=req.getParameter("pw");
		
		if(n==0) { //로그인 실패			
			session.setAttribute("newuser",null);
			//로그인실패면 null해야됨 "/"에서 null체크 해야되니까~
		}else if(n!=1) { //에러
			
		}else {	//로그인 성공	
			session.setAttribute("newuser",user_id);			
		}
		return "redirect:/";
	}
	@RequestMapping("/logout")
	public String doLogout(HttpServletRequest req) {
		HttpSession session=req.getSession();
		session.invalidate();
		return "redirect:/";
	}
	@RequestMapping(value="/signup", method=RequestMethod.POST)
	//회원가입
	public String doSignup(@RequestParam String pid,@RequestParam String ppwd,@RequestParam String pname,
			@RequestParam String pnick,@RequestParam String pphone,
			@RequestParam String pgender,@RequestParam String pmail,
			@RequestParam String pbirth,Model model) {
		iteamP p=sqlSession.getMapper(iteamP.class);
		p.insert(pid,ppwd,pname,pnick,pphone,pgender,pmail,pbirth);
		return "redirect:/login";
	}
	
}