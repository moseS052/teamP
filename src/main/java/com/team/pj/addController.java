package com.team.pj;

import java.io.InputStream;
import java.net.URL;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

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
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;


import ch.qos.logback.core.net.SyslogOutputStream;

/**
 * Handles requests for the application home page.
 */
@Controller
public class addController {
	
	@Autowired
	private SqlSession sqlSession;
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
	@ResponseBody
	@RequestMapping(value="/open_list", produces="application/text;charset=utf8")
	public String doOpen_list(@RequestParam("l_koo") String l_koo) {
		iteamP team=sqlSession.getMapper(iteamP.class);
		ArrayList<L_listDTO> l_list=team.getL_list(l_koo);
		System.out.println("size="+l_list.size());
		JSONArray ja =new JSONArray();
		for(int i=0; i<l_list.size();i++) {
			L_listDTO ldto = l_list.get(i);
			JSONObject jo =new JSONObject();
			jo.put("l_no", ldto.getL_no());
			jo.put("m_no", ldto.getM_no());
			jo.put("l_con", ldto.getL_con());
			jo.put("l_title", ldto.getL_title());
			jo.put("l_name", ldto.getL_name());
			jo.put("l_address", ldto.getL_address());
			jo.put("l_koo", ldto.getL_koo());
			jo.put("l_date", ldto.getL_date());
			ja.add(jo);
		}
		System.out.println(ja.toJSONString());
		return ja.toJSONString();
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	//봉사활동기획서//
	@RequestMapping("/proposal")
	public String dosub() {
		return "proposal";
	}
	//봉사활동기획서//
	
	//봉사활동 작성현황게시판 띄우는//
	@RequestMapping("/proposal_list")
	public String doList() {
		return "proposal_list";
	}
	//봉사활동 작성현황게시판 띄우는//
	
	//insert후 나오는페이지//
	@RequestMapping("/success_page")
	public String doSuccess() {
		return "success_page";
	}
	//insert후 나오는페이지//
	
	//list 테이블 insert //
	@ResponseBody
	@RequestMapping(value="/new_ad", produces="application/text;charset=utf8")
	public String doNewad(@RequestParam("l_no") String l_no,
						  @RequestParam("l_title") String l_title,
						  @RequestParam("l_content") String l_content,
						  @RequestParam("l_date") String l_date,
						  @RequestParam("l_file") String l_file,
						  @RequestParam("l_koo") String l_koo, 
						  @RequestParam("l_name") String l_name,
						  @RequestParam("l_address") String l_address) {
		System.out.println("{이름="+l_no+"}{제목="+l_title+"}{내용="+l_content+"}{날짜="+l_date+"}{사진="+l_file+"}{신청구="+l_koo+"}{기관="+l_name+"}{상세주소="+l_address+"}");
		iteamP team=sqlSession.getMapper(iteamP.class);
		int reccount=team.new_ad(l_no,l_title,l_content,l_name,l_address,l_koo,l_date);
		return Integer.toString(reccount);
	}
	//list 테이블 insert //
	
	//카카오 맵API//
	@RequestMapping("/map")
	public String doMap(HttpServletRequest req,Model model) {
		String key = req.getParameter("key");
		System.out.println(key);
		model.addAttribute("key",key);
		return "map_open";
	}
	//카카오맵API//
	
	//복지회관 불러오는 API//
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
	//복지회관// 
}