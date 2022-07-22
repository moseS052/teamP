package com.team.pj;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;

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
	@RequestMapping(value="/search",produces="application/text;charset=utf8",method = RequestMethod.POST)
	public String noteSend(HttpServletRequest req) {
		iteamP ip=sqlSession.getMapper(iteamP.class);
		String title=req.getParameter("title");
		String date=req.getParameter("date");
		String seqno=req.getParameter("seqno");
		String table=req.getParameter("table");
		String titleName=req.getParameter("titleName");
		String con=req.getParameter("con");
		String search="'"+req.getParameter("search")+"'";
		System.out.println("select m_no,"+title+","+date+","+seqno+" from "+table+" where ("
		+titleName+" like  "+search+") or ("+con+" like "+search+")");
		
		HashMap<String,String> map = new HashMap<>();
		map.put(table, "member");
		
		int aa=ip.test1(map);
		System.out.println(aa);
//		ArrayList<SearchVO> arsvo=ip.searchTNC(title, date, seqno, table, titleName, con, search);
//		JSONArray ja=new JSONArray();
//		for(int i=0;i<arsvo.size();i++) {
//			SearchVO svo = arsvo.get(i);
//			JSONObject jo = new JSONObject();
//			jo.put("id", ip.getID(svo.getM_no()));
//			jo.put("title", svo.getTitle());
//			jo.put("date", svo.getDate());
//			jo.put("seqno", svo.getSeqno());
//			ja.add(jo);
//		}
		return "";
//		return ja.toJSONString();
	}
	
	
	
	
	
	

	
	
	
	
	
	
	
}
