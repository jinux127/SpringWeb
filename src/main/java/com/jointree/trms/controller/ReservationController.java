package com.jointree.trms.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.firestore.v1.MapValue;
import com.jointree.common.service.CommonServiceImpl;
import com.jointree.common.util.FcmUtil;
import com.jointree.trms.service.impl.ProductServiceImpl;
import com.jointree.trms.service.impl.ReservationServiceImpl;
import com.jointree.trms.service.impl.WorkplaceServiceImpl;
import com.jointree.trms.vo.ProductVO;
import com.jointree.trms.vo.WorkplaceVO;

@Controller
@RequestMapping(value = "/rsv")
public class ReservationController {
	
	@Autowired
	private ReservationServiceImpl reservationService;
	
	@Resource(name="productService")
	private ProductServiceImpl productService;
	
	@Resource(name="workplaceService")
	private WorkplaceServiceImpl workplaceService;
	
	@Autowired
	private CommonServiceImpl commonService;
	
	@RequestMapping(value = "")
	public String getReservation() {
		return "rsv.basic2";
	}
//	예약자가 예약 후 페이지
	@RequestMapping(value = "/rsvResult", method = RequestMethod.GET)
	public ModelAndView getResvResult(HttpServletRequest request,int productSeq ) {
		ModelAndView mv = new ModelAndView("jsonView");
		
//		String productSeq = request.getParameter("productSeq");
		
		mv.addObject("productSeq", productSeq);
		
		mv.setViewName("rsvResult.tiles");
		return mv;
	}
	
	
//	예약하는 기능
//	수정예정 : 호스트 정보를 principal 로 불러오지말고 DB로 불러와야함
	@RequestMapping(value = "/rsvctm.do")
	public ModelAndView rsvctm(HttpServletRequest request,@RequestParam  Map<String, Object> requestMap) {
		ModelAndView mv = new ModelAndView("jsonView");
		
//		노티 클릭시 이동할 url 
		String url = "http://192.168.0.158:8080/host/rsvlist";
		
//		랜덤값 생성
		long t = System.currentTimeMillis();
		int r = (int)(Math.random()*1000000);
//		랜덤값 저장
		String reservationNumber = ""+t+r; 
		
		requestMap.put("reservationNumber", reservationNumber);
//		예약자 정보 저장
		reservationService.rsvctm(requestMap);
//		예약한 상품 저장
		reservationService.productRsv(requestMap);
//		예약자와 상품 매핑
		reservationService.rsvMapping(requestMap);
		
		String tokenId = commonService.lookupToken(requestMap.get("productSeq").toString());
		FcmUtil fcmUtil = new FcmUtil();
		fcmUtil.send_FCM(tokenId, requestMap.get("productSeq").toString() +" 상품 예약 완료", requestMap.get("rsvctmName").toString() + "님이 예약하셨습니다", url,request);
		
		mv.addObject("productSeq", requestMap.get("productSeq").toString());
		
		
		return mv;
	}
	
	
	
	/*
	 * 테스트 용도였음 수정 예정
	 * @RequestMapping(value = "/productRsv.do") public ModelAndView
	 * productRsv(HttpServletRequest request) { ModelAndView mv = new
	 * ModelAndView("jsonView");
	 * 
	 * String productSeq = request.getParameter("productSeq");
	 * 
	 * reservationService.productRsv(productSeq);
	 * 
	 * return mv; }
	 */
	
	
	
//	
	@RequestMapping(value="/getProductInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView getProductInfo(String productSeq) throws Exception {
		
		ModelAndView mv = new ModelAndView("jsonView");
		
//		상품 정보 담기 위한 서비스
		ProductVO productVO = new ProductVO();
		productVO = productService.getProductInfo(productSeq);
		String workplaceSeq = productVO.getWorkplaceSeq();
//		계좌정보 담기 위한 서비스
		WorkplaceVO workplaceVO = workplaceService.getWorkplaceInfo(workplaceSeq);

		mv.addObject("workplaceVO",workplaceVO);
		mv.addObject("productVO", productVO);
		
		return mv;
	}
	
}
