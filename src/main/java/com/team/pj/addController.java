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
	
	@RequestMapping("/map")
	public String doMap(HttpServletRequest req,Model model) {
		String key = req.getParameter("key");
		System.out.println(key);
		model.addAttribute("key",key);
		return "map_open";
	}
	
	
	@RequestMapping("/find")
	public String doList() {
		return "kwon";
	}
	@ResponseBody
	@RequestMapping(value="/ko_check",produces="application/text;charset=utf8")
	public String doUsercheck(HttpServletRequest req,Model model) {
		String ko = req.getParameter("area");
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
    		
//    		System.out.println("Root element:"+doc.getDocumentElement().getNodeName());
    		NodeList nlist = doc.getElementsByTagName("row");
//    		System.out.println("--------------------------");
    		ApiDTO ao=new ApiDTO();
    		JSONArray ja =new JSONArray();
    		for(int temp = 0; temp<nlist.getLength(); temp++) {
    			Node nNode = nlist.item(temp);
    			JSONObject jo =new JSONObject();
    			if(nNode.getNodeType()==Node.ELEMENT_NODE) {
    				Element eElement = (Element) nNode;
    				if(ao.getTagValue("JRSD_SGG_NM",eElement).equals(ko)) {
//    			  	System.out.println("복지회관:"+ao.getTagValue("FCLT_NM",eElement));
    			  	jo.put("name",ao.getTagValue("FCLT_NM",eElement));
//    			  	System.out.println("위치:"+ao.getTagValue("FCLT_ADDR",eElement));
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
}