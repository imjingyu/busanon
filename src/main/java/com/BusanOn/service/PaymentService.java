package com.BusanOn.service;

import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.BusanOn.dao.PaymentDAO;

@Service
public class PaymentService {
	
	@Inject
	private PaymentDAO paymentdao;
		
	public void insertreservation(Map<String, Object> sMap) {
		paymentdao.insertreservation(sMap);
	}
	
	public void cancelReservation(String res_number) {
		paymentdao.cancelreservation(res_number);
	}
	
}

