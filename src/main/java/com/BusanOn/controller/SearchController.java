package com.BusanOn.controller;

import java.nio.file.spi.FileSystemProvider;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.annotation.SuppressAjWarnings;
import org.springframework.format.datetime.joda.LocalDateParser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.BusanOn.dao.SearchDAO;
import com.BusanOn.domain.BusinessDTO;
import com.BusanOn.domain.MemberDTO;
import com.BusanOn.domain.PagingDTO;
import com.BusanOn.domain.PensionDTO;
import com.BusanOn.domain.PensionRmDTO;
import com.BusanOn.domain.ReviewDTO;
import com.BusanOn.function.FunctionClass;
import com.BusanOn.service.ReviewService;
import com.BusanOn.service.SearchService;

import util.DateParse;

@Controller
public class SearchController {

	@Inject
	private SearchService searchService;
	@Inject
	private ReviewService service;
	@Inject
	private SearchDAO searchDAO;

	/* 메인 검색창 날짜 설정 + 인기숙소 리스트 (지연) */
	@RequestMapping(value = "/search/main", method = RequestMethod.GET)
	public String home(PensionDTO pensionDTO, HttpServletRequest request, Model model) {

		/* 검색창 날짜 지정 */
		DateParse dateParse = new DateParse();
		String today = dateParse.getTodayPlus(0);
		String tomorrow = dateParse.getTodayPlus(1);
		request.setAttribute("today", dateParse.strToDate(today));
		request.setAttribute("tomorrow", dateParse.strToDate(tomorrow));

		/* 인기숙소 불러오기 */
		List<PensionDTO> TopList = searchService.getTopList(pensionDTO);

		model.addAttribute("TopList", TopList);

		return "BusanOn/search/main";
	}

	/* 펜션리스트 불러오기 (지연) */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/search/searchP", method = RequestMethod.GET)
	public String list(PensionDTO pensionDTO, HttpServletRequest request, Model model) {

		int totalCount = searchService.pensionCount(pensionDTO);
		String spageNum = request.getParameter("pageNum");
		int ipageNum;
		if (spageNum == null) {
			ipageNum = 1;
		} else {
			ipageNum = Integer.parseInt(request.getParameter("pageNum"));
		}
//		System.out.println(ipageNum );
//		System.out.println(ipageNum );
		PagingDTO pT = new PagingDTO(ipageNum, totalCount);
		model.addAttribute("page", pT);

		int index = (pT.getPageNum() - 1) * pT.getAmount();
//		int amount = pT.getAmount();
		int amount = 10;
		
		/* 검색창 조건 컬럼 */
		String pen_address = request.getParameter("pen_address");
		String pen_name = request.getParameter("pen_name");
		String rm_checkin = request.getParameter("rm_checkin");
		String rm_checkout = request.getParameter("rm_checkout");
		String rm_resable_num = request.getParameter("rm_resable_num");

		Map map = new HashMap();
		map.put("pen_address", pen_address == null ? "" : pen_address);
		map.put("pen_name", pen_name);
		map.put("rm_resable_num", rm_resable_num);
		map.put("index", index);
		map.put("amount", amount);

		/* 펜션 리스트 불러오기 */
		List<PensionDTO> pensionList = searchService.getPensionList(map);
		for (PensionDTO dto : pensionList) {
			if (dto.getRm_price() != null && !dto.getRm_price().isEmpty()) {
				dto.setRm_price(dto.getRm_price().replaceAll("\\B(?=(\\d{3})+(?!\\d))", ","));
			} else {
				dto.setRm_price("0");
			}
		}
		model.addAttribute("pensionList", pensionList);
		//System.out.println(pensionList.size() + " 펜션리스트 사이즈");
		model.addAttribute("page", map);
//		System.out.println(pensionList);

		/* 기존 검색창 날짜 오늘, 내일 날짜로 설정 */
		DateParse dateParse = new DateParse();
		String today = dateParse.getTodayPlus(0);
		String tomorrow = dateParse.getTodayPlus(1);

		// yyyyMMdd -> yyyy-MM-dd
		today = dateParse.strToDate(today);
		tomorrow = dateParse.strToDate(tomorrow);

		/* 카테고리 별 검색 시 현재 날짜로 날짜 설정 */
		if (rm_checkin == null)
			rm_checkin = today;
		if (rm_checkout == null)
			rm_checkout = tomorrow;

//		request.setAttribute("pensionList", pensionList);
		request.setAttribute("pen_address", pen_address);
		request.setAttribute("pen_name", pen_name);
		request.setAttribute("rm_checkin", rm_checkin);
		request.setAttribute("rm_checkout", rm_checkout);
		request.setAttribute("rm_resable_num", rm_resable_num);
		request.setAttribute("today", dateParse.strToDate(today));
		request.setAttribute("tomorrow", dateParse.strToDate(tomorrow));

		return "BusanOn/search/searchP";

	}

	public void listajax2() {

	}

	/* 펜션리스트 무한스크롤 (지연) */
	@ResponseBody
	@RequestMapping(value = "/search/searchPajax", method = RequestMethod.GET)
	public List<PensionDTO> listajax(@RequestParam String count, String index2, PensionDTO pensionDTO,
			HttpServletRequest request, Model model) {
		System.out.println(count + "-count");

		int amount = Integer.parseInt(count.toString());
		int totalCount = searchService.pensionCount(pensionDTO);
		String spageNum = request.getParameter("pageNum");
		int ipageNum;
		if (spageNum == null) {
			ipageNum = 1;
		} else {
			ipageNum = Integer.parseInt(request.getParameter("pageNum"));
		}
//		System.out.println(ipageNum );
//		System.out.println(ipageNum );
		PagingDTO pT = new PagingDTO(ipageNum, totalCount);
		model.addAttribute("page", pT);
		
		String gb = request.getParameter("gb");
		int index = 0;
		if(gb.equals("scroll")) {
			index = (Integer.parseInt(index2) - 1) * pT.getAmount();
		}
		 

		System.out.println(index + "-index");
		/* 검색창 조건 컬럼 */
		String pen_address = request.getParameter("pen_address");
		String pen_name = request.getParameter("pen_name");
		String rm_checkin = request.getParameter("rm_checkin");
		String rm_checkout = request.getParameter("rm_checkout");
		String rm_resable_num = request.getParameter("rm_resable_num");
		String order = request.getParameter("order");
		System.out.println(pen_address);
		System.out.println(pen_name);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pen_address", pen_address);
		map.put("pen_name", pen_name);
		map.put("rm_resable_num", rm_resable_num);
		map.put("index", index);
		map.put("amount", amount);
		map.put("order", order);

		/* 펜션 리스트 불러오기 */
		List<PensionDTO> pensionList = searchService.getPensionList(map);
		for (PensionDTO dto : pensionList) {
			if (dto.getRm_price() != null && !dto.getRm_price().isEmpty()) {
				dto.setRm_price(dto.getRm_price().replaceAll("\\B(?=(\\d{3})+(?!\\d))", ","));
			} else {
				dto.setRm_price("0");
			}
		}
		System.out.println(pensionList.size() + " - list");
		model.addAttribute("pensionList", pensionList);
		model.addAttribute("page", map);
		System.out.println(pensionList);

		/* 기존 검색창 날짜 오늘, 내일 날짜로 설정 */
		DateParse dateParse = new DateParse();
		String today = dateParse.getTodayPlus(0);
		String tomorrow = dateParse.getTodayPlus(1);

		// yyyyMMdd -> yyyy-MM-dd
		today = dateParse.strToDate(today);
		tomorrow = dateParse.strToDate(tomorrow);

		/* 카테고리 별 검색 시 현재 날짜로 날짜 설정 */
		if (rm_checkin == null)
			rm_checkin = today;
		if (rm_checkout == null)
			rm_checkout = tomorrow;

//		request.setAttribute("pensionList", pensionList);
		request.setAttribute("pen_address", pen_address);
		request.setAttribute("pen_name", pen_name);
		request.setAttribute("rm_checkin", rm_checkin);
		request.setAttribute("rm_checkout", rm_checkout);
		request.setAttribute("rm_resable_num", rm_resable_num);
		request.setAttribute("today", dateParse.strToDate(today));
		request.setAttribute("tomorrow", dateParse.strToDate(tomorrow));

		return pensionList;
	}

	/* 펜션 정보 + 방 리스트 불러오기 (지원) */
	@RequestMapping(value = "/search/pensionDetail", method = RequestMethod.GET)
	public String pensionDetail(HttpServletRequest request, Model model) throws Exception {

		/* 파라미터 값(펜션 이름) 저장 */
		String pen_id = request.getParameter("pen_id");
		String rm_checkin = request.getParameter("rm_checkin");
		String rm_checkout = request.getParameter("rm_checkout");

		/* rm_checkin/rm_checkout 값이 null이면 오늘/내일 날짜로 저장 yyyyMMdd -> yyyy-MM-dd */
		DateParse dateParse = new DateParse();
		String today = dateParse.strToDate(dateParse.getTodayPlus(0));
		String tomorrow = dateParse.strToDate(dateParse.getTodayPlus(1));
		
		rm_checkin = rm_checkin == null || rm_checkin == "" ? today : rm_checkin;
		rm_checkout = rm_checkout == null  || rm_checkout == "" ? tomorrow : rm_checkout;

		Map<String, String> param = new HashMap<String, String>();
		param.put("pen_id", pen_id);
		param.put("rm_checkin", rm_checkin);
		param.put("rm_checkout", rm_checkout);
		
		/* 해당 펜션 정보, 방 리스트 불러오기 */
		PensionDTO pensionDTO = searchService.getPensionDetail(pen_id);
		List<BusinessDTO> searchRoomList = searchService.getSearchRoomList(param);

		System.out.println("Pension ID : " + pen_id);
		System.out.println("checkin : " + rm_checkin + " / checkout : " + rm_checkout);

		request.setAttribute("rm_checkin", rm_checkin);
		request.setAttribute("rm_checkout", rm_checkout);
		request.setAttribute("today", today);
		request.setAttribute("tomorrow", tomorrow);

		/* model에 펜션 정보, 방 리스트 저장 */
		model.addAttribute("pen_id", pen_id);
		model.addAttribute("pensionDTO", pensionDTO);
		model.addAttribute("searchRoomList", searchRoomList);
		model.addAttribute("rm_checkin", rm_checkin);
		model.addAttribute("rm_checkout", rm_checkout);
		model.addAttribute("today", today);
		model.addAttribute("tomorrow", tomorrow);
		reviewtest(model, request);
		return "BusanOn/search/pensionDetail";

	}

	public void reviewtest(Model model, HttpServletRequest req) throws Exception {
		String pen_id = req.getParameter("pen_id");
		int index = 0;
		int amount = 1;
		Map<String, Object> sMap = new HashMap<String, Object>();
		sMap.put("pen_id", pen_id);
		sMap.put("index", index);
		sMap.put("amount", amount);
		Map<String, Object> avg = service.staravg(pen_id);
		model.addAttribute("avg", avg);

		List<ReviewDTO> rList = service.selectreviewlist(sMap);
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		for (ReviewDTO dto : rList) {
			Date nowdate = formatter.parse(new FunctionClass().nowTime("yyyy-MM-dd"));
			int stamp = 24 * 60 * 60 * 1000;

			if (dto.getRev_date() != null && !("".equals(dto.getRev_date()))) {
				Date rdate = formatter.parse(dto.getRev_date());
				Long rt = (nowdate.getTime() - rdate.getTime()) / stamp;
				if (rt == 0) {
					dto.setRev_date("ToDay ReView");
				} else {
					dto.setRev_date(rt.toString() + "일 전");
				}
			}

			if (dto.getAns_date() != null && !("".equals(dto.getAns_date()))) {
				Date adate = formatter.parse(dto.getAns_date());
				Long at = (nowdate.getTime() - adate.getTime()) / stamp;
				if (at == 0) {
					dto.setAns_date("ToDay Answer");
				} else {
					dto.setAns_date(at.toString() + "일 전");
				}
			}

		}
		System.out.println(rList);
		model.addAttribute("List", rList);
	}

	/* 결제페이지에 펜션 + 방 정보 불러오기 (지원) */
	@RequestMapping(value = "/search/reserve", method = RequestMethod.GET)
	public String reserve(HttpServletRequest request, HttpSession session, Model model) throws ParseException {

//		String pen_name = request.getParameter("pen_name");
		int room_id = Integer.parseInt(request.getParameter("room_id"));
		int rm_price = Integer.parseInt(request.getParameter("rm_price"));
		String rm_checkin = request.getParameter("rm_checkin");
		String rm_checkout = request.getParameter("rm_checkout");
		String user_id = session.getAttribute("user_id").toString();
		String user_type = session.getAttribute("user_type").toString();
		Map<String, Object> sMap = new HashMap<String, Object>();
		sMap.put("user_id", user_id);
		sMap.put("user_type", user_type);
		// 날짜 차이 계산
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date startDate = new Date(dateFormat.parse(rm_checkin).getTime());
		Date endDate = new Date(dateFormat.parse(rm_checkout).getTime());

		long calculate = endDate.getTime() - startDate.getTime();
		int days = (int) (calculate / (1000 * 60 * 60 * 24));

		// 총 결제금액 = 1박 당 가격 * 일수
		int total = rm_price * days;
		
		// 1 부터 100 까지 난수 생성_kjw 추가
		int uidRandom = (int)(Math.random() * 100) + 1;

//		System.out.println("펜션 이름 : " + pen_name);
		System.out.println("방 번호 : " + room_id);
		System.out.println("방 가격 : " + rm_price + " 원 /" + days + "박");
		System.out.println("checkin : " + rm_checkin + " / checkout : " + rm_checkout);
		System.out.println("총 결제금액 : " + total + " 원");
		System.out.println("랜덤번호 : " + uidRandom);
		
		BusinessDTO businessDTO = searchService.getRoomDetail(room_id);
		MemberDTO memberDTO = searchService.getNamePhone(sMap);

		request.setAttribute("rm_checkin", rm_checkin);
		request.setAttribute("rm_checkout", rm_checkout);

//		model.addAttribute("pen_name", pen_name);
		model.addAttribute("businessDTO", businessDTO);
		model.addAttribute("rm_checkin", rm_checkin);
		model.addAttribute("rm_checkout", rm_checkout);
		model.addAttribute("days", days);
		model.addAttribute("total", total);
		model.addAttribute("memberDTO", memberDTO);
		model.addAttribute("uidRandom", uidRandom);

		return "BusanOn/search/reserve";

	}

}
