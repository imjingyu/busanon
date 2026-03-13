package com.BusanOn.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.BusanOn.dao.BusinessDAO;
import com.BusanOn.domain.BusinessDTO;
import com.BusanOn.domain.MemberDTO;
import com.BusanOn.domain.ReservationDTO;
import com.BusanOn.domain.ReviewDTO;
import com.BusanOn.function.FunctionClass;
import com.BusanOn.service.BookService;
import com.BusanOn.service.BusinessService;

@Controller
public class BusinessController extends FunctionClass {
	
	@Inject
	private BusinessService businessService;
	
	
	
	// 업로드 경로
//		Resource(name = "servlet-context.xml에 있는 업로드 경로의 id값")
	@Resource(name="uploadPath")
	private String uploadPath;
	
//	@Resource(name="uploadPath2")
//	private String uploadPath2;
	
	@RequestMapping(value = "/business/b_myPage", method = RequestMethod.GET)
	public String b_myPage(HttpSession session) {
		String user_type = (String)session.getAttribute("user_type");
		if(user_type == null) user_type = "0";
		
		if(user_type.equals("2")) return "BusanOn/business/b_myPage";
		else return "BusanOn/business/msg";
	}
	
	
	@RequestMapping(value = "/business/b_index", method = RequestMethod.GET)
	public String b_index(HttpSession session, Model model, ReservationDTO reservationDTO) {
		String user_type = (String)session.getAttribute("user_type");
		if(user_type == null) user_type = "0";
		if(user_type.equals("2")) {
			// 사업자페이지 로그인아이디 화면단 표시 구현
			System.out.println("유저타입 : " + session.getAttribute("user_type"));
			String user_id = (String)session.getAttribute("user_id");
			Map<String, Object> sMap = new HashMap<String, Object>();
			sMap.put("user_id", user_id);
			sMap.put("user_type", user_type);
			// 사업자페이지 초기화면 데이터 표시 구현
			
			
			Map<String, Object> uMap = businessService.reservationAtMonth(sMap);
			System.out.println(uMap);
			model.addAttribute("AtMonth",uMap);
				return "BusanOn/business/b_index";
		} else {
		}
		return "BusanOn/business/msg"; 
	}
	
	
	
//	@RequestMapping(value = "/business/listPayment", method = RequestMethod.GET)
//	public String listPayment(HttpSession session) {
//				
//		String user_type = (String)session.getAttribute("user_type");
//		if(user_type == null) user_type = "0";
//		
//		if(user_type.equals("2")) return "BusanOn/business/listPayment";
//		else return "BusanOn/business/msg";
//	}
	
	
	
	@RequestMapping(value = "/business/roomList", method = RequestMethod.GET)
	public String roomList(Model model, BusinessDTO businessDTO, HttpSession session) {
		
		String user_type = (String)session.getAttribute("user_type");
		if(user_type == null) user_type = "0";
		
		if(user_type.equals("2")) {
			
			String user_id = (String)session.getAttribute("user_id");
			
			businessDTO.setUSER_ID(user_id);
			
			List<BusinessDTO> roomList = businessService.getRoomList(businessDTO);
			
			model.addAttribute("rList", roomList);
			
			return "BusanOn/business/roomList";
			
		} else {
			return "BusanOn/business/msg";
		}
	}
	
//	가상주소 시작점 http://localhost:8080/myweb2/board/updatePro
	@RequestMapping(value = "/business/roomListPro", method = RequestMethod.POST)
	public String roomListPro(BusinessDTO businessDTO) {
			
			
			businessService.updateRoomList(businessDTO);
			// 주소변경하면서 이동
			return "redirect:/business/roomList";
	}
	
//	가상주소 시작점 http://localhost:8080/myweb2/business/remove
	@RequestMapping(value = "/business/remove", method = RequestMethod.POST)
	public String remove(BusinessDTO businessDTO, Model model) {
			
			List<BusinessDTO> roomList = businessService.getRoomList(businessDTO);
			model.addAttribute("rList", roomList);
			
			businessService.deleteRoomList(businessDTO);
			// 주소변경하면서 이동
			return "redirect:/business/roomList";
	}

	
	@RequestMapping(value = "/business/roomRegister", method = RequestMethod.GET)
	public String roomRegister(HttpSession session, Model model) {
		
		String user_type = (String)session.getAttribute("user_type");
		if(user_type == null) user_type = "0";
		
		if(user_type.equals("2")) {
			
			System.out.println("유저타입 : " + session.getAttribute("user_type"));
			// 팬션 고유번호 
			String pen_id = simplePenSionCreateCode();
			
			// 팬션 고유번호값이 넘어 오는지 확인
//			System.out.println(pen_id);
			
			// 팬션 고유번호를 model로 받아 view에 전달
			model.addAttribute("pen_id", pen_id);
			
			return "BusanOn/business/roomRegister";
		} else {
			return "BusanOn/business/msg";
		}
	}
	
	@RequestMapping(value = "/business/roomRegisterPro", method = RequestMethod.POST)
	public String roomRegisterPro(MemberDTO memberDTO, HttpServletRequest request, MultipartHttpServletRequest RM_IMAGE, MultipartFile PEN_IMAGE,HttpSession session) throws Exception {
			
		
		// PENSION
		// 업로드 파일 이름 => 랜덤문자_파일이름 변경
		UUID uuid = UUID.randomUUID();
		String filename2= uuid.toString()+"_"+PEN_IMAGE.getOriginalFilename();
		// 업로드 파일 file.getBytes() => upload/랜덤문자_파일이름 복사
		// File uploadFile = new File(upload경로,파일이름);
		// File uploadFile = new File(uploadPath,filename);
		File uploadFile2 = new File(uploadPath,filename2);
						
		// FileCopyUtils.copy(RM_IMAGE.getBytes(), uploadFile);
		FileCopyUtils.copy(PEN_IMAGE.getBytes(), uploadFile2);
		
		// rommRegister.jsp의 Form에서 Parameter값을 받아오기 위한 DTO 객체 생성
		BusinessDTO businessDTO = new BusinessDTO();
		
		// session에서 id값을 가져와서 DTO에 담기위한 코드
		String user_id = (String)session.getAttribute("user_id");
		String user_type = (String)session.getAttribute("user_type");
		// address 주소 부분이 기본 주소 와 상세주소로 나뉘어 2개의 파라미터값을 받아올 String변수 생성
		String address = request.getParameter("user_address") +" "+request.getParameter("user_address2");
		
		businessDTO.setPEN_ID(request.getParameter("PEN_ID"));
		businessDTO.setUSER_ID(user_id);
		businessDTO.setUSER_TYPE(user_type);
		businessDTO.setPEN_NAME(request.getParameter("PEN_NAME"));
		businessDTO.setPEN_NUMBER(request.getParameter("PEN_TEL"));
		businessDTO.setPEN_ZIPCODE(request.getParameter("postNum"));
		businessDTO.setPEN_ADDRESS(address);
		
		businessService.registerPen(businessDTO);
		
		// PENSION_Attach
		// rommRegister.jsp의 Form에서 Parameter값을 받아오기 위한 DTO 객체 생성
		BusinessDTO businessDTO2 = new BusinessDTO();
		businessDTO2.setPEN_ID(request.getParameter("PEN_ID"));
		businessDTO2.setPEN_IMAGE(filename2);
		
		businessService.pensionAttach(businessDTO2);
		
		// PENSION_ROOM
		// rommRegister.jsp의 Form에서 Parameter값을 받아오기 위한 DTO 객체 생성
		BusinessDTO businessDTO3 = new BusinessDTO();
		
		// Form에서 accordion으로 동일 name의 여러 parameter값을 가져와야하기때문에
		// String[] 배열로 parameterValues값을 담는다
		// ( 1개의 prameter값은 getParameterValue, 2개 이상은 getParameterValues 사용)
		String[] NAME = request.getParameterValues("RM_NAME");
		String[] CHECKIN = request.getParameterValues("checkin");
		String[] CHECKOUT = request.getParameterValues("checkout");
		String[] RESABLE_NUM = request.getParameterValues("people");
		String[] PRICE = request.getParameterValues("RM_Price");
		
		
		String PEN_ID = request.getParameter("PEN_ID");
		String RM_NAME = "";
		String RM_CHECKIN = "";
		String RM_CHECKOUT = "";
		String RM_RESABLE_NUM = "";
		String RM_PRICE = "";
		String RES_STATUS = "0"; // 예약상태를 따로 입력하지않고 하드코딩했음
		
		String filename = "";
		List<MultipartFile> fileList = RM_IMAGE.getFiles("RM_IMAGE");
		
		Map<String, Object> pensionRoom = new HashMap<String, Object>();
		
		// 배열에 있는 값들을 DB에 입력하기 위해
		// 반복문 for문을 사용
		for(int i = 0; i < NAME.length; i++) {
			
			filename = uuid.toString()+"_"+fileList.get(i).getOriginalFilename();
			File uploadFile = new File(uploadPath,filename);
			FileCopyUtils.copy(fileList.get(i).getBytes(), uploadFile);
			
			System.out.println(NAME[i]);
			System.out.println(CHECKIN[i]);
			System.out.println(CHECKOUT[i]);
			System.out.println(RESABLE_NUM[i]);
			System.out.println(PRICE[i]);
			
			RM_NAME = NAME[i];
			RM_CHECKIN = CHECKIN[i];
			RM_CHECKOUT = CHECKOUT[i];
			RM_RESABLE_NUM = RESABLE_NUM[i];
			RM_PRICE = PRICE[i];
			
			businessDTO3.setPEN_ID(PEN_ID);
			businessDTO3.setRM_NAME(RM_NAME);
			businessDTO3.setRM_CHECKIN(RM_CHECKIN);
			businessDTO3.setRM_CHECKOUT(RM_CHECKOUT);
			businessDTO3.setRM_RESABLE_NUM(RM_RESABLE_NUM);
			businessDTO3.setRM_PRICE(RM_PRICE);
			businessDTO3.setRES_STATUS(RES_STATUS);
			businessDTO3.setRM_IMAGE(filename);
			
			// DTO 객체의 여러 값을 List에 담기위한 List 객체 생성
			List<BusinessDTO> room = new ArrayList<BusinessDTO>();
			room.add(businessDTO3);
			
			// List에 담긴 값을 key값과 value값으로 나누기 위해 Map사용 
			pensionRoom.put("room", room);
		
			businessService.pensionRoom(pensionRoom);
		}
		
		
		// ROOM_ATTACH
		// rommRegister.jsp의 Form에서 Parameter값을 받아오기 위한 DTO 객체 생성
//		BusinessDTO businessDTO4 = new BusinessDTO();
		
		// Form에서 accordion으로 동일 name의 여러 parameter값을 가져와야하기때문에
		// String[] 배열로 parameterValues값을 담는다
		// ( 1개의 prameter값은 getParameterValue, 2개 이상은 getParameterValues 사용)
//		String[] RM_NAMES = request.getParameterValues("RM_NAME");
//		String result = "";
//		String filename = "";
		
		// List에 담긴 값을 key값과 value값으로 나누기 위해 Map사용 
//		Map<String, Object> registerRoom = new HashMap<String, Object>();
		
		// input태그의 file타입의 여러 동일이름의 parameter값을 List 담기위한 코드
//		List<MultipartFile> fileList = RM_IMAGE.getFiles("RM_IMAGE");
		
		// 배열에 있는 값들을 DB에 입력하기 위해
		// 반복문 for문을 사용 
//		for(int i = 0; i < RM_NAMES.length; i++) {
			
			// RM_NAMES 값들이 잘넘어오는 지 확인하기 위한 println 코드
			// 확인 후 주석 처리
			// System.out.println(RM_NAMES[i]);
			
//			result = RM_NAMES[i];
//			filename = uuid.toString()+"_"+fileList.get(i).getOriginalFilename();
//			File uploadFile = new File(uploadPath,filename);
//			FileCopyUtils.copy(fileList.get(i).getBytes(), uploadFile);
			// filename 값들이 잘넘어오는지 확인하기위한 println 코드
			// 확인 후 주석 처리
			// System.out.println(filename);
			
//			businessDTO4.setRM_NAME(result);
//			businessDTO4.setRM_IMAGE(filename);
			
			// DTO 객체의 여러 값을 List에 담기위한 List 객체 생성
//			List<BusinessDTO> roomAttach = new ArrayList<BusinessDTO>();
//			roomAttach.add(businessDTO4);
//			
//			// List에 담긴 값을 key값과 value값으로 나누기 위해 Map사용
//			registerRoom.put("roomAttach", roomAttach);
//		
//			businessService.registerRoom(registerRoom);
//		}
		
		
		
				
		return "redirect:/business/roomList";
	}
	
	@RequestMapping(value = "/business/mypage/listReservation", method = RequestMethod.GET)
	public String b_listReservation() {
				
		return "BusanOn/business/mypage/listReservation";
	}
	
	@RequestMapping(value = "/business/mypage/listInquiry", method = RequestMethod.GET)
	public String b_listInquiry() {
				
		return "BusanOn/business/mypage/listInquiry";
	}
	
	/*사업자 리뷰조회 0919수정지연*/
	@RequestMapping(value = "/business/b_reviewlist", method = RequestMethod.GET)
	public String b_reviewlist(ReviewDTO rT, HttpServletRequest req,HttpSession session, Model model) {
		String user_id = session.getAttribute("user_id").toString();
		rT.setUser_id(user_id);
		int totalCount = businessService.replyCount(rT);
		String spageNum = req.getParameter("pageNum");
		int ipageNum;
		if(spageNum == null) {
			ipageNum = 1;
		}else {
			ipageNum = Integer.parseInt(req.getParameter("pageNum"));
		}
		
		Map<String, Integer> para = new FunctionClass().pagingFunction(ipageNum, totalCount, model);
		System.out.println(para);
		Map<String, Object> para2 = new HashMap<String, Object>();
		para2.put("amount", para.get("amount"));
		para2.put("index", para.get("index"));
		para2.put("user_id", user_id);
//		System.out.println(para2);
		List<ReviewDTO> rtl = businessService.reviewList(para2);
		System.out.println(rtl);
		model.addAttribute("List", rtl);
		/*
		 * String user_id = session.getAttribute("user_id").toString(); 
		 * List<ReviewDTO> rtl = businessService.reviewList(user_id);
		 */

		return "BusanOn/business/b_reviewlist";
	}
	
	/*사업자 리뷰조회 0919수정지연 */
	@RequestMapping(value = "/business/b_reviewlistPro", method = RequestMethod.POST)
	public String b_reviewlist(ReviewDTO reviewDTO) {
		System.out.println(123);
		reviewDTO.setAns_date(new FunctionClass().nowTime("yyyy-MM-dd"));
		reviewDTO.setReply("Y");
		System.out.println(reviewDTO);
		businessService.updateAnwser(reviewDTO);
		return "redirect:/business/b_reviewlist";
	}
	
}
