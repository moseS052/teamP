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
	//�ǵ��� ������

//	@RequestMapping(value = "/", method = RequestMethod.GET)
//	public String home() {
//		
//		return "home";
//	}
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest req, Model model) {
		HttpSession session=req.getSession();
		if(session.getAttribute("newuser")==null) { //로그인 전
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
	//회원가입jsp
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
	//로그아웃
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
	
	
	@RequestMapping(value = "/ad", method = RequestMethod.GET)
	public String ad() {
		
		return "addjsp";
	}

	//�ƹ�Ÿ ������ �� ȸ������ �ߴ� ��
	@RequestMapping(value = "/meminfo", method = RequestMethod.GET)
	public String meminfo() {
		//����
		return "memf";
	}
	
	//���������� ������ ��(����Ʈ �߱�)
	@RequestMapping(value = "/note", method = RequestMethod.GET)
	public String note(HttpServletRequest req, Model model) {
		model.addAttribute("mno",req.getParameter("m_no")); //�����ʿ�
		model.addAttribute("mpano",req.getParameter("m_pa_no"));
		return "note";
	}
	
	//���� ����Ʈ��
	@ResponseBody
	@RequestMapping(value="/noteUp",produces="application/text;charset=utf8")
	public String noteUp(HttpServletRequest req) {
		int m_no=Integer.parseInt(req.getParameter("m_no"));
		int m_pa_no=Integer.parseInt(req.getParameter("m_pa_no"));
		iteamP ip=sqlSession.getMapper(iteamP.class);
		ArrayList<noteVO> arno=ip.getNoteCon(m_no,m_pa_no);  //����
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
	
	//���� ������ ��Ʈ�ѷ�
	@ResponseBody
	@RequestMapping(value="/noteSend",produces="application/text;charset=utf8")
	public String noteSend(HttpServletRequest req) {
		iteamP ip=sqlSession.getMapper(iteamP.class);
		String con=req.getParameter("n_con");
		int you=Integer.parseInt(req.getParameter("youseq"));
		int me=1; //���Ǹ����� ���Ǿ� ��
		ip.noteSend(me, you, con);
		return "";
	}
}
