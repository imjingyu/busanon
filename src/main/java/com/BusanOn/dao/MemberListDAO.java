package com.BusanOn.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.BusanOn.domain.MemberDTO;
import com.BusanOn.domain.PensionDTO;
import com.BusanOn.domain.QnaDTO;
import com.BusanOn.domain.ReservationDTO;

@Repository
public class MemberListDAO {
//	ㄴ
	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE="com.BusanOn.mappers.MemberListMapper";
	private static final String NAMESPACE2="com.BusanOn.mappers.adminMapper";
	
	// 전체 회원 목록 조회
	public List<MemberDTO> getmemberList(MemberDTO memberDTO) {
		return sqlSession.selectList(NAMESPACE + ".getmemberList", memberDTO); 
	}
	
	public List<QnaDTO> selectQna(Map<String, Integer> para){
		return sqlSession.selectList(NAMESPACE2 + ".selectQna", para);
	}
	
	public void updateAnwser(QnaDTO qT) {
		System.out.println(qT);
		sqlSession.update(NAMESPACE2 + ".updateAnwser", qT);
	}
	
	public int qnaCount(QnaDTO qT) {
		return sqlSession.selectOne(NAMESPACE2 + ".qnaCount", qT);
	}
	
	public Map<String ,Object> customCount() {
		return sqlSession.selectOne(NAMESPACE2 + ".customCount");
	}
	
	public int pensioncount() {
		return sqlSession.selectOne(NAMESPACE2 + ".pensionCount");
	}
	
	public long paymentsum() {
		return sqlSession.selectOne(NAMESPACE2 + ".paymentSum");
	}
	
	public List<Map<String, Object>> selectpay(){
		return sqlSession.selectList(NAMESPACE2 + ".selectPay");
	}
	
	public List<PensionDTO> pensionlist(){
		return sqlSession.selectList(NAMESPACE2 + ".pensionlist");
	}

	public List<QnaDTO> getUnansweredQna(){
		return sqlSession.selectList(NAMESPACE2 + ".getUnansweredQna");
	}

	public List<ReservationDTO> getRecentReservations(){
		return sqlSession.selectList(NAMESPACE2 + ".getRecentReservations");
	}

	public List<Map<String, Object>> getAdminMonthlyRevenue(){
		return sqlSession.selectList(NAMESPACE2 + ".getAdminMonthlyRevenue");
	}

	public List<Map<String, Object>> getTopPensionRevenue(){
		return sqlSession.selectList(NAMESPACE2 + ".getTopPensionRevenue");
	}

}

