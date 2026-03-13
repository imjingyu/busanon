package com.BusanOn.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.BusanOn.dao.ReservationDAO;
import com.BusanOn.domain.MemberDTO;
import com.BusanOn.domain.ReservationDTO;

@Service
public class ReservationService {

	@Inject
	private ReservationDAO reservationDAO;
	
	public List<ReservationDTO> listReservationAll(ReservationDTO reservationDTO){
		return reservationDAO.listReservationAll(reservationDTO);
	}
	
	public MemberDTO rescheck(Map<String, Object> sMap) {
		return reservationDAO.rescheck(sMap);
	}

	public void cancelReservation(String res_number) {
		reservationDAO.cancelReservation(res_number); 
		
	}
	
}
