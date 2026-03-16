package com.BusanOn.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.BusanOn.domain.PointDTO;

@Repository
public class PointDAO {

	@Inject
	private SqlSession sqlSession;

	private static final String NAMESPACE = "com.BusanOn.mappers.pointMapper";

	public List<PointDTO> selectPointList(Map<String, Object> para) {
		return sqlSession.selectList(NAMESPACE + ".selectPointList", para);
	}

	public int selectPointBalance(Map<String, Object> para) {
		Integer result = sqlSession.selectOne(NAMESPACE + ".selectPointBalance", para);
		return (result == null) ? 0 : result;
	}

	public void insertPoint(Map<String, Object> para) {
		sqlSession.insert(NAMESPACE + ".insertPoint", para);
	}
}
