package com.BusanOn.controller;

import java.io.PrintWriter;
import java.util.Date;
import java.util.Map;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.BusanOn.domain.MemberDTO;
import com.BusanOn.function.FunctionClass;
import com.BusanOn.service.MemberService;
import com.BusanOn.service.PointService;

@Controller
public class MemberController {
	
	@Inject
	private MemberService service;

	@Inject
	private PointService pointService;

	@RequestMapping(value = "/member/login", method = RequestMethod.GET)
	public String login(HttpSession session, HttpServletRequest req) {
		
		String bpath = req.getHeader("Referer");
		String uri = req.getContextPath();
		if(bpath != null) {
			String path = bpath.split(uri)[1];
			req.setAttribute("path", path);
		}
		return "BusanOn/member/login";
	}
	
	@ResponseBody
	@RequestMapping(value = "/timerreset", method = RequestMethod.GET)
	public String timerreset(HttpSession session) {
		String date = new FunctionClass().nowTime("yyyy-MM-dd-HH-mm-ss");
		session.setAttribute("TT", date);
		return date;
	}
	

	@RequestMapping(value = "/member/loginPro", method = RequestMethod.GET)
	public String loginPro(MemberDTO mT, HttpServletRequest req){

		Map<String, String> userMap = service.userlogin(mT);
		System.out.println(userMap);
		if(userMap == null) {
			req.setAttribute("msg", "아이디가 존재하지 않습니다.");
			return "BusanOn/member/loginPro";
		}
		if(mT.getPassword().equals(userMap.get("PASSWORD").toString())) {
			HttpSession session = req.getSession();
			session.setAttribute("user_id", mT.getUser_id());
			session.setAttribute("user_type", userMap.get("USER_TYPE")); 
			String user_name = userMap.get("USER_NAME");
			if(user_name == null || "".equals(user_name)) {
				user_name = "넌 이름이 없니?";
			}
			session.setAttribute("user_name", user_name);
			session.setAttribute("TT", new FunctionClass().nowTime("yyyy-MM-dd-HH-mm-ss"));
			return "redirect:/search/main";
		}
		req.setAttribute("msg", "패스워드가 일치하지 않습니다.");
		return "BusanOn/member/loginPro";
		
	}
	
	@RequestMapping(value = "/member/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/search/main";
	}
	
	
	@RequestMapping(value = "/member/join", method = RequestMethod.GET)
	public String join() {
				
		return "BusanOn/member/join";
	}
	
	@RequestMapping(value = "/member/joinPro", method = RequestMethod.GET)
	public String joinPro(MemberDTO mT, HttpServletRequest req) {
		service.insertMember(mT);
		pointService.addPoint(mT.getUser_id(), mT.getUser_type(), "EARN", 500, "회원가입 축하 포인트");
		return "BusanOn/member/joinPro";
	}
	
	@RequestMapping(value = "/member/passSearch", method = RequestMethod.GET)
	public String passSearch(HttpServletRequest req, Model model) {
		model.addAttribute("user_type", req.getParameter("user_type"));
		return "BusanOn/member/passSearch";
	}
	
	@RequestMapping(value = "/member/repass", method = RequestMethod.GET)
	public String repass(MemberDTO mT, HttpServletRequest req, Model model) {
		
		mT.setUser_type(req.getParameter("user_type"));
		model.addAttribute("memberDTO", mT);
		return "BusanOn/member/repass";
	}
	
	@RequestMapping(value = "/member/repassPro", method = RequestMethod.POST)
	public String repassPro(MemberDTO mT, HttpServletRequest req) {
		mT.setUser_id(req.getParameter("user_id"));
		mT.setUser_type(req.getParameter("user_type"));
		service.updatePass(mT);
		return "BusanOn/member/repassPro";
	}
	
	// 아이디 중복확인
	@RequestMapping(value = "/member/iddup", method = RequestMethod.GET)
	@ResponseBody
	public String iddup(@RequestParam Map<String ,String> dupMap) {
		
		String id = dupMap.get("user_id");
		String t = dupMap.get("user_type");
		
		if(id.equals("")) return "false1";
		if(!(id.contains("@"))) return "false2";
		Map<String, String> uMap = service.iddup(dupMap);
		if(uMap == null) return "true";
		return "false";
	}
	
}

