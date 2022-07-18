package com.team.pj;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
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
	//여기서부터 작성
	@RequestMapping(value = "/meminfo", method = RequestMethod.GET)
	public String meminfo() {
		
		return "memf";
	}
	
	@RequestMapping(value = "/note", method = RequestMethod.GET)
	public String note(HttpServletRequest req, Model model) {
		model.addAttribute("mno",req.getParameter("m_no"));
		model.addAttribute("mpano",req.getParameter("m_pa_no"));
		return "note";
	}
	
	@ResponseBody
	@RequestMapping(value="/noteUp",produces="application/text;charset=utf8")
	public String noteUp(HttpServletRequest req) {
		int m_no=Integer.parseInt(req.getParameter("m_no"));
		int m_pa_no=Integer.parseInt(req.getParameter("m_pa_no"));
		iteamP ip=sqlSession.getMapper(iteamP.class);
		ArrayList<noteVO> arno=ip.getNoteCon(m_no,m_pa_no);
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

	
	
	
	
	
	
	
}
