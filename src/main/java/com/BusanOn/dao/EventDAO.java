package com.BusanOn.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.BusanOn.domain.EventDTO;

@Repository
public class EventDAO {

	@Inject
	private SqlSession sqlSession;

	private static final String NAMESPACE = "com.BusanOn.mappers.eventMapper";

	public List<EventDTO> selectEventList(Map<String, Integer> para) {
		return sqlSession.selectList(NAMESPACE + ".selectEventList", para);
	}

	public EventDTO selectEventDetail(int event_id) {
		return sqlSession.selectOne(NAMESPACE + ".selectEventDetail", event_id);
	}

	public void insertEvent(EventDTO eventDTO) {
		sqlSession.insert(NAMESPACE + ".insertEvent", eventDTO);
	}

	public void updateEventViews(int event_id) {
		sqlSession.update(NAMESPACE + ".updateEventViews", event_id);
	}

	public void deleteEvent(int event_id) {
		sqlSession.delete(NAMESPACE + ".deleteEvent", event_id);
	}

	public int eventCount() {
		return sqlSession.selectOne(NAMESPACE + ".eventCount");
	}
}
