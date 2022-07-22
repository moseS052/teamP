package com.team.pj;


import java.io.InputStream;
import java.net.URL;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;


import ch.qos.logback.core.net.SyslogOutputStream;

@Controller
public class ApiController {
	
	@Autowired
	private SqlSession sqlSession;

	@RequestMapping("/l_Read")
	public String dorea(HttpServletRequest req,Model model) {
		int l_no =Integer.parseInt(req.getParameter("l_no"));
		System.out.println(l_no);
		iteamP team=sqlSession.getMapper(iteamP.class);
		L_listDTO re=team.read(l_no);
		
		model.addAttribute("l_no",l_no);
		model.addAttribute("l_title",re.l_title);
		model.addAttribute("l_con",re.l_con);
		model.addAttribute("l_name",re.l_name);
		model.addAttribute("l_addr",re.l_address);
		model.addAttribute("l_date",re.l_date);
		model.addAttribute("nick",re.nick);
		return "l_Read";
	}
	
	//--�� ��Ȳ--//
	@ResponseBody
	@RequestMapping(value="/find_list", produces="application/text;charset=utf8")
	public String dofind_List(@RequestParam("l_koo") String l_koo) {
		System.out.println(l_koo);
		iteamP team=sqlSession.getMapper(iteamP.class);
		ArrayList<L_listDTO> l_list=team.getL_list(l_koo);
		JSONArray ja =new JSONArray();
		for(int i=0; i<l_list.size();i++) {
			L_listDTO ldto = l_list.get(i);
			JSONObject jo =new JSONObject();
			jo.put("l_no", ldto.getL_no());
			jo.put("m_no", ldto.getM_no());
			jo.put("l_title", ldto.getL_title());
			jo.put("l_date", ldto.getL_date());
			ja.add(jo);
		}
		System.out.println(ja.toJSONString());
		return ja.toJSONString();
	}
	//--�� ��Ȳ--//
	
	//--��ü ��Ȳ--//
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
			jo.put("m_no", ldto.getM_no());
			jo.put("l_title", ldto.getL_title());
			jo.put("l_date", ldto.getL_date());
			ja.add(jo);
		}
		System.out.println(ja.toJSONString());
		return ja.toJSONString();
	}
	//--��ü ��Ȳ--//
	
	//--����Ȱ����ȹ��--//
	@RequestMapping("/proposal")
	public String dopro(HttpServletRequest req,Model model) {
		int m_no =Integer.parseInt(req.getParameter("m_no"));
		iteamP team=sqlSession.getMapper(iteamP.class);
		ArrayList<L_listDTO> l_list=team.getM_noNick(m_no);
		model.addAttribute("m_no",l_list.get(0).getM_no());
		model.addAttribute("nick",l_list.get(0).getNick());
		return "proposal";
	}
	//--����Ȱ����ȹ��--//
	
	//--����Ȱ�� �ۼ���Ȳ�Խ��� ����--//
	@RequestMapping("/proposal_list")
	public String doList() {
		return "proposal_list";
	}
	//--����Ȱ�� �ۼ���Ȳ�Խ��� ����--//
	
	//insert�� ������������//
	@RequestMapping("/success_page")
	public String doSuccess() {
		return "success_page";
	}
	//insert�� ������������//
	@ResponseBody
	@RequestMapping(value="/check_ad", produces="application/text;charset=utf8")
	public String dochead(@RequestParam("m_no") int m_no,
						  @RequestParam("l_date") String l_date,
						  @RequestParam("t_no") int t_no) {
		System.out.println("{�̸�="+m_no+"}{��¥="+l_date+"}{��ɹ�ȣ="+t_no+"}");
		iteamP team=sqlSession.getMapper(iteamP.class);
			int l_no = team.checkl_no(m_no,l_date);
			System.out.println(l_no);
			team.check_ad(l_no,t_no);
		return "";
	}
	//list ���̺� insert //
	@ResponseBody
	@RequestMapping(value="/new_ad", produces="application/text;charset=utf8")
	public String doNewad(@RequestParam("m_no") int m_no,
						  @RequestParam("l_title") String l_title,
						  @RequestParam("l_content") String l_content,
						  @RequestParam("l_date") String l_date,
						  @RequestParam("l_file") String l_file,
						  @RequestParam("l_koo") String l_koo, 
						  @RequestParam("l_name") String l_name,
						  @RequestParam("l_address") String l_address) {
		System.out.println("{�̸�="+m_no+"}{����="+l_title+"}{����="+l_content+"}{��¥="+l_date+"}{����="+l_file+"}{��û��="+l_koo+"}{���="+l_name+"}{���ּ�="+l_address+"}");
		iteamP team=sqlSession.getMapper(iteamP.class);
		team.new_ad(m_no,l_title,l_content,l_name,l_address,l_koo,l_date);
		
		return "";
	}
	//list ���̺� insert //
	
	//īī�� ��API//
	@RequestMapping("/map")
	public String doMap(HttpServletRequest req,Model model) {
		String key = req.getParameter("key");
		System.out.println(key);
		model.addAttribute("key",key);
		return "map_open";
	}
	//īī����API//
	
	//����ȸ�� �ҷ����� API//
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
	//--����ȸ�� ��ȸ API--// 
}

