package com.BusanOn.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.BusanOn.dao.NoticeDAO;
import com.BusanOn.domain.NoticeDTO;

@Service
public class NoticeService {

	@Inject
	private NoticeDAO noticeDAO;

	public List<NoticeDTO> selectNoticeList(Map<String, Integer> para) {
		return noticeDAO.selectNoticeList(para);
	}

	public NoticeDTO selectNoticeDetail(int notice_id) {
		return noticeDAO.selectNoticeDetail(notice_id);
	}

	public void insertNotice(NoticeDTO noticeDTO) {
		noticeDAO.insertNotice(noticeDTO);
	}

	public void updateViews(int notice_id) {
		noticeDAO.updateViews(notice_id);
	}

	public void updateNotice(NoticeDTO noticeDTO) {
		noticeDAO.updateNotice(noticeDTO);
	}

	public void deleteNotice(int notice_id) {
		noticeDAO.deleteNotice(notice_id);
	}

	public int noticeCount() {
		return noticeDAO.noticeCount();
	}
}
