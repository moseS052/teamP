package com.team.pj;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
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
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	private SqlSession sqlSession;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	//占실듸옙占쏙옙 占쏙옙占쏙옙占쏙옙

//	@RequestMapping(value = "/", method = RequestMethod.GET)
//	public String home() {
//		
//		return "home";
//	}
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest req, Model model) {
		HttpSession session=req.getSession();
		if(session.getAttribute("id")==null) { //濡�洹몄�� ��
			model.addAttribute("userinfo","");
			

		}else { //濡�洹몄�� �깃났 ��
			model.addAttribute("userinfo",session.getAttribute("id"));
			model.addAttribute("m_no",session.getAttribute("m_no"));
			model.addAttribute("nick",session.getAttribute("nick"));
		}
		return "home";
		
	}
	//濡�洹몄��
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String doLogin() {
		return "login";
	}
	//����媛���jsp
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
		
		if(n==0) { //濡�洹몄�� �ㅽ��			
			session.setAttribute("m_no",null);
			
		}else if(n!=1) { //����
			
		}else {	//濡�洹몄�� �깃났
			session.setAttribute("m_no",p.getM_no1(user_id));
			session.setAttribute("nick",p.getNickById(user_id));
			session.setAttribute("id", user_id);
			model.addAttribute("id",session.getAttribute("id"));
			model.addAttribute("m_no",session.getAttribute("m_no"));
			model.addAttribute("nick",session.getAttribute("nick"));
		}
		return "redirect:/";
	}
	//濡�洹몄����
	@RequestMapping("/logout")
	public String doLogout(HttpServletRequest req) {
		HttpSession session=req.getSession();
		session.invalidate();
		return "redirect:/";
	}
	//����媛���
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
	//����媛����� �щ�μ껜�ы���대����� 異�媛�
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
	//���대�� 以�蹂듭껜��
	@ResponseBody
	@RequestMapping(value="/idcheck", method=RequestMethod.GET, produces="application/text;charset=utf8")
	public String doIdcheck(@RequestParam("id") String id, Model model) {
		iteamP p=sqlSession.getMapper(iteamP.class);
		int idcnt=p.id(id);
		System.out.println("idcnt="+idcnt);
		return Integer.toString(idcnt);		
	}
	//���ㅼ�� 以�蹂듭껜��
	@ResponseBody
	@RequestMapping(value="/nickcheck", method=RequestMethod.GET, produces="application/text;charset=utf8")
	public String doNickcheck(@RequestParam("nick") String nick, Model model) {
		iteamP p=sqlSession.getMapper(iteamP.class);
		int nickcnt=p.nick(nick);
		System.out.println("idcnt="+nickcnt);
		return Integer.toString(nickcnt);		
	}
	
	
	@RequestMapping(value = "/ad", method = RequestMethod.GET)
	public String ad() {
		
		return "addjsp";
	}

	//session example
	@RequestMapping(value = "/meminfo", method = RequestMethod.GET)
	public String meminfo(HttpServletRequest req, Model model) {
		HttpSession session=req.getSession();
		model.addAttribute("id",session.getAttribute("id"));
		model.addAttribute("m_no",session.getAttribute("m_no"));
		model.addAttribute("nick",session.getAttribute("nick"));
		
		//占쏙옙占쏙옙
		return "memf";
	}
	
	//占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙(占쏙옙占쏙옙트 占쌩깍옙)
	@RequestMapping(value = "/note", method = RequestMethod.GET)
	public String note(HttpServletRequest req, Model model) {
		model.addAttribute("mno",req.getParameter("m_no")); //占쏙옙占쏙옙占십울옙
		model.addAttribute("mpano",req.getParameter("m_pa_no"));
		return "note";
	}
	
	//占쏙옙占쏙옙 占쏙옙占쏙옙트占쏙옙
	@ResponseBody
	@RequestMapping(value="/noteUp",produces="application/text;charset=utf8")
	public String noteUp(HttpServletRequest req) {
		int m_no=Integer.parseInt(req.getParameter("m_no"));
		int m_pa_no=Integer.parseInt(req.getParameter("m_pa_no"));
		iteamP ip=sqlSession.getMapper(iteamP.class);
		ArrayList<noteVO> arno=ip.getNoteCon(m_no,m_pa_no);  //占쏙옙占쏙옙
		JSONArray ja=new JSONArray();
		for(int i=0;i<arno.size();i++) {
			noteVO nvo=arno.get(i);
			JSONObject jo=new JSONObject();
			jo.put("n_no", nvo.getN_no());
			jo.put("n_con", nvo.getN_con());
			jo.put("n_date", nvo.getN_date());
			jo.put("m_no",nvo.getM_no());
			jo.put("m_pa_no", nvo.getM_pa_no());
			ja.add(jo);
		}
		return ja.toJSONString();
	}
	
	//占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙트占싼뤄옙
	@ResponseBody
	@RequestMapping(value="/noteSend",produces="application/text;charset=utf8")
	public String noteSend(HttpServletRequest req) {
		iteamP ip=sqlSession.getMapper(iteamP.class);
		String con=req.getParameter("n_con");
		int you=Integer.parseInt(req.getParameter("youseq"));
		int me=1; //占쏙옙占실몌옙占쏙옙占쏙옙 占쏙옙占실억옙 占쏙옙
		ip.noteSend(me, you, con);
		return "";
	}
}
