package com.BusanOn.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.BusanOn.service.MailSendService;

@Controller
public class EmailController {
	
	@Autowired
	private MailSendService mailService;
	
	@RequestMapping(value = "member/emailsend", method = RequestMethod.GET)
	@ResponseBody
	public String emailsend(String email) {
		return mailService.joinEmail(email);
	}
}
