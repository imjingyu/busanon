package com.BusanOn.index;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class IndexController {
	
	@RequestMapping(value = "/reservationList/reserveList", method = RequestMethod.GET)
	public String reserveList() {
				
		return "BusanOn/reservationList/reserveList";
	}
	
	@RequestMapping(value = "/map", method = RequestMethod.GET)
	public String map() {
		return "BusanOn/map";
	}

}
