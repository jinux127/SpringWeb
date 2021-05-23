package com.jointree.trms.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jointree.common.service.UserService;
import com.jointree.common.vo.UserInfo;
import com.jointree.trms.service.impl.ReservationServiceImpl;
import com.jointree.trms.service.impl.WorkplaceServiceImpl;

@Controller
@RequestMapping(value = "/host")
public class HostController {
	
	private Logger log = Logger.getLogger(HostController.class);
	
	@Resource(name="reservationService")
	ReservationServiceImpl reservationService;

	@Resource
	UserService userService;
	
	@Resource(name="workplaceService")
	private WorkplaceServiceImpl workplaceService;
	
	/*
	 * 2021.03.12 수정
	 * 예약조회 페이지
	 */
	@RequestMapping(value = "/rsvlist")
	public ModelAndView rsvList() throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		
		mv.setViewName("rsvList.tiles");
		return mv;
	}
	
	/*
	 * 2021.03.22 수정 
	 * 예약 페이지 리스트 조회
	 */
	@RequestMapping(value = "/getAllRsvList.do")
	public @ResponseBody Map<String,Object> getAllRsvList(@RequestParam Map<String, Object> requestMap,  Principal principal) throws Exception{
		
		String userId = principal.getName();
		requestMap.put("userId", userId);
		
		return reservationService.getAllRsvList(requestMap);
	}
	/*
	 * 2021.03.22 수정 
	 * 예약 페이지 리스트 조회
	 */
	@RequestMapping(value = "/getRsvList.do")
	public @ResponseBody Map<String,Object> getRsvList(@RequestParam Map<String, Object> requestMap,  Principal principal) throws Exception{
		String userId = principal.getName();
		requestMap.put("userId", userId);
		
		return reservationService.getRsvList(requestMap);
	}

	/*
	 * 2021.03.18 수정 
	 * 예약자 상태변경
	 */
	@RequestMapping(value = "/updateRsvStatus.do")
	public ModelAndView updateRsvStatus(@RequestParam  Map<String, Object> requestMap) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		
		reservationService.updateRsvStatus(requestMap);
		
		return mv;
	}
	/*
	 * 2021.03.19 생성
	 * 마이 페이지 by hoin
	 */
	@RequestMapping(value="/mypage", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView mypage(Principal principal) throws Exception{
		
		String hostId = principal.getName();
		
		ModelAndView mv = new ModelAndView("jsonView");
		String hostSeq = workplaceService.getHostSeq(hostId);

		mv.addObject("hostId", hostId);
		mv.addObject("hostSeq",hostSeq);
		mv.setViewName("mypage.tiles");
			
		return mv;
	}
	
	/*
	 * 2021.03.19 생성
	 * 기본 정보 호출 by hoin
	 */
	@RequestMapping(value="/getUserInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView getUserInfo(String hostId) throws Exception{
		
		ModelAndView mv = new ModelAndView("jsonView");
		UserInfo info = userService.getUserInfo(hostId);
		mv.addObject("info",info);
		
		return mv;
	}
	
	/*
	 * 2021.03.19 생성
	 * 은행 리스트 호출 by hoin
	 */
	@RequestMapping(value="/getAccountList.do", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView getAccountList(String hostId) throws Exception{
		
		ModelAndView mv = new ModelAndView("jsonView");
		List<UserInfo> result = userService.getAccountList(hostId);
		mv.addObject("List",result);
		
		return mv;
	}
	
	/*
	 * 2021.03.22 생성
	 * 계좌 등록 by hoin
	 */
	@RequestMapping(value="/insertAccount.do", method = RequestMethod.POST)
	@ResponseBody
	public void insertAccount(UserInfo userInfo) throws Exception{
		userService.insertAccount(userInfo);
	}
	
	/*
	 * 2021.03.22 생성
	 * 계좌 수정 by hoin
	 */
	@RequestMapping(value="/setAccount.do", method = RequestMethod.POST)
	@ResponseBody
	public void setAccount(UserInfo userInfo) throws Exception{
		userService.setAccount(userInfo);
	}
	
	/*
	 * 2021.03.22 생성
	 * 계좌 삭제 by hoin
	 */
	@RequestMapping(value="/deleteAccount.do", method = RequestMethod.POST)
	@ResponseBody
	public void deleteAccount(String accountSeq) throws Exception{
		userService.deleteAccount(accountSeq);
	}
	
}
