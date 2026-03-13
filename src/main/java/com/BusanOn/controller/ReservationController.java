package com.BusanOn.controller;


import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.BusanOn.domain.MemberDTO;
import com.BusanOn.domain.ReservationDTO;
import com.BusanOn.service.BookService;
import com.BusanOn.service.ReservationService;




@Controller
public class ReservationController {
	
	

	@Inject
	private BookService bookService;
	
	@Inject
	private ReservationService resService;
	
	
	@RequestMapping(value = "/business/listReservation", method = RequestMethod.GET)
	public String listReservation(ReservationDTO reservationDTO  , Model model, HttpSession session) {
		String user_id = (String)session.getAttribute("user_id");		
		String user_type = (String)session.getAttribute("user_type");
		reservationDTO.setUser_type(user_type);
		reservationDTO.setUser_id(user_id);
		if(user_type == null) user_type = "0";
		if(user_type.equals("2")) {
			List<ReservationDTO> listReservation = bookService.listReservation(reservationDTO);
			System.out.println(listReservation);
			model.addAttribute("listReservation", listReservation);
			return "BusanOn/business/listReservation";
		} else {
			return "BusanOn/business/msg";
		}
	}
	
	@RequestMapping(value = "/business/checkReservation", method = RequestMethod.GET)
	public String checkReservation(ReservationDTO reservationDTO, Model model, HttpSession session, MemberDTO mT){
		String user_id = (String)session.getAttribute("user_id");
		String user_type = session.getAttribute("user_type").toString();
		mT.setUser_id(user_id);
		mT.setUser_type(user_type);
		if(user_type == null) user_type = "0";
		if(user_type.equals("2")) {
			List<ReservationDTO> listReservation = bookService.getListCheckReservation(mT);
			System.out.println(listReservation.toString());
			model.addAttribute("reservation2",listReservation );
		return "BusanOn/business/checkReservation";
		} else {
			return "BusanOn/business/msg";
		}
	}
	@RequestMapping(value="/business/checkReservation2", method = RequestMethod.GET)
	public String listReservation (HttpServletRequest req) {
		String res_number = req.getParameter("res_number");
		System.out.println(res_number);
		resService.cancelReservation(res_number);
		
		return "redirect:/business/checkReservation";
	}
	
	@RequestMapping(value = "/business/listPayment", method = RequestMethod.GET)
	public String listPayment(ReservationDTO reservationDTO  , Model model, HttpSession session) {
		String user_id = (String)session.getAttribute("user_id");		
		String user_type = (String)session.getAttribute("user_type");
		
		if(user_type == null) user_type = "0";
		if(user_type.equals("2")) {
			
			reservationDTO.setUser_id(user_id);;
			List<ReservationDTO> listReservation = bookService.listReservation(reservationDTO);
			
			model.addAttribute("listReservation3", listReservation);	
			
			return "BusanOn/business/listPayment";
		} else {
			return "BusanOn/business/msg";
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/search/rescheck", method = RequestMethod.GET)
	public boolean rescheck(@RequestParam Map<String, Object> sMap) {
		System.out.println(sMap);
		MemberDTO mT = resService.rescheck(sMap);
		System.out.println(mT);
		if(mT != null) {
			return true;
		}
		return false;
	}
	
	
		
		
				
				
	
	
}

