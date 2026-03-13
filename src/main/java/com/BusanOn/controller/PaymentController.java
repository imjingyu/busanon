package com.BusanOn.controller;

import java.util.Map;
import java.util.Random;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.BusanOn.domain.ReservationDTO;
import com.BusanOn.function.FunctionClass;
import com.BusanOn.service.PaymentService;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

@Controller
public class PaymentController {
	
	private IamportClient api;
	
	@Inject
	private PaymentService service;
	
	public PaymentController() {
		// REST API 키와 REST API secret 입력
		this.api = new IamportClient("3157873113568822", "8Nt0l6CyajA08fjZvXoh2i5q4Y1yA8IvKoy8mEDxUpJCpkzT6klss5rDe4W4TqXiPDGC6NejJPvriujx");
	}
	
	@ResponseBody
	@RequestMapping(value="search/insertReservation", method = RequestMethod.POST)
	public String paymentByImpUid (@RequestParam Map<String, Object> para){
		
		Map<String, Object> sMap = para;
		sMap.put("res_number", para.get("pen_id").toString().concat(para.get("room_id").toString().concat(new FunctionClass().nowTime("yyyyMMddHHmmss"))));
		sMap.put("res_time", new FunctionClass().nowTime("yyyy-MM-dd HH:mm:ss"));
		System.out.println("===================");
		System.out.println(sMap);
		service.insertreservation(sMap);
		
		return "true";
		
	}
	
	@RequestMapping(value="/member/mypage/listReservation2", method = RequestMethod.GET)
	public String listReservation (HttpServletRequest req) {
		String res_number = req.getParameter("res_number");
		System.out.println(res_number);
		service.cancelReservation(res_number);
		
		
		
		return "redirect:/member/mypage/listReservation";
	}
	
	
}
