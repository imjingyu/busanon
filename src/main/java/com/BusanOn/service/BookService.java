package com.BusanOn.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.BusanOn.dao.BookDAO;
import com.BusanOn.dao.BusinessDAO;
import com.BusanOn.domain.BookDTO;
import com.BusanOn.domain.BusinessDTO;
import com.BusanOn.domain.MemberDTO;
import com.BusanOn.domain.PensionDTO;
import com.BusanOn.domain.PensionRmDTO;
import com.BusanOn.domain.ReservationDTO;
@Service
public class BookService {
	
	
	@Inject
	private BookDAO bookDAO;

	public List<ReservationDTO> listReservation(ReservationDTO reservationDTO) {
		return bookDAO.listReservation(reservationDTO);
	}


	public ReservationDTO getMember(String user_id) {
		return bookDAO.getMember(user_id);
	}


	public List<ReservationDTO> getListCheckReservation(MemberDTO mT) {
		return bookDAO.getListCheckReservation(mT);
	}


//	public void cancelReservation(String res_number) {
//		bookDAO.cancelReservation(res_number);
//		
//	}
//	public boolean cancelReservation(Long reservationNum) {
//		roomMapper.checkoutRoom(mapper.read(reservationNum).getRoomNum());
//		paymentMapper.updateStatus(reservationNum);
//		boolean result = mapper.updateStatus(reservationNum) > 0;
//		return result;


//	public List<BookDTO> listReservation(MemberDTO memberDTO, MemberDTO memberDTO2, PensionDTO pensionDTO,
//			PensionRmDTO pensionRmDTO, BookDTO bookDTO) {
//		return bookDAO.listReservation(memberDTO ,memberDTO2,pensionDTO,pensionRmDTO,bookDTO);
//	}
	
	
}
