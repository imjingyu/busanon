package com.BusanOn.controller;

import java.io.File;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.BusanOn.domain.ReviewDTO;
import com.BusanOn.function.FunctionClass;
import com.BusanOn.service.PointService;
import com.BusanOn.service.ReviewService;


@Controller
public class ReviewController {
	
	@Inject
	private ReviewService service;

	@Inject
	private PointService pointService;

	@Resource(name="reviewUploadPath")
	private String uploadPath;

	
	@ResponseBody
	@RequestMapping(value = "/search/reviewimagePro", method = RequestMethod.POST)
	public void reviewimagePro(@RequestParam("files") ArrayList<MultipartFile> filelist) throws Exception{
		
	    for (MultipartFile file : filelist) {
	    	UUID uuid = UUID.randomUUID();
			String filename = uuid.toString() + "_" + file.getOriginalFilename();
			File uploadfile = new File(uploadPath,filename);
			FileCopyUtils.copy(file.getBytes(), uploadfile);
			service.insertimage(filename);
			
		}
	}
	
	@RequestMapping(value = "/search/reviewPro", method = RequestMethod.POST)
	public String reviewPro(ReviewDTO rT, HttpServletRequest req) throws Exception{
		String pen_name = req.getParameter("pen_name");
		String rm_checkin = req.getParameter("rm_checkin");
		String rm_checkout = req.getParameter("rm_checkout");
		int count = service.reviewcount();
		rT.setRev_num(count);
		rT.setRev_date(new FunctionClass().nowTime("yyyy-MM-dd"));
		service.insertreview(rT);
		String user_id = rT.getUser_id();
		String user_type = rT.getUser_type();
		pointService.addPoint(user_id, user_type, "EARN", 200, "리뷰 작성 포인트 적립");
		String rpen_name = URLEncoder.encode(pen_name, "UTF-8");
		return "redirect:/search/pensionDetail?pen_id="+rT.getPen_id()+"&pen_name="+rpen_name+"&rm_checkin="+rm_checkin+"&rm_checkout="+rm_checkout+"";
	}
	
	@ResponseBody
	@RequestMapping(value = "/search/reviewajax", method = RequestMethod.GET)
	public List<ReviewDTO> reviewajax(@RequestParam Map<String, Object> sMap) throws Exception{
		System.out.println(sMap);
		List<ReviewDTO> rList = service.selectreviewlist(sMap);
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		for (ReviewDTO dto : rList) {
			Date nowdate = formatter.parse(new FunctionClass().nowTime("yyyy-MM-dd"));
			int stamp = 24*60*60*1000;
			
			
			if(dto.getRev_date() != null && !("".equals(dto.getRev_date()))) {
				Date rdate = formatter.parse(dto.getRev_date());
				Long rt = (nowdate.getTime() - rdate.getTime())  / stamp;
				if(rt == 0) {
					dto.setRev_date("ToDay ReView");
				}else {
					dto.setRev_date(rt.toString() + "일 전");
				}
			}
			
			if(dto.getAns_date() != null && !("".equals(dto.getAns_date()))) {
				Date adate = formatter.parse(dto.getAns_date());
				Long at = (nowdate.getTime() - adate.getTime())  / stamp;
				if(at == 0) {
					dto.setAns_date("ToDay Answer");
				}else {
					dto.setAns_date(at.toString() + "일 전");
				}
			}
			
		}
		System.out.println(rList);
		return rList;
	}
	
//	@RequestMapping(value = "/review", method = RequestMethod.GET)
//	public String test(Model model) throws Exception{
//		String pen_id = "1";
//		Map<String, Object> avg = service.staravg(pen_id);
//		model.addAttribute("avg", avg);
//		
//		List<ReviewDTO> rList = service.selectreviewlist(pen_id);
//		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
//		for (ReviewDTO dto : rList) {
//			Date nowdate = formatter.parse(new FunctionClass().nowTime("yyyy-MM-dd"));
//			int stamp = 24*60*60*1000;
//			
//			
//			if(dto.getRev_date() != null && !("".equals(dto.getRev_date()))) {
//				Date rdate = formatter.parse(dto.getRev_date());
//				Long rt = (nowdate.getTime() - rdate.getTime())  / stamp;
//				if(rt == 0) {
//					dto.setRev_date("ToDay ReView");
//				}else {
//					dto.setRev_date(rt.toString() + "일 전");
//				}
//			}
//			
//			if(dto.getAns_date() != null && !("".equals(dto.getAns_date()))) {
//				Date adate = formatter.parse(dto.getAns_date());
//				Long at = (nowdate.getTime() - adate.getTime())  / stamp;
//				if(at == 0) {
//					dto.setAns_date("ToDay Answer");
//				}else {
//					dto.setAns_date(at.toString() + "일 전");
//				}
//			}
//			
//		}
//		System.out.println(rList);
//		model.addAttribute("List", rList);
//		return "BusanOn/review";
//	}
}
