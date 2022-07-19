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
	//���⼭���� �ۼ�
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest req, Model model) {
		HttpSession session=req.getSession();
		if(session.getAttribute("newuser")==null) { //�α��� �ϱ� �� ����
			model.addAttribute("userinfo","");
			

		}else { //�α��� ���� ��
			model.addAttribute("userinfo",session.getAttribute("newuser"));
			
		}
		return "home";
		
	}
	@RequestMapping(value="/login", method=RequestMethod.GET)
	//�α��� �˾�
	public String doLogin(HttpServletRequest req, Model model) {
		HttpSession session=req.getSession();
//		req.getParameter("id");
//		req.getParameter("pw");
		return "login";
	}
	@RequestMapping(value="/signup", method=RequestMethod.GET)
	//ȸ������ �˾�
	public String doSignup() {
		return "signup";
	}
	@RequestMapping(value="/user_check", method=RequestMethod.POST)
	public String doCheck(HttpServletRequest req,Model model) {
		HttpSession session=req.getSession();
		iteamP m=sqlSession.getMapper(iteamP.class);
		ArrayList<memberDTO> mlist=m.listMember();
		model.addAttribute("signlist",mlist);
		int n=m.count(req.getParameter("id"),Integer.parseInt(req.getParameter("pw")));
		model.addAttribute("cnt",n);
		System.out.println("cnt="+n);
		
		String user_id=req.getParameter("id");
		String password=req.getParameter("pw");
		
		if(n==0) { //�α��� ����			
			session.setAttribute("newuser",null);
			//�α��ν��и� null�ؾߵ� "/"���� nullüũ �ؾߵǴϱ�~
		}else if(n!=1) { //����
			
		}else {	//�α��� ����	
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
	@RequestMapping(value="/sign", method=RequestMethod.POST)
	//ȸ������
	public String doSign(@RequestParam String pid,@RequestParam String ppw,@RequestParam String pname,
			@RequestParam String pnick,@RequestParam String pphone,
			@RequestParam String pgender,@RequestParam String pmail,
			@RequestParam String pbirth,Model model) {
		iteamP p=sqlSession.getMapper(iteamP.class);
		System.out.println("id="+pid);
		p.insert(pid,ppw,pname,pnick,pphone,pgender,pmail,pbirth);
		return "redirect:/login";
	}
	
}