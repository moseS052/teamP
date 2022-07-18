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
	@RequestMapping("/com")
	public String doList() {
		return "comment";
	}
	@ResponseBody
	@RequestMapping(value="/comment", produces="application/json;charset=utf-8")
	public String comment() {
		iteamP tp = sqlSession.getMapper(iteamP.class);
		ArrayList<commentDTO> comlist = tp.comlist();
		JSONArray ja = new JSONArray();
		for(int i = 0; i<comlist.size(); i++) {
			commentDTO cdto= comlist.get(i);
			JSONObject jo = new JSONObject();
			jo.put("c_no", cdto.getC_no());
			jo.put("b_no", cdto.getB_no());
			jo.put("c_con", cdto.getC_con());
			jo.put("m_no", cdto.getM_no());
			jo.put("c_date", cdto.getC_date());
			jo.put("c_pa_no", cdto.getC_pa_no());
			ja.add(jo);
		}
		System.out.println(ja.toJSONString());
		return ja.toJSONString();
	}

}