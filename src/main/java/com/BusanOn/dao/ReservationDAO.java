package com.BusanOn.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.BusanOn.domain.MemberDTO;
import com.BusanOn.domain.ReservationDTO;

@Repository
public class ReservationDAO {

	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE ="com.BusanOn.mappers.adminMapper";
	
	// 전체 예약 내역 조회
	public List<ReservationDTO> listReservationAll(ReservationDTO reservationDTO){
		System.out.println("전체 예약 내역 조회 출력");
		return sqlSession.selectList(NAMESPACE + ".listReservationAll", reservationDTO);
	}
	
	public MemberDTO rescheck(Map<String, Object> sMap) {
		return sqlSession.selectOne(NAMESPACE + ".rescheck", sMap);
	}

	public void cancelReservation(String res_number) {
		sqlSession.update(NAMESPACE + ".cancelReservation", res_number);
		
	}

	
}
