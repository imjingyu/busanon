package com.BusanOn.function;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import org.springframework.ui.Model;

import com.BusanOn.domain.PagingDTO;

public class FunctionClass {
	
	// 팬션 고유번호 생성
	public String simplePenSionCreateCode() {
		StringBuilder sb = new StringBuilder();
		Random r = new Random();
		sb.append((char)(r.nextInt(26) + 65));
		for (int i = 0; i < 12; i++) {
			sb.append(r.nextInt(10));
		}
		return sb.toString();
	}
	
	// 현재시간
	public String nowTime(String pattern) {
		return LocalDateTime.now().format(DateTimeFormatter.ofPattern(pattern));
	}
	
	//페이징 처리(현재페이지 , 총 데이터 개수, 모델)
	public Map<String, Integer> pagingFunction(int pageNum, int totalCount, Model model) {
		// 페이징DTO 생성
		PagingDTO pT = new PagingDTO(pageNum, totalCount);
		model.addAttribute("page", pT);
		
		//변수값 생성
		int index = (pT.getPageNum() - 1) * pT.getAmount(); //현재 페이지 
		int amount = pT.getAmount(); // 페이지당 데이터 개수
		
		// Key, Value 형태로 return
		Map<String, Integer> para = new HashMap<String, Integer>();
		para.put("index", index);
		para.put("amount", amount);
		
		return para;
	}
}
