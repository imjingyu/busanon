package com.BusanOn.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.BusanOn.domain.EventDTO;
import com.BusanOn.function.FunctionClass;
import com.BusanOn.service.EventService;

@Controller
public class EventController {

	@Inject
	private EventService eventService;

	@RequestMapping(value = "/event/eventList", method = RequestMethod.GET)
	public String eventList(HttpServletRequest req, Model model) {
		int totalCount = eventService.eventCount();
		String spageNum = req.getParameter("pageNum");
		int ipageNum = (spageNum == null) ? 1 : Integer.parseInt(spageNum);
		Map<String, Integer> para = new FunctionClass().pagingFunction(ipageNum, totalCount, model);
		List<EventDTO> list = eventService.selectEventList(para);
		model.addAttribute("list", list);
		return "BusanOn/event/eventList";
	}

	@RequestMapping(value = "/event/eventDetail", method = RequestMethod.GET)
	public String eventDetail(HttpServletRequest req, Model model) {
		int event_id = Integer.parseInt(req.getParameter("event_id"));
		EventDTO event = eventService.selectEventDetail(event_id);
		model.addAttribute("event", event);
		return "BusanOn/event/eventDetail";
	}

	@RequestMapping(value = "/admin/eventWrite", method = RequestMethod.GET)
	public String eventWrite() {
		return "BusanOn/admin/a_eventWrite";
	}

	@RequestMapping(value = "/admin/eventWritePro", method = RequestMethod.POST)
	public String eventWritePro(EventDTO eventDTO, HttpSession session) {
		eventDTO.setWriter_id(session.getAttribute("user_id").toString());
		eventService.insertEvent(eventDTO);
		return "redirect:/event/eventList";
	}

	@RequestMapping(value = "/admin/eventList", method = RequestMethod.GET)
	public String adminEventList(HttpServletRequest req, Model model) {
		int totalCount = eventService.eventCount();
		String spageNum = req.getParameter("pageNum");
		int ipageNum = (spageNum == null) ? 1 : Integer.parseInt(spageNum);
		Map<String, Integer> para = new FunctionClass().pagingFunction(ipageNum, totalCount, model);
		List<EventDTO> list = eventService.selectEventList(para);
		model.addAttribute("list", list);
		return "BusanOn/admin/a_eventList";
	}

	@RequestMapping(value = "/admin/eventDelete", method = RequestMethod.GET)
	public String eventDelete(HttpServletRequest req) {
		int event_id = Integer.parseInt(req.getParameter("event_id"));
		eventService.deleteEvent(event_id);
		return "redirect:/admin/eventList";
	}
}
