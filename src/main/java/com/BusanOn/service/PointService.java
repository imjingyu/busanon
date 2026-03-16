package com.BusanOn.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.BusanOn.dao.PointDAO;
import com.BusanOn.domain.PointDTO;

@Service
public class PointService {

	@Inject
	private PointDAO pointDAO;

	public List<PointDTO> selectPointList(Map<String, Object> para) {
		return pointDAO.selectPointList(para);
	}

	public int selectPointBalance(Map<String, Object> para) {
		return pointDAO.selectPointBalance(para);
	}

	public void addPoint(String user_id, String user_type, String point_type, int amount, String description) {
		Map<String, Object> balPara = new HashMap<String, Object>();
		balPara.put("user_id", user_id);
		balPara.put("user_type", user_type);
		int currentBalance = pointDAO.selectPointBalance(balPara);

		int newBalance;
		if ("EARN".equals(point_type)) {
			newBalance = currentBalance + amount;
		} else {
			newBalance = currentBalance - amount;
		}

		Map<String, Object> para = new HashMap<String, Object>();
		para.put("user_id", user_id);
		para.put("user_type", user_type);
		para.put("point_type", point_type);
		para.put("point_amount", amount);
		para.put("description", description);
		para.put("balance", newBalance);

		pointDAO.insertPoint(para);
	}
}
