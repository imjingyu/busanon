package com.BusanOn.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.BusanOn.domain.MemberDTO;
import com.BusanOn.domain.QnaDTO;
import com.BusanOn.domain.ReservationDTO;
import com.BusanOn.domain.ReviewDTO;
import com.BusanOn.function.FunctionClass;
import com.BusanOn.service.MemberService;

@Controller
public class MemberMyPageController {
	
	@Inject
	private MemberService service;
	
//	ㄴ
	@RequestMapping(value = "/member/m_myPage", method = RequestMethod.GET)
	public String m_myPage() {
		return "BusanOn/member/m_myPage";
	}
	
	@RequestMapping(value = "/member/passcheck", method = RequestMethod.GET)
	public String passcheck(HttpServletRequest req, Model model) {
		model.addAttribute("type", req.getParameter("type"));
		return "BusanOn/member/passcheck";
		
	}
	
	@RequestMapping(value = "/member/deletecustom", method = RequestMethod.GET)
	public String deletecustom(MemberDTO mT, HttpSession session) {
		String user_id = session.getAttribute("user_id").toString();
		String user_type = session.getAttribute("user_type").toString();
		mT.setUser_id(user_id);
		mT.setUser_type(user_type);
		service.deleteUser(mT);
		session.invalidate();
		return "BusanOn/member/deletecustom";
	}
	
	@RequestMapping(value = "/member/userpasscheck", method = {RequestMethod.GET, RequestMethod.POST})
	public String modify(MemberDTO mT, HttpSession session, HttpServletRequest req, Model model) {
		String formtype = req.getParameter("type");
		
		mT.setUser_id(session.getAttribute("user_id").toString());
		mT.setUser_type(session.getAttribute("user_type").toString());
		Map<String, String> mT2 = service.selectUser(mT);
		model.addAttribute("MemberDTO", mT2);
		
		//API 로그인 회원
		if(mT.getPassword() == null) {
			if(formtype.equals("u")) {
				return "BusanOn/member/modify";
			}else if(formtype.equals("d")){
				return "redirect:/member/deletecustom";
			}
		}
		
		mT.setUser_id(session.getAttribute("user_id").toString());
		mT.setUser_type(session.getAttribute("user_type").toString());
		Map<String, String> userMap = service.userlogin(mT);
		if(mT.getPassword().equals(userMap.get("PASSWORD").toString())) {
			if(formtype.equals("u")) {
				return "BusanOn/member/modify";
			}else if(formtype.equals("d")){
				return "redirect:/member/deletecustom";
			}
			
		}
		req.setAttribute("msg", "패스워드가 일치하지 않습니다.");
		return "BusanOn/member/loginPro";
		
	}
	
	@RequestMapping(value = "/member/updateuser", method = RequestMethod.POST)
	public String updateuser(MemberDTO mT, HttpSession session) {
		mT.setUser_id(session.getAttribute("user_id").toString());
		mT.setUser_type(session.getAttribute("user_type").toString());
		service.updateUser(mT);
		return "redirect:/search/main";
	}
	
	@RequestMapping(value = "/member/mypage/listReservation", method = RequestMethod.GET)
	public String listReservation(MemberDTO mT, HttpSession session, Model model) throws Exception {
		mT.setUser_id(session.getAttribute("user_id").toString());
		mT.setUser_type(session.getAttribute("user_type").toString());
		System.out.println(123);
		List<ReservationDTO> reslist = service.reservationlist(mT);
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		for (ReservationDTO dto : reslist) {
			Date nowdate = formatter.parse(new FunctionClass().nowTime("yyyy-MM-dd HH:mm"));
			Date rdate = formatter.parse(dto.getCheck_in_d());
			
			if(nowdate.getTime() > rdate.getTime()) {
				if(dto.getRes_status().equals("1")) {
					dto.setRes_status("2");
				}
			}
			
		}
		System.out.println(reslist);
		model.addAttribute("list", reslist);
		return "BusanOn/member/mypage/listReservation";
	}
	
	@RequestMapping(value = "/member/mypage/myreview", method = RequestMethod.GET)
	public String myreview(ReviewDTO rT, HttpSession session, Model model) {
		rT.setUser_id(session.getAttribute("user_id").toString());
		rT.setUser_type(session.getAttribute("user_type").toString());
		System.out.println(rT.getUser_id());
		List<ReviewDTO> reviewlist = service.selectmemberreview(rT);
		System.out.println(reviewlist);
		model.addAttribute("list", reviewlist);
		return "BusanOn/member/mypage/myreview";
	}
	
	@RequestMapping(value = "/member/mypage/listInquiry", method = RequestMethod.GET)
	public String listInquiry(MemberDTO mT, HttpSession session, Model model) {
		mT.setUser_id(session.getAttribute("user_id").toString());
		mT.setUser_type(session.getAttribute("user_type").toString());
		
		List<QnaDTO> qnalist = service.selectqnalist(mT);
		model.addAttribute("list", qnalist);
		return "BusanOn/member/mypage/listInquiry";
	}
	
	@RequestMapping(value = "/member/mypage/qnainput", method = RequestMethod.GET)
	public String qnainput(QnaDTO qT, HttpSession session) {
		
		qT.setUser_id(session.getAttribute("user_id").toString());
		qT.setUser_type(session.getAttribute("user_type").toString());
		qT.setTime(new FunctionClass().nowTime("yyyy-MM-dd HH:mm"));
		qT.setReply("N");
		service.insertqna(qT);
		return "redirect:/member/mypage/listInquiry";
	}
}

