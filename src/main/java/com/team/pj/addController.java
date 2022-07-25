package com.team.pj;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
 * @param <T>
 */
@Controller
public class addController {
	
	@Autowired
	private SqlSession sqlSession;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	//���⼭���� �ۼ�
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
			ja.add(jo);
		}
		map.clear();
		return ja.toJSONString();
	}
	
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
			ja.add(jo);
		}
		
		map.clear();
		return ja.toJSONString();
	}
	
	
	
	
	

	
	
	
	
	
	
	
}
