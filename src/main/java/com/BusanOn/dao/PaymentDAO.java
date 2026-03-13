package com.BusanOn.dao;

import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class PaymentDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE = "com.BusanOn.mappers.paymentMapper";
	
	public void insertreservation(Map<String, Object> sMap) {
		sqlSession.insert(NAMESPACE + ".rsp", sMap);
	}

	public void cancelreservation(String res_number) {
		sqlSession.update(NAMESPACE + ".cancelreservation", res_number);
	}
	
	
	
	
}