package com.BusanOn.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.BusanOn.domain.MemberDTO;
import com.BusanOn.function.FunctionClass;
import com.BusanOn.service.KakaoService;
import com.BusanOn.service.MemberService;

@Controller
public class API_loginContrller {
	
	@Inject
	private MemberService service;
	private final static String _naver = "_naverAPIlogin";
	private final static String _kakao = "_kakaoAPIlogin";
	
	@RequestMapping(value = "/apilogin/api_naver_login", method = RequestMethod.GET)
	public String naverloginAPI() {
		return "BusanOn/apilogin/api_naver_login";
	}
	
	@RequestMapping(value = "/apilogin/itwillnaverlogin", method = RequestMethod.GET)
	public String naver_callback(HttpSession session) {
		return "BusanOn/apilogin/naver_login_callback";
	}
	
	@RequestMapping(value = "/apilogin/naverlogin", method = RequestMethod.GET)
	public String naverlogin(HttpServletRequest req, HttpSession session) {
		String user_id = req.getParameter("user_id").concat(_naver);
		String user_name = req.getParameter("user_name");
		String user_type = req.getParameter("user_type");
		
		Map<String, String> userMap = new HashMap<String, String>();
		sessionSet(session, userMap, user_id, user_name, user_type);
		
		return "redirect:/search/main";
	}
	
	@RequestMapping(value = "/apilogin/kakao_login", method = RequestMethod.GET)
	public String kakao_callback(String code, HttpSession session) throws Exception{
		KakaoService kakaoservice = new KakaoService();
		String token = kakaoservice.getToken(code);
		Map<String, String> kakaoMap = kakaoservice.getUserInfo(token);
		
		String user_id = kakaoMap.get("user_id") + _kakao;
		String user_name = kakaoMap.get("user_name");
		String user_type = kakaoMap.get("user_type");
		
		
		sessionSet(session, kakaoMap, user_id, user_name, user_type);
		return "redirect:/search/main";
	}
	
	private void sessionSet(HttpSession session, Map<String, String> uMap, String user_id, String user_name, String user_type) {
		uMap.put("user_id", user_id);
		uMap.put("user_name", user_name);
		uMap.put("user_type", user_type);
		MemberDTO mT = newMemberDTO(user_id, user_name, user_type);
		Map<String, String> userMap = service.iddup(uMap);
		if(userMap == null) {
			service.insertMember(mT);
			userMap = new HashMap<String, String>();
			userMap.put("USER_ID", user_id);
			userMap.put("USER_TYPE", user_type);
			userMap.put("USER_NAME", user_name);
		}
		System.out.println(userMap);
		session.setAttribute("user_id", userMap.get("USER_ID"));
		session.setAttribute("user_type", userMap.get("USER_TYPE"));
		session.setAttribute("user_name", userMap.get("USER_NAME"));
		session.setAttribute("TT", new FunctionClass().nowTime("yyyy-MM-dd-HH-mm-ss"));
	}
	private MemberDTO newMemberDTO(String user_id, String user_name, String user_type) {
		
		MemberDTO mT = new MemberDTO();
		if(user_name == null || "".equals(user_name)) {
			user_name = "넌 이름이 없니?";
		}
		mT.setUser_id(user_id);
		mT.setUser_name(user_name);
		mT.setUser_type(user_type);
		return mT;
	}
}
