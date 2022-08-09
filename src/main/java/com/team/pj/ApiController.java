package com.team.pj;


import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.UUID;

import org.apache.ibatis.session.SqlSession;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;


import ch.qos.logback.core.net.SyslogOutputStream;

@Controller
public class ApiController {

	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/Mysubs")
	public String dosubs(HttpServletRequest req,Model model) {
		iteamP p=sqlSession.getMapper(iteamP.class);
		int m_no = Integer.parseInt(req.getParameter("m_no"));
		HttpSession session=req.getSession();
		model.addAttribute("userinfo",session.getAttribute("id"));
		model.addAttribute("m_no",session.getAttribute("m_no"));
		String nick=(String) session.getAttribute("nick");
		if(nick.length()>5) {
			nick=nick.substring(0, 5)+"..";
		}
		model.addAttribute("nick",nick);
		String avatar=p.getAvaRoute((int)session.getAttribute("m_no"));
		model.addAttribute("avatar",avatar);
		return "Mysubs";
	}
	@ResponseBody
	@RequestMapping(value="/open_mysubs", produces="application/text;charset=utf8")
	public String doOpen_mysubs(@RequestParam("m_no") int m_no) {
		iteamP team=sqlSession.getMapper(iteamP.class);
		ArrayList<L_listDTO> mysbus=team.open_mysubs(m_no);	
		JSONArray ja =new JSONArray();
		for(int i=0; i<mysbus.size();i++) {
			L_listDTO ldto = mysbus.get(i);
			JSONObject jo =new JSONObject();
			jo.put("l_no", ldto.getL_no());
			jo.put("m_no", ldto.getM_no());
			jo.put("l_title", ldto.getL_title());
			jo.put("l_date", ldto.getL_date());
			jo.put("l_views", ldto.getL_views());
			jo.put("nop", ldto.getNop());
			jo.put("count", ldto.getCount());
			ja.add(jo);
		}
		System.out.println(ja.toJSONString());
		return ja.toJSONString();
	}
	
	
	@ResponseBody
	@RequestMapping(value="/open_mypost", produces="application/text;charset=utf8")
	public String doopenmypost(@RequestParam("m_no") int m_no) {
		iteamP team=sqlSession.getMapper(iteamP.class);
		ArrayList<L_listDTO> l_list=team.open_mypost(m_no);	
		ArrayList<boardDTO> boardlist=team.open_board(m_no);
		JSONArray ja =new JSONArray();
		
		JSONArray ja1 =new JSONArray();
		for(int i=0; i<l_list.size();i++) {
			L_listDTO ldto = l_list.get(i);
			JSONObject jo =new JSONObject();
			jo.put("l_no", ldto.getL_no());
			jo.put("m_no", ldto.getM_no());
			jo.put("l_title", ldto.getL_title());
			jo.put("l_date", ldto.getL_date());
			jo.put("l_views", ldto.getL_views());
			jo.put("nop", ldto.getNop());
			jo.put("count", ldto.getCount());
			ja1.add(jo);
		}
		 
		JSONArray ja2 =new JSONArray();
		for(int i=0; i<boardlist.size();i++) {
			boardDTO bdto = boardlist.get(i);
			JSONObject jo =new JSONObject();
			jo.put("b_no", bdto.getB_no());
			jo.put("b_type", bdto.getB_type());
			jo.put("b_title", bdto.getB_title());
			jo.put("b_date", bdto.getB_date());
			jo.put("views", bdto.getViews());
			ja2.add(jo);
			
		}
		ja.add(ja1);
		ja.add(ja2);
		System.out.println(ja.toJSONString());
		return ja.toJSONString();
	}
	
	//open MyPost.jsp//
	@RequestMapping("/MyPost")
	public String domypost(HttpServletRequest req,Model model) {
		iteamP p=sqlSession.getMapper(iteamP.class);
		int m_no = Integer.parseInt(req.getParameter("m_no"));
		HttpSession session=req.getSession();
		model.addAttribute("userinfo",session.getAttribute("id"));
		model.addAttribute("m_no",session.getAttribute("m_no"));
		String nick=(String) session.getAttribute("nick");
		if(nick.length()>5) {
			nick=nick.substring(0, 5)+"..";
		}
		model.addAttribute("nick",nick);
		String avatar=p.getAvaRoute((int)session.getAttribute("m_no"));
		model.addAttribute("avatar",avatar);
		return "MyPost";
	}
	//open MyPost.jsp//
	
	//pw change//
	@ResponseBody
	@RequestMapping(value="/pwdchange", produces="application/text;charset=utf8")
	public String dopwdchange(@RequestParam("m_no") int m_no,
							 @RequestParam("npwd1") int npwd1) {
		iteamP team=sqlSession.getMapper(iteamP.class);
			team.pwdchange(npwd1,m_no);
		return "";
	}
	//pw change//
	//pw check//
	@ResponseBody
	@RequestMapping(value="/pwdcheck", produces="application/text;charset=utf8")
	public String dopwdcheck(@RequestParam("m_no") int m_no,
							 @RequestParam("pw") int pw) {
		iteamP team=sqlSession.getMapper(iteamP.class);
			int a=team.pwdcheck(m_no,pw);
		return Integer.toString(a);
	}
	//pw check//
	//pwchange.jsp open//
	@RequestMapping("/pwchange")
	public String dopasswordchange(HttpServletRequest req,Model model) {
		iteamP p=sqlSession.getMapper(iteamP.class);
		int m_no = Integer.parseInt(req.getParameter("m_no"));
		HttpSession session=req.getSession();
		model.addAttribute("userinfo",session.getAttribute("id"));
		model.addAttribute("m_no",session.getAttribute("m_no"));
		String nick=(String) session.getAttribute("nick");
		if(nick.length()>5) {
			nick=nick.substring(0, 5)+"..";
		}
		model.addAttribute("nick",nick);
		String avatar=p.getAvaRoute((int)session.getAttribute("m_no"));
		model.addAttribute("avatar",avatar);
		return "pwchange";
	}
	//pwchange.jsp open//
	
	//privacy change//
	@ResponseBody
	@RequestMapping(value="/prichange", produces="application/text;charset=utf8")
	public String domemberchange(@RequestParam("m_no") int m_no,
								 @RequestParam("nick") String nick,
								 @RequestParam("name") String name,
								 @RequestParam("phone") String phone,
								 @RequestParam("mail") String mail) {
		iteamP team=sqlSession.getMapper(iteamP.class);
			team.prichange(name,nick,phone,mail,m_no);
		return "";
	}
	//privacy change//
	
	//nickname check//
	@ResponseBody
	@RequestMapping(value="/nickcheck",produces="application/text;charset=utf8")
	public String donickcheck(@RequestParam("nick") String nick) {
		iteamP team=sqlSession.getMapper(iteamP.class);
			int a=team.nickcheck(nick);
		return Integer.toString(a);
	}
	//nickname check//
	
	//privacy.jsp open//
	@RequestMapping("/privacy")
	public String doprivacy(HttpServletRequest req,Model model) {
		int m_no = Integer.parseInt(req.getParameter("m_no"));
		HttpSession session=req.getSession();
		iteamP team=sqlSession.getMapper(iteamP.class);
		model.addAttribute("userinfo",session.getAttribute("id"));
		model.addAttribute("m_no",session.getAttribute("m_no"));
		String nick=(String) session.getAttribute("nick");
		if(nick.length()>5) {
			nick=nick.substring(0, 5)+"..";
		}
		model.addAttribute("nick",nick);
		String avatar=team.getAvaRoute((int)session.getAttribute("m_no"));
		model.addAttribute("avatar",avatar);
		memberDTO re=team.privacyRead(m_no);
		model.addAttribute("id",re.id);
		model.addAttribute("name",re.name);
		model.addAttribute("Rnick",re.nick);
		model.addAttribute("phone",re.phone);
		model.addAttribute("mail",re.mail);
		return "privacy";
	}
	//privacy.jsp open//
	
	//apply table delete//
	@ResponseBody
	@RequestMapping(value="/applydel", produces="application/text;charset=utf8")
	public String doappdel(@RequestParam("l_no") int l_no,
							@RequestParam("m_no") int m_no) {
		iteamP team=sqlSession.getMapper(iteamP.class);
			team.applydel(l_no,m_no);
		return "";
	}
	//apply table delete//
	
	//apply table new //
	@ResponseBody
	@RequestMapping(value="/applynew", produces="application/text;charset=utf8")
	public String doappnew(@RequestParam("l_no") int l_no,
							@RequestParam("m_no") int m_no) {
		iteamP team=sqlSession.getMapper(iteamP.class);
			team.applyad(l_no,m_no);
		return "";
	}
	//apply table new //
	
	//apply list lookup//
	@ResponseBody
	@RequestMapping(value="/applylist", produces="application/text;charset=utf8")
	public String doapplylist(@RequestParam("l_no") int l_no) {
		iteamP team=sqlSession.getMapper(iteamP.class);
			ArrayList<L_listDTO>re=team.applist(l_no);
			JSONArray ja =new JSONArray();
			for(int i=0; i<re.size();i++) {
				L_listDTO ldto = re.get(i);
				JSONObject jo =new JSONObject();
				jo.put("appnick", ldto.getNick());
				ja.add(jo);
			}
			System.out.println(ja.toJSONString());
			return ja.toJSONString();
	}
	//apply list lookup//
	
	//--button produce--//
	@ResponseBody
	@RequestMapping(value="/butdiff", produces="application/text;charset=utf8")
	public String doDelete(@RequestParam("l_no") int l_no,
						   @RequestParam("m_no") int m_no) {
		iteamP team=sqlSession.getMapper(iteamP.class);
		int reccount=team.buttoncreate(l_no,m_no);
		return Integer.toString(reccount);
	}
	//--l_Read jsp,button produce--//
	
	//check box update//
	@ResponseBody
	@RequestMapping(value="/upcheckbox", produces="application/text;charset=utf8")
	public String doUpcheck(@RequestParam("l_no") int l_no,
							@RequestParam("t_no") int t_no) {
		iteamP team=sqlSession.getMapper(iteamP.class);
			team.delcheck(l_no);
			team.check_ad(l_no,t_no);
		return "";
	}
	//check box update//
	
	//list update//
	@ResponseBody
	@RequestMapping(value="/proUp", produces="application/text;charset=utf8")
	public String doProup(@RequestParam("nop") int nop,
						  @RequestParam("l_no") int l_no,
						  @RequestParam("m_no") int m_no,
						  @RequestParam("l_title") String l_title,
						  @RequestParam("l_content") String l_content,
						  @RequestParam("l_date") String l_date,
						  @RequestParam("l_file") String l_file,
						  @RequestParam("l_koo") String l_koo, 
						  @RequestParam("l_name") String l_name,
						  @RequestParam("l_address") String l_address) {
		System.out.println(nop);
		iteamP team=sqlSession.getMapper(iteamP.class);
		team.prUodate(m_no,l_title,l_content,l_date,l_name,l_address,l_koo,nop,l_no);
		
		return "";
	}
	//--list update--//
	
	//update read//
	@RequestMapping(value="/l_retouch", produces="application/text;charset=utf8")
	public String doRetouch(@RequestParam("l_no") int l_no,HttpServletRequest req,Model model) {
		HttpSession session=req.getSession();
		iteamP team=sqlSession.getMapper(iteamP.class);
		String nick=(String) session.getAttribute("nick");
		if(nick.length()>5) {
			nick=nick.substring(0, 5)+"..";
		}
		model.addAttribute("Snick",nick);
		String avatar=team.getAvaRoute((int)session.getAttribute("m_no"));
		model.addAttribute("avatar",avatar);
		model.addAttribute("userinfo",session.getAttribute("id"));
		model.addAttribute("m_no",session.getAttribute("m_no"));
		model.addAttribute("nick",session.getAttribute("nick"));
		L_listDTO re=team.reto(l_no);
		model.addAttribute("l_no",l_no);
		model.addAttribute("l_title",re.l_title);
		model.addAttribute("l_koo",re.l_koo);
		model.addAttribute("l_con",re.l_con);
		model.addAttribute("l_name",re.l_name);
		model.addAttribute("l_addr",re.l_address);
		model.addAttribute("l_date",re.l_date);
		model.addAttribute("nop",re.nop);
		ArrayList<Integer>sd=team.bringt_no(l_no);
		String str="";
		for(int i=0;i<sd.size();i++) {
			str+=sd.get(i);
		}
		System.out.println(sd);
		model.addAttribute("sd",str);
		return "proposalUpdate";
	}
	//--update read--//
	
	//list delete//
	@ResponseBody
	@RequestMapping(value="/l_del", produces="application/text;charset=utf8")
	public String dol_del(@RequestParam("l_no") int l_no) {
		iteamP team=sqlSession.getMapper(iteamP.class);
		team.tal_che_li_del(l_no);
		team.l_apdel(l_no);
		int reccount = team.L_del(l_no);
		return Integer.toString(reccount);
	}
	//--list delete--//
	
	//list read//
	@RequestMapping("/l_Read")
	public String dorea(HttpServletRequest req,Model model) {
		HttpSession session=req.getSession();
		int l_no =Integer.parseInt(req.getParameter("l_no"));
		iteamP team=sqlSession.getMapper(iteamP.class);
		iLcomment lcom=sqlSession.getMapper(iLcomment.class);
		int lcount = lcom.countLComment_t(l_no);
		System.out.println("댓글 개수=="+ lcount);
		model.addAttribute("countLComment",lcount);
		model.addAttribute("userinfo",session.getAttribute("id"));
		model.addAttribute("m_no",session.getAttribute("m_no"));
		model.addAttribute("sessionm_no",session.getAttribute("m_no"));
		String nick=(String) session.getAttribute("nick");
		if(nick.length()>5) {
			nick=nick.substring(0, 5)+"..";
		}
		model.addAttribute("nick",nick);
		ArrayList<String> pho=team.l_routeRead(l_no);
		model.addAttribute("list",pho);
		team.l_views(l_no);
		int lookapp=team.lookup(l_no);
		model.addAttribute("lookapp",lookapp);
		L_listDTO re=team.l_read(l_no);
		model.addAttribute("l_no",l_no);
		model.addAttribute("l_title",re.l_title);
		model.addAttribute("l_con",re.l_con);
		model.addAttribute("l_name",re.l_name);
		model.addAttribute("l_addr",re.l_address);
		model.addAttribute("l_date",re.l_date);
		model.addAttribute("l_nick",re.nick);
		model.addAttribute("l_mno",re.m_no);
		model.addAttribute("l_views",re.l_views);
		model.addAttribute("nop",re.nop);
		ArrayList<Integer> appMem=team.getApplyMem(l_no);
		model.addAttribute("applyMem",appMem);
		ArrayList<String>sd=team.bringt_name(l_no);
		String str="";
		for(int i=0;i<sd.size();i++) {
			str+=sd.get(i)+",";
		}
//		System.out.println(str);
		model.addAttribute("sd",str);
		String avatar=team.getAvaRoute((int)session.getAttribute("m_no"));
		model.addAttribute("avatar",avatar);
		return "l_Read";
	}
	//--list read--//
	
	//--占쏙옙 占쏙옙황--//
	@ResponseBody
	@RequestMapping(value="/find_list", produces="application/text;charset=utf8")
	public String dofind_List(@RequestParam("l_koo") String l_koo) {
//		System.out.println(l_koo);
		iteamP team=sqlSession.getMapper(iteamP.class);
		ArrayList<L_listDTO> l_list=team.getL_list(l_koo);
		System.out.println(l_list);
		
		JSONArray ja =new JSONArray();
		for(int i=0; i<l_list.size();i++) {
			L_listDTO ldto = l_list.get(i);
			JSONObject jo =new JSONObject();
			jo.put("l_koo", ldto.getL_koo());
			jo.put("l_no", ldto.getL_no());
			jo.put("m_no", ldto.getM_no());
			jo.put("l_title", ldto.getL_title());
			jo.put("l_date", ldto.getL_date());
			jo.put("l_views", ldto.getL_views());
			jo.put("nop", ldto.getNop());
			jo.put("count", ldto.getCount());
			jo.put("l_route", ldto.getL_route());
			ja.add(jo);
		}
		return ja.toJSONString();
	}
	//--占쏙옙 占쏙옙황--//
	
	//--占쏙옙체 占쏙옙황--//
	@ResponseBody
	@RequestMapping(value="/open_list", produces="application/text;charset=utf8")
	public String doOpen_list() {
		iteamP team=sqlSession.getMapper(iteamP.class);
		ArrayList<L_listDTO> l_list=team.Openl_list();
		JSONArray ja =new JSONArray();
		for(int i=0; i<l_list.size();i++) {
			L_listDTO ldto = l_list.get(i);
			JSONObject jo =new JSONObject();
			jo.put("l_no", ldto.getL_no());
			jo.put("l_name", ldto.getL_name());
			jo.put("m_no", ldto.getM_no());
			jo.put("l_title", ldto.getL_title());
			jo.put("l_date", ldto.getL_date());
			jo.put("l_views", ldto.getL_views());
			jo.put("nop", ldto.getNop());
			jo.put("count", ldto.getCount());
			jo.put("l_route", ldto.getL_route());
			ja.add(jo);
		}
//		System.out.println(ja.toJSONString());
		return ja.toJSONString();
	}
	//--占쏙옙체 占쏙옙황--//
	
	//--占쏙옙占쏙옙활占쏙옙占쏙옙획占쏙옙--//
	@RequestMapping("/proposal")
	public String dopro(HttpServletRequest req,Model model) {
		HttpSession session=req.getSession();
		int m_no =Integer.parseInt(req.getParameter("m_no"));
		iteamP team=sqlSession.getMapper(iteamP.class);
		model.addAttribute("userinfo",session.getAttribute("id"));
		ArrayList<L_listDTO> l_list=team.getM_noNick(m_no);
		model.addAttribute("m_no",l_list.get(0).getM_no());
		model.addAttribute("nick",l_list.get(0).getNick());
		String avatar=team.getAvaRoute((int)session.getAttribute("m_no"));
		model.addAttribute("avatar",avatar);
		return "proposal";
	}
	//--占쏙옙占쏙옙활占쏙옙占쏙옙획占쏙옙--//
	
	//--占쏙옙占쏙옙활占쏙옙 占쌜쇽옙占쏙옙황占쌉쏙옙占쏙옙 占쏙옙占쏙옙--//
	@RequestMapping("/proposal_list")
	public String doList(HttpServletRequest req,Model model) {
		iteamP p=sqlSession.getMapper(iteamP.class);
		HttpSession session=req.getSession();
		if(session.getAttribute("id")==null) { //로그인 전
			model.addAttribute("userinfo", null);
			model.addAttribute("m_no", null);
		}else {
			String nick=(String) session.getAttribute("nick");
			if(nick.length()>5) {
				nick=nick.substring(0, 5)+"..";
			}
			model.addAttribute("userinfo",session.getAttribute("id"));
			model.addAttribute("m_no",session.getAttribute("m_no"));
			model.addAttribute("nick",nick);
			String avatar=p.getAvaRoute((int)session.getAttribute("m_no"));
			model.addAttribute("avatar",avatar);
		}
		return "proposal_list";
	}
	//--占쏙옙占쏙옙활占쏙옙 占쌜쇽옙占쏙옙황占쌉쏙옙占쏙옙 占쏙옙占쏙옙--//
	
	//insert占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙//
	@RequestMapping("/success_page")
	public String doSuccess(HttpServletRequest req,Model model) {
		HttpSession session=req.getSession();
		String boardType=req.getParameter("b");
		model.addAttribute("boardType", boardType);
		model.addAttribute("userinfo",session.getAttribute("id"));
		model.addAttribute("m_no",session.getAttribute("m_no"));
		model.addAttribute("nick",session.getAttribute("nick"));
		return "success_page";
	}
	//insert占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙//
	
	@ResponseBody
	@RequestMapping(value="/check_ad", produces="application/text;charset=utf8")
	public String dochead(@RequestParam("m_no") int m_no,
						  @RequestParam("l_date") String l_date,
						  @RequestParam("t_no") int t_no, HttpServletRequest req) {
		HttpSession session=req.getSession();
		String nick=(String) session.getAttribute("nick");
		if(nick.length()>3) {
			nick=nick.substring(0, 3)+"..";
		}
		iteamP team=sqlSession.getMapper(iteamP.class);
		int l_no = team.checkl_no(m_no,l_date);
		session.setAttribute("l_no", l_no);
		team.check_ad(l_no,t_no);
		String tName=team.findTname(t_no);
		ArrayList<Integer> arM_no= team.findT_C_P(t_no);
		for(int i=0;i<arM_no.size();i++) {
			if(arM_no.get(i)==m_no) continue;
			String mes="<a href='' id='meminfo' seq='"+m_no+"'>"+nick+"</a>님께서&nbsp; '"+tName+"' 재능기부자를 찾고있습니다.(<a id='goList' href='l_Read?l_no="+l_no+"'>게시판가기</a>)";
			team.insertAlarm(arM_no.get(i), mes);
		}
		
		return "";
	}
	
	//list 占쏙옙占싱븝옙 insert //
	@ResponseBody
	@RequestMapping(value="/new_ad", produces="application/text;charset=utf8")
	public String doNewad(@RequestParam("nop") int nop,
						  @RequestParam("m_no") int m_no,
						  @RequestParam("l_title") String l_title,
						  @RequestParam("l_content") String l_content,
						  @RequestParam("l_date") String l_date,
						  @RequestParam("l_file") String l_file,
						  @RequestParam("l_koo") String l_koo, 
						  @RequestParam("l_name") String l_name,
						  @RequestParam("l_address") String l_address) {
		System.out.println("사진값은="+l_file);
		iteamP team=sqlSession.getMapper(iteamP.class);
			int a=team.datecheck(m_no,l_date);
			if(a==1) {
				return Integer.toString(a);
			}else {				
				team.new_ad(m_no,l_title,l_content,l_date,l_name,l_address,l_koo,nop);
			}
			
		return "";
	}
	//list 占쏙옙占싱븝옙 insert //
	
	//카카占쏙옙 占쏙옙API//
	@RequestMapping("/map")
	public String doMap(HttpServletRequest req,Model model) {
		String key = req.getParameter("key");
		System.out.println(key);
		model.addAttribute("key",key);
		return "map_open";
	}
	//카카占쏙옙占쏙옙API//
	
	//占쏙옙占쏙옙회占쏙옙 占쌀뤄옙占쏙옙占쏙옙 API//
	@ResponseBody
	@RequestMapping(value="/ko_check",produces="application/text;charset=utf8")
	public String doUsercheck(HttpServletRequest req,Model model) {
		String ko = req.getParameter("l_koo");
		System.out.println(ko);
		
		try {
    		URL url =new URL("http://openapi.seoul.go.kr:8088/616c4e73706b7761313234566c53536c/xml/fcltOpenInfo_ROWI/1/650/");
    		InputStream stream =url.openStream();
    		char ch=0;
    		DocumentBuilderFactory dbFactory=
    				 DocumentBuilderFactory.newInstance();
    		DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
    		Document doc =dBuilder.parse(stream);
    		doc.getDocumentElement().normalize();
    		
    		NodeList nlist = doc.getElementsByTagName("row");
    		ApiDTO ao=new ApiDTO();
    		JSONArray ja =new JSONArray();
    		for(int temp = 0; temp<nlist.getLength(); temp++) {
    			Node nNode = nlist.item(temp);
    			JSONObject jo =new JSONObject();
    			if(nNode.getNodeType()==Node.ELEMENT_NODE) {
    				Element eElement = (Element) nNode;
    				if(ao.getTagValue("JRSD_SGG_NM",eElement).equals(ko)) {
    			  	jo.put("name",ao.getTagValue("FCLT_NM",eElement));
    				jo.put("ar", ao.getTagValue("FCLT_ADDR",eElement));
    				ja.add(jo);
    				}
    			}
    		}
    		System.out.println(ja.toJSONString());
    		return ja.toJSONString();
    	}catch(Exception e){
    		e.printStackTrace();
    	}
		
		return "redirect:/find";
	}
	//--占쏙옙占쏙옙회占쏙옙 占쏙옙회 API--//
	@ResponseBody
	@RequestMapping(value="/insertno_img",method = RequestMethod.GET, produces="application/text;charset=utf8")
	public String Insert_no_img(HttpServletRequest req) {
		int nope = Integer.parseInt(req.getParameter("a"));
		System.out.println(nope);
		HttpSession session=req.getSession();
		int l_no=(int) session.getAttribute("l_no");
		System.out.println("l_no="+l_no);
		String img="resources/assets/img/No-img.jpg";
		iteamP team=sqlSession.getMapper(iteamP.class);
		if(nope==1) {
			team.insertno_img(l_no,img);
			return "";
		}
		session.removeAttribute("l_no");
		
		return"";
	}
	@ResponseBody
	@RequestMapping(value="/insertl_loute",method = RequestMethod.POST, produces="application/text;charset=utf8")
	public String Insert_loute(MultipartHttpServletRequest request,HttpServletRequest req) {
		HttpSession session=req.getSession();
		int l_no=(int) session.getAttribute("l_no");
		System.out.println("l_no="+l_no);
		iteamP team=sqlSession.getMapper(iteamP.class);
		
		String uploadFolder = "C:/Users/admin/git/teamP/src/main/webapp/resources/assets/L_route/";
		String realDataFolder = "resources/assets/L_route/";
		List<MultipartFile> filelist = request.getFiles("file");
		for (MultipartFile mf : filelist) {
			String fileRealName = mf.getOriginalFilename();
			System.out.println("fileRealName="+fileRealName);
			String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());
			UUID uuid = UUID.randomUUID();
			String[] uuids = uuid.toString().split("-");
			String uniqueName = uuids[0];
			File saveFile = new File(uploadFolder + uniqueName + fileExtension);
			try {
				mf.transferTo(saveFile);
				team.insertI_routetable(l_no, realDataFolder+uniqueName+fileExtension);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}

		}
		session.removeAttribute("l_no");
		
		return"";
		
	}
	//withdraw membership
	@ResponseBody
	@RequestMapping("/member_x")
	public String doMember_x(HttpServletRequest req,Model model) {
		iteamP p=sqlSession.getMapper(iteamP.class);
		int mseq=Integer.parseInt(req.getParameter("m_no"));
		System.out.println("delete m_no"+mseq);
		p.member_out(mseq);
		return "";
	}
}

