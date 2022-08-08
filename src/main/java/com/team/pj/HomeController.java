package com.team.pj;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
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

		if(session.getAttribute("id")==null) { //로그인 전
			model.addAttribute("userinfo", null);
			

		}else { //濡�洹몄�� �깃났 ��
			String nick=(String) session.getAttribute("nick");
			if(nick.length()>5) {
				nick=nick.substring(0, 5)+"..";
			}
			model.addAttribute("userinfo",session.getAttribute("id"));
			model.addAttribute("m_no",session.getAttribute("m_no"));
			model.addAttribute("nick",nick);
			iteamP ip=sqlSession.getMapper(iteamP.class);
			String avatar=ip.getAvaRoute((int)session.getAttribute("m_no"));
			model.addAttribute("avatar",avatar);
		}
		iteamP team=sqlSession.getMapper(iteamP.class);
		ArrayList<L_listDTO>home_pro=team.home_proposal();
		model.addAttribute("l_list",home_pro);
		iphotoBoard ipt = sqlSession.getMapper(iphotoBoard.class);
		ArrayList<photoBoardDTO> homepho = ipt.home_photoList();
		model.addAttribute("p_list",homepho);
		iQuestion fre=sqlSession.getMapper(iQuestion.class);
		ArrayList<boardDTO> F_board = fre.f_BoardRead();
		model.addAttribute("F_board",F_board);
		return "home";
		
	}
	//濡�洹몄��
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String doLogin(HttpServletRequest req, Model model) {
		HttpSession session=req.getSession();
		model.addAttribute("m_no", session.getAttribute("m_no"));
		model.addAttribute("id",session.getAttribute("id"));
		model.addAttribute("nick",session.getAttribute("nick"));
		return "login";
	}
	//����媛���jsp
	@RequestMapping(value="/signup", method=RequestMethod.GET)
	public String doSignup(HttpServletRequest req, Model model) {
		HttpSession session=req.getSession();
		model.addAttribute("m_no", session.getAttribute("m_no"));
		model.addAttribute("id",session.getAttribute("id"));
		model.addAttribute("nick",session.getAttribute("nick"));
		return "signup";
	}
	//login
	@ResponseBody
	@RequestMapping(value="/user_check", method=RequestMethod.POST)
	public String doCheck(HttpServletRequest req) {
		HttpSession session=req.getSession();
		iteamP p=sqlSession.getMapper(iteamP.class);
		int n=p.login_count(req.getParameter("id"),Integer.parseInt(req.getParameter("pw")));
		
		String user_id=req.getParameter("id");
		String password=req.getParameter("pw");
		
		if(n==0) { //濡�洹몄�� �ㅽ��			
			session.setAttribute("m_no",null);			
		}else if(n!=1) { //����
			
		}else {	//濡�洹몄�� �깃났
			session.setAttribute("m_no",p.getM_no1(user_id));
			session.setAttribute("nick",p.getNickById(user_id));
			session.setAttribute("id", user_id);

		}
		return Integer.toString(n);
	}
//	//load naver privacy
//	@ResponseBody
//	@RequestMapping(value="/naver", method=RequestMethod.POST)
//	public String doN(HttpServletRequest req) {
//		HttpSession session=req.getSession();
////		iteamP p=sqlSession.getMapper(iteamP.class);
//		int n=1;
//		
//		String naver_id=req.getParameter("mail");
//		session.setAttribute("m_no",1);
//		session.setAttribute("nick",req.getParameter("nick"));
//		session.setAttribute("id", naver_id);
//		session.setAttribute("naver",n); //when you login naver id, session naver==1
//		//session.setAttribute("token",req.getParameter("token"));
//		session.setAttribute("phone",req.getParameter("phone"));
//		System.out.println("mail="+naver_id);	
//		
//		return Integer.toString(n);
//	}
	//check member overlap when login naver id
	@ResponseBody
	@RequestMapping(value="/navercheck", method=RequestMethod.POST, produces="application/text;charset=utf8")
	public String doNavercheck(@RequestParam("mail") String naver, Model model) {
		iteamP p=sqlSession.getMapper(iteamP.class);
		int navercnt=p.naver_count(naver);
		System.out.println("navercnt="+navercnt);
		return Integer.toString(navercnt);		
	}
	//insert member when login naver id
	@ResponseBody
	@RequestMapping(value="/naversign", method=RequestMethod.POST, produces="application/text;charset=utf8")
	public String doNaversign(@RequestParam("mail") String id,@RequestParam("name") String name,
			@RequestParam("nick") String nick, @RequestParam("phone") String phone,HttpServletRequest req) {
		iteamP p=sqlSession.getMapper(iteamP.class);
		System.out.println("naverid="+id);
		System.out.println("navernick="+nick);
		p.naver_member_insert(id,name,nick,phone,id);
		p.naver_talent_insert(p.getM_no1(id));
		
		HttpSession session=req.getSession();
		session.setAttribute("m_no",p.getM_no1(id));
		session.setAttribute("nick",p.getNickById(id));
		session.setAttribute("id",id);
		
		return "";
	}
	//find m_no of existing member when login naver id
	@ResponseBody
	@RequestMapping(value="/ex_member", method=RequestMethod.POST, produces="application/text;charset=utf8")
	public String doExist(@RequestParam("mail") String mail, Model model,HttpServletRequest req) {
		iteamP p=sqlSession.getMapper(iteamP.class);
		int m_no=p.getM_noBymail(mail);
		System.out.println("find m_no="+m_no);
		
		HttpSession session=req.getSession();
		session.setAttribute("m_no",m_no);
		session.setAttribute("nick",p.getNickBym_no(m_no));
		session.setAttribute("id",p.getID(m_no));
		
		return "";		
	}
	//logout
	@RequestMapping("/logout")
	public String doLogout(HttpServletRequest req,Model model) {
		HttpSession session=req.getSession();
		
		if(session.getAttribute("naver")==null){
			
		}else if((int)session.getAttribute("naver")==1) {
			String token=(String)session.getAttribute("token");
			System.out.println("token: "+token);
			//String result = getHTML("https://nid.naver.com/oauth2.0/token?grant_type=delete&client_id=w9CWsYucH5U3OO9SqFPI&client_secret=b4wN_t5bWN&access_token="+token+"&service_provider=NAVER");
			String result = getHTML("https://nid.naver.com/nidlogin.logout?returl=localhost%3A8080%2Fpj%2F");
			//String result= getHTML("http://nid.naver.com/nidlogin.logout");
			System.out.println("result: "+result);			
		} 
		session.invalidate();
		return "redirect:/";
	}
	//load naver logout page
	public static String getHTML(String urlToRead) {
	      URL url; // The URL to read
	      HttpURLConnection conn; // The actual connection to the web page
	      BufferedReader rd; // Used to read results from the web page
	      String line; // An individual line of the web page HTML
	      String result = ""; // A long string containing all the HTML
	      try {
	         url = new URL(urlToRead);
	         conn = (HttpURLConnection) url.openConnection();
	         conn.setRequestMethod("GET");
	         rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	         while ((line = rd.readLine()) != null) {
	            result += line;
	         }
	         rd.close();
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      return result;
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
		p.member_insert(id,pw,name,nick,phone,gender,mail,birth);
		
		return "";
	}
	//����媛����� �щ�μ껜�ы���대����� 異�媛�
	@ResponseBody
	@RequestMapping(value="/talent", method=RequestMethod.POST, produces="application/text;charset=utf8")
	public String doTalent(@RequestParam("id") String id, @RequestParam("t_no") String t_no) {
		iteamP p=sqlSession.getMapper(iteamP.class);
		String[] a = t_no.split(" ");
		for(int i=0; i<a.length;i++) {
			p.talent_insert(p.getM_no1(id),Integer.parseInt(a[i]));
			System.out.println("t_no="+a[i]);
		}
		
		
		return "";
	}
	//check id overlap 
	@ResponseBody
	@RequestMapping(value="/idcheck", method=RequestMethod.GET, produces="application/text;charset=utf8")
	public String doIdcheck(@RequestParam("id") String id, Model model) {
		iteamP p=sqlSession.getMapper(iteamP.class);
		int idcnt=p.id_count(id);
		System.out.println("idcnt="+idcnt);
		return Integer.toString(idcnt);		
	}
	//check nick overlap
	@ResponseBody
	@RequestMapping(value="/nickcheck", method=RequestMethod.GET, produces="application/text;charset=utf8")
	public String doNickcheck(@RequestParam("nick") String nick, Model model) {
		iteamP p=sqlSession.getMapper(iteamP.class);
		int nickcnt=p.nick_count(nick);
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
		iteamP ip=sqlSession.getMapper(iteamP.class);
		String avaRoute=ip.getAvaRoute(Integer.parseInt(req.getParameter("m_no")));
		model.addAttribute("semno",Integer.parseInt(req.getParameter("m_no")));
		model.addAttribute("id",session.getAttribute("id"));
		model.addAttribute("m_no",session.getAttribute("m_no"));
		model.addAttribute("nick",session.getAttribute("nick"));
		model.addAttribute("avaRoute",avaRoute);
		return "memf";
	}
	
	//占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙(占쏙옙占쏙옙트 占쌩깍옙)
	@RequestMapping(value = "/note", method = RequestMethod.GET)
	public String note(HttpServletRequest req, Model model) {
		HttpSession session=req.getSession();
		iteamP ip=sqlSession.getMapper(iteamP.class);
		model.addAttribute("mno",req.getParameter("m_no")); //�����ʿ�
		model.addAttribute("mpano",req.getParameter("m_pa_no"));
		model.addAttribute("nick",session.getAttribute("nick"));
		String myAvaRoute=ip.getAvaRoute(Integer.parseInt(req.getParameter("m_no")));
		String youAvaRoute=ip.getAvaRoute(Integer.parseInt(req.getParameter("m_pa_no")));
		model.addAttribute("myAvaRoute",myAvaRoute);
		model.addAttribute("youAvaRoute",youAvaRoute);
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
	
	//note send  all page need jquery because a tag
	@ResponseBody
	@RequestMapping(value="/noteSend",produces="application/text;charset=utf8")
	public String noteSend(HttpServletRequest req) {
		HttpSession session=req.getSession();
		iteamP ip=sqlSession.getMapper(iteamP.class);
		String con=req.getParameter("n_con");
		int you=Integer.parseInt(req.getParameter("youseq"));
		int me=(int) session.getAttribute("m_no");
		ip.noteSend(me, you, con);
		String nick=(String) session.getAttribute("nick");	
		if(nick.length()>3) {
			nick=nick.substring(0, 3)+"..";
		}
		String mes="<a href='' id='meminfo' seq='"+me+"'>"+nick+"</a>님께서 <a href='' id='btnSendNote' myseq='"+you+"' yourseq='"+me+"'>메세지</a>를 보냈습니다.";
		ip.insertAlarm(you, mes);
		return "";
	}
	
	//search title and content
	@ResponseBody
	@RequestMapping(value="/searchTNC",produces="application/text;charset=utf8",method = RequestMethod.POST)
	public String searchTNC(HttpServletRequest req) {
		iteamP ip=sqlSession.getMapper(iteamP.class);
		String table=req.getParameter("table");
		String search="'"+req.getParameter("search")+"'";

		Map map=new HashMap();
		map.put("table", table);
		map.put("search", search);
		
		ArrayList<SearchVO> arsvo=ip.searchTNC(map);
		JSONArray ja=new JSONArray();
		for(int i=0;i<arsvo.size();i++) {
			SearchVO svo = arsvo.get(i);
			JSONObject jo = new JSONObject();
			jo.put("nick", svo.getNick());
			jo.put("title", svo.getTitle());
			jo.put("date", svo.getTime());
			jo.put("seqno", svo.getSeqno());
			jo.put("con", svo.getCon());
			jo.put("views", svo.getViews());
			jo.put("m_no", svo.getM_no());
			ja.add(jo);
		}
		map.clear();
		return ja.toJSONString();
	}
	
	//search nick
	@ResponseBody
	@RequestMapping(value="/searchNick",produces="application/text;charset=utf8",method = RequestMethod.POST)
	public String searchNick(HttpServletRequest req) {
		iteamP ip=sqlSession.getMapper(iteamP.class);
		String table=req.getParameter("table");
		String search=req.getParameter("search");
		Map map=new HashMap();
		map.put("table", table);
		map.put("search", search);
		ArrayList<SearchVO> arsvo=ip.searchNick(map);
		
		JSONArray ja=new JSONArray();
		for(int j=0;j<arsvo.size();j++) {
			SearchVO svo = arsvo.get(j);
			JSONObject jo = new JSONObject();
			jo.put("nick", svo.getNick());
			jo.put("title", svo.getTitle());
			jo.put("date", svo.getTime());
			jo.put("seqno", svo.getSeqno());
			jo.put("views", svo.getViews());
			jo.put("m_no", svo.getM_no());
			ja.add(jo);
		}
		
		map.clear();
		return ja.toJSONString();
	}
	
	//alarm call
	@ResponseBody
	@RequestMapping(value = "/alarm", produces="application/text;charset=utf8")
	public String alarm(HttpServletRequest req) {
		HttpSession session=req.getSession();
		iteamP ip=sqlSession.getMapper(iteamP.class);
		ArrayList<alarmVO> aravo=ip.showAlarm((int)session.getAttribute("m_no"));
		JSONArray ja=new JSONArray();
		for(int i=0;i<aravo.size();i++) {
			alarmVO avo=aravo.get(i);
			JSONObject jo = new JSONObject();
			jo.put("al_no", avo.getAl_no());
			jo.put("m_no", avo.getM_no());
			jo.put("alarm",avo.getAlarm());
			jo.put("al_time", avo.getAl_time());
			jo.put("al_check", avo.getAl_check());
			ja.add(jo);
		}
		return ja.toJSONString();
	}
	
	//alarm check
	@ResponseBody
	@RequestMapping(value = "/alarmCheck", produces="application/text;charset=utf8")
	public String alarmCheck(HttpServletRequest req) {
		iteamP ip=sqlSession.getMapper(iteamP.class);
		ip.alarmCheck(Integer.parseInt(req.getParameter("al_no")));
		return "";
	}
	
	//Go avatar change place
	@RequestMapping(value = "/avatar", method = RequestMethod.GET)
	public String avatar(HttpServletRequest req,Model model) {
		HttpSession session=req.getSession();
		iteamP ip=sqlSession.getMapper(iteamP.class);
		model.addAttribute("myAvatarRoute",ip.getAvaRoute((int)session.getAttribute("m_no")));
		model.addAttribute("m_no",session.getAttribute("m_no"));
		return "avatar";
	}
	
	//avatar change
	@ResponseBody
	@RequestMapping(value = "/avatarChange", produces="application/text;charset=utf8")
	public String avatarChange(HttpServletRequest req) {
		HttpSession session=req.getSession();
		iteamP ip=sqlSession.getMapper(iteamP.class);
		ip.updateAvaRoute(req.getParameter("avaRoute"),(int)session.getAttribute("m_no"));
		return "";
	}
	@ResponseBody
	@RequestMapping(value = "/avatarChange_01", method = RequestMethod.POST, produces="application/text;charset=utf8")
	public String avatarChange_01(@RequestParam("file1")MultipartFile multi, HttpServletRequest req) {
		System.out.println("들어오나요");
		HttpSession session=req.getSession();
		String uploadFolder = "C:/Users/admin/eclipse-workspace/teamP/src/main/webapp/resources/assets/img/avatar/";
		String realDataFolder = "resources/assets/img/avatar/";
		String fileRealName = multi.getOriginalFilename();
		String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());
		UUID uuid = UUID.randomUUID();
		String[] uuids = uuid.toString().split("-");
		String uniqueName = uuids[0];
		String realRoute=realDataFolder+uniqueName + fileExtension;
		iteamP ip=sqlSession.getMapper(iteamP.class);
		File saveFile = new File(uploadFolder + uniqueName + fileExtension);
			try {
				multi.transferTo(saveFile);
				ip.updateAvaRoute(realRoute, (int)session.getAttribute("m_no"));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
	
		return "";
	}
}
