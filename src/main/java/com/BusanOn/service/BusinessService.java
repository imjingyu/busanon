package com.BusanOn.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.BusanOn.dao.BusinessDAO;
import com.BusanOn.domain.BusinessDTO;
import com.BusanOn.domain.MemberDTO;
import com.BusanOn.domain.ReservationDTO;
import com.BusanOn.domain.ReviewDTO;

@Service
public class BusinessService {
	
	@Inject
	private BusinessDAO businessDAO;

	
	public void registerRoom(Map<String, Object> registerRoom) {
		
//		if(businessDAO.getMaxNum() == null) {
//			businessDTO.setRoomNum("1");
//		} else {
//			businessDTO.setRoomNum((businessDAO.getMaxNum()+1)+"");
//		}
		
		
		businessDAO.registerRoom(registerRoom);
	}


	public void registerPen(BusinessDTO businessDTO) {
		
		businessDAO.registerPen(businessDTO);
		
	}


	public void pensionAttach(BusinessDTO businessDTO2) {
		businessDAO.pensionAttach(businessDTO2);
		
	}


	public void pensionRoom(Map<String, Object> pensionRoom) {
		businessDAO.pensionRoom(pensionRoom);
		
	}


	public List<BusinessDTO> getRoomList(BusinessDTO businessDTO) {
		
		return businessDAO.getRoomList(businessDTO);
	}



	public void updateRoomList(BusinessDTO businessDTO) {
		businessDAO.updateRoomList(businessDTO);
		
	}


	public void deleteRoomList(BusinessDTO businessDTO) {
		businessDAO.deleteRoomList(businessDTO);
		
	}


	public int reservationCount(String user_id) {
		
		return businessDAO.reservationCount(user_id);
	}
	
	/* 사업자 리뷰페이징 */
	public int replyCount(ReviewDTO rT) {
		return businessDAO.replyCount(rT);
	}
	
	/* 사업자 리뷰조회 */
	public List<ReviewDTO> reviewList(Map<String, Object> para){
		return businessDAO.reviewList(para);
	}

	/* 사업자 리뷰 댓글 */
	public void updateAnwser(ReviewDTO reviewDTO) {
		businessDAO.updateAnswer(reviewDTO);
		
	}

	public Map<String, Object> reservationAtMonth(Map<String, Object> sMap) {
		return businessDAO.reservationAtMonth(sMap);
	}





	
	
}
