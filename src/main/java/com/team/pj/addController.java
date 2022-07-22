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
import org.springframework.web.bind.annotation.ResponseBody;



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
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest req, Model model) {
		HttpSession session=req.getSession();
		if(session.getAttribute("newuser")==null) { //로그인 하기 전 상태
			model.addAttribute("userinfo","");
			

		}else { //로그인 성공 후
			model.addAttribute("userinfo",session.getAttribute("newuser"));
			
		}
		return "home";
		
	}
	//로그인
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String doLogin() {
		return "login";
	}
	//회원가입
	@RequestMapping(value="/signup", method=RequestMethod.GET)
	public String doSignup() {
		return "signup";
	}
	@RequestMapping(value="/user_check", method=RequestMethod.POST)
	public String doCheck(HttpServletRequest req,Model model) {
		HttpSession session=req.getSession();
		iteamP p=sqlSession.getMapper(iteamP.class);
		ArrayList<memberDTO> mlist=p.listMember();
		model.addAttribute("signlist",mlist);
		int n=p.count(req.getParameter("id"),Integer.parseInt(req.getParameter("pw")));
		model.addAttribute("cnt",n);
		System.out.println("cnt="+n);
		
		String user_id=req.getParameter("id");
		String password=req.getParameter("pw");
		
		if(n==0) { //로그인 실패			
			session.setAttribute("newuser",null);
			
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
	//회원가입
	@ResponseBody
	@RequestMapping(value="/sign", method=RequestMethod.POST, produces="application/text;charset=utf8")
	public String doSign(@RequestParam("id") String id,@RequestParam("pw") String pw,
			@RequestParam("name") String name,
			@RequestParam("nick") String nick,@RequestParam("phone") String phone,
			@RequestParam("gender") String gender,@RequestParam("mail") String mail,
			@RequestParam("birth") String birth) {
		iteamP p=sqlSession.getMapper(iteamP.class);
		System.out.println("id="+id);
		p.insert(id,pw,name,nick,phone,gender,mail,birth);
		
		return "";
	}
	//회원가입시 재능체크테이블에도 추가 
	@ResponseBody
	@RequestMapping(value="/talent", method=RequestMethod.POST, produces="application/text;charset=utf8")
	public String doTalent(@RequestParam("id") String id, @RequestParam("t_no") String t_no) {
		iteamP p=sqlSession.getMapper(iteamP.class);
		String[] a = t_no.split(" ");
		for(int i=0; i<a.length;i++) {
			p.talent(p.getM_no1(id),Integer.parseInt(a[i]));
			System.out.println("t_no="+a[i]);
		}
		
		
		return "";
	}
	//아이디 중복체크
	@ResponseBody
	@RequestMapping(value="/idcheck", method=RequestMethod.GET, produces="application/text;charset=utf8")
	public String doIdcheck(@RequestParam("id") String id, Model model) {
		iteamP p=sqlSession.getMapper(iteamP.class);
		int idcnt=p.id(id);
		System.out.println("idcnt="+idcnt);
		return Integer.toString(idcnt);		
	}
	//닉네임 중복체크
	@ResponseBody
	@RequestMapping(value="/nickcheck", method=RequestMethod.GET, produces="application/text;charset=utf8")
	public String doNickcheck(@RequestParam("nick") String nick, Model model) {
		iteamP p=sqlSession.getMapper(iteamP.class);
		int nickcnt=p.nick(nick);
		System.out.println("idcnt="+nickcnt);
		return Integer.toString(nickcnt);		
	}
}