package com.BusanOn.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.BusanOn.dao.EventDAO;
import com.BusanOn.domain.EventDTO;

@Service
public class EventService {

	@Inject
	private EventDAO eventDAO;

	public List<EventDTO> selectEventList(Map<String, Integer> para) {
		return eventDAO.selectEventList(para);
	}

	public EventDTO selectEventDetail(int event_id) {
		return eventDAO.selectEventDetail(event_id);
	}

	public void insertEvent(EventDTO eventDTO) {
		eventDAO.insertEvent(eventDTO);
	}

	public void updateEventViews(int event_id) {
		eventDAO.updateEventViews(event_id);
	}

	public void deleteEvent(int event_id) {
		eventDAO.deleteEvent(event_id);
	}

	public int eventCount() {
		return eventDAO.eventCount();
	}
}
