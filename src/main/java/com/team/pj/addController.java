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
import org.springframework.web.bind.annotation.PathVariable;
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
	@RequestMapping("/com")
	public String doList() {
		return "comment";
	}
	@ResponseBody
	@RequestMapping(value="/comment", produces="application/json;charset=utf-8")
	public String comment(@RequestParam("page") int page) {
		iteamP tp = sqlSession.getMapper(iteamP.class);
		ArrayList<commentDTO> comlist = tp.comlist(page);
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
	@ResponseBody
	@RequestMapping(value="/insertcomment", method=RequestMethod.POST)
	public void insertComment(@RequestParam("b_no")int b_no,
							  @RequestParam("c_con")String c_con,
							  @RequestParam("m_no")int m_no) {
		iteamP tp = sqlSession.getMapper(iteamP.class);
		tp.insertcomment(b_no, c_con, m_no);
		
	}
	@ResponseBody
	@RequestMapping(value="/delete_comment", method=RequestMethod.GET)
	public String deleteComment(@RequestParam("c_no")int c_no) {
		iteamP tp = sqlSession.getMapper(iteamP.class);
		int reccount=tp.deletecomment(c_no);
		System.out.println("댓글번호는="+c_no);
		return Integer.toString(reccount);
	}

}