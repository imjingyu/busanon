package com.BusanOn.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.BusanOn.domain.ReviewDTO;

@Repository
public class ReviewDAO {
	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE="com.BusanOn.mappers.ReviewMapper";
	
	public void insertimage(String filename) {
		sqlSession.insert(NAMESPACE + ".reviewimage", filename);
	}
	
	public int reviewcount() {
		return sqlSession.selectOne(NAMESPACE + ".reviewCount");
	}
	public int reviewcount2() {
		return sqlSession.selectOne(NAMESPACE + ".reviewcount2");
	}
	public void insertreview(ReviewDTO rT) {
		sqlSession.insert(NAMESPACE + ".reviewInput", rT);
	}
	
	public Map<String, Object> staravg(String pen_id){
		return sqlSession.selectOne(NAMESPACE + ".avgStar", pen_id);
	}
	
	public List<ReviewDTO> selectreviewlist(Map<String, Object> sMap){
		return sqlSession.selectList(NAMESPACE + ".selectReview", sMap);
	}
}
