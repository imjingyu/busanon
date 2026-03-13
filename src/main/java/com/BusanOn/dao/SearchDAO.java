package com.BusanOn.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.BusanOn.domain.BusinessDTO;
import com.BusanOn.domain.MemberDTO;
import com.BusanOn.domain.PensionDTO;



@Repository
public class SearchDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE="com.BusanOn.mappers.BusinessMapper";
	private static final String NAMESPACE2="com.BusanOn.mappers.PensionMapper";
	
	/* 검색된 펜션 리스트 가져오기 */
	public List<PensionDTO> getPensionList(Map map) {
		return sqlSession.selectList(NAMESPACE+".getPensionList", map);
	}

	/* 페이징 */
	public int pensionCount(PensionDTO pensionDTO) {
		return sqlSession.selectOne(NAMESPACE + ".pensionCount", pensionDTO);
	}
	
	/* pen_name에 해당하는 펜션 정보 가져오기 (지원) */
	public PensionDTO getPensionDetail(String pen_name) {
		System.out.println("SearchDAO getPensionDetail()");
		return sqlSession.selectOne(NAMESPACE + ".getPensionDetail", pen_name);
	}
	
	/* pen_name에 해당하는 방 리스트 가져오기 (지원) */
//	public List<BusinessDTO> getSearchRoomList(String pen_name) {
//		System.out.println("SearchDAO getSearchRoomList()");
//		return sqlSession.selectList(NAMESPACE + ".getSearchRoomList", pen_name);
//	}

	public List<BusinessDTO> getSearchRoomList(Map<String, String> param) {
		System.out.println("SearchDAO getSearchRoomList()");
		return sqlSession.selectList(NAMESPACE + ".getSearchRoomList", param);
	}

	public List<PensionDTO> getTopList(PensionDTO pensionDTO) {
		System.out.println("SearchDAO getTopList");
		return sqlSession.selectList(NAMESPACE + ".getTopList", pensionDTO);
	}

	public BusinessDTO getRoomDetail(int room_id) {
		return sqlSession.selectOne(NAMESPACE + ".getRoomDetail", room_id);
	}

	public MemberDTO getNamePhone(Map<String, Object> uMap) {
		return sqlSession.selectOne(NAMESPACE + ".getNamePhone", uMap);
	}
	
	


	

}
