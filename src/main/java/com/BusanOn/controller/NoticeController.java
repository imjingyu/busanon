package com.BusanOn.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.BusanOn.domain.NoticeDTO;
import com.BusanOn.function.FunctionClass;
import com.BusanOn.service.NoticeService;

@Controller
public class NoticeController {

	@Inject
	private NoticeService noticeService;

	@RequestMapping(value = "/notice/noticeList", method = RequestMethod.GET)
	public String noticeList(HttpServletRequest req, Model model) {
		int totalCount = noticeService.noticeCount();
		String spageNum = req.getParameter("pageNum");
		int ipageNum = (spageNum == null) ? 1 : Integer.parseInt(spageNum);
		Map<String, Integer> para = new FunctionClass().pagingFunction(ipageNum, totalCount, model);
		List<NoticeDTO> list = noticeService.selectNoticeList(para);
		model.addAttribute("list", list);
		return "BusanOn/notice/noticeList";
	}

	@RequestMapping(value = "/notice/noticeDetail", method = RequestMethod.GET)
	public String noticeDetail(HttpServletRequest req, Model model) {
		int notice_id = Integer.parseInt(req.getParameter("notice_id"));
		noticeService.updateViews(notice_id);
		NoticeDTO notice = noticeService.selectNoticeDetail(notice_id);
		model.addAttribute("notice", notice);
		return "BusanOn/notice/noticeDetail";
	}

	@RequestMapping(value = "/admin/noticeWrite", method = RequestMethod.GET)
	public String noticeWrite() {
		return "BusanOn/admin/a_noticeWrite";
	}

	@RequestMapping(value = "/admin/noticeWritePro", method = RequestMethod.POST)
	public String noticeWritePro(NoticeDTO noticeDTO, HttpSession session) {
		noticeDTO.setWriter_id(session.getAttribute("user_id").toString());
		noticeService.insertNotice(noticeDTO);
		return "redirect:/notice/noticeList";
	}

	@RequestMapping(value = "/admin/noticeList", method = RequestMethod.GET)
	public String adminNoticeList(HttpServletRequest req, Model model) {
		int totalCount = noticeService.noticeCount();
		String spageNum = req.getParameter("pageNum");
		int ipageNum = (spageNum == null) ? 1 : Integer.parseInt(spageNum);
		Map<String, Integer> para = new FunctionClass().pagingFunction(ipageNum, totalCount, model);
		List<NoticeDTO> list = noticeService.selectNoticeList(para);
		model.addAttribute("list", list);
		return "BusanOn/admin/a_noticeList";
	}

	@RequestMapping(value = "/admin/noticeDelete", method = RequestMethod.GET)
	public String noticeDelete(HttpServletRequest req) {
		int notice_id = Integer.parseInt(req.getParameter("notice_id"));
		noticeService.deleteNotice(notice_id);
		return "redirect:/admin/noticeList";
	}
}
