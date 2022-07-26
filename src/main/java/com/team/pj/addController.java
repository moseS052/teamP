package com.team.pj;


import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	
	// go
	@RequestMapping(value = "/alarm", method = RequestMethod.GET)
	public String note(HttpServletRequest req, Model model) {
		HttpSession session=req.getSession();
		iteamP ip=sqlSession.getMapper(iteamP.class);
		ArrayList<alarmVO> aravo=ip.showAlarm((int)session.getAttribute("m_no"));
		
		model.addAttribute("aravo",aravo.get(0).getAlarm());
		model.addAttribute("m_no",session.getAttribute("m_no"));
		return "alarm";
	}
}
