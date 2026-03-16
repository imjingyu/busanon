package com.BusanOn.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.BusanOn.domain.NoticeDTO;

@Repository
public class NoticeDAO {

	@Inject
	private SqlSession sqlSession;

	private static final String NAMESPACE = "com.BusanOn.mappers.noticeMapper";

	public List<NoticeDTO> selectNoticeList(Map<String, Integer> para) {
		return sqlSession.selectList(NAMESPACE + ".selectNoticeList", para);
	}

	public NoticeDTO selectNoticeDetail(int notice_id) {
		return sqlSession.selectOne(NAMESPACE + ".selectNoticeDetail", notice_id);
	}

	public void insertNotice(NoticeDTO noticeDTO) {
		sqlSession.insert(NAMESPACE + ".insertNotice", noticeDTO);
	}

	public void updateViews(int notice_id) {
		sqlSession.update(NAMESPACE + ".updateViews", notice_id);
	}

	public void updateNotice(NoticeDTO noticeDTO) {
		sqlSession.update(NAMESPACE + ".updateNotice", noticeDTO);
	}

	public void deleteNotice(int notice_id) {
		sqlSession.delete(NAMESPACE + ".deleteNotice", notice_id);
	}

	public int noticeCount() {
		return sqlSession.selectOne(NAMESPACE + ".noticeCount");
	}
}
