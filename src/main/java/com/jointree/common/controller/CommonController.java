package com.jointree.common.controller;

import java.security.Principal;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jointree.common.service.CommonService;
import com.jointree.common.util.FcmUtil;
import com.jointree.trms.HomeController;

@Controller
public class CommonController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Resource
	CommonService commonService;

//	알림 전송 테스트 용도 삭제 예정
	@RequestMapping(value = "/sendNoti")
	public void sendNoti(HttpServletRequest request, HttpServletResponse response) throws Exception{
		System.out.println("======== sendNoti 시작==========");

//		토큰을 조회하기 위해 아이디를 넣어야함
		String tokenId = commonService.lookupToken("test");
//		보내고싶은 타이틀과 내용
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String url = "http://192.168.0.158:8080/";
		
		FcmUtil FcmUtil = new FcmUtil();
		FcmUtil.send_FCM(tokenId, title, content, url,request);
		
		System.out.println("========sendNoti 끝==========");
		
	}

//	url 수정 시 안드로이드 url 부분도 수정할 것	
	@RequestMapping(value = "/updateToken")
	public ModelAndView updateToken(Locale locale, HttpServletRequest request, Principal principal) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		
		
		System.out.println("====updateToken Start===="+ formattedDate);
		
		ModelAndView mv = new ModelAndView("jsonView");
		
//		String token = (String) param.get("AndroidToken");
//		String userId = (String) param.get("userId");
		String token = request.getParameter("AndroidToken");
		String userId = request.getParameter("userId");
//		String userId = principal.getName();
		System.out.println(token);
		System.out.println(userId);
		commonService.updateToken(token, userId);
		
		/*
		 * ServletRequestAttributes attr = (ServletRequestAttributes)
		 * RequestContextHolder.currentRequestAttributes();
		 * System.out.println("attr 시작");
		 * System.out.println(attr.getRequest().getParameter("token"));
		 * System.out.println("attr 끝");
		 */
		
		System.out.println("====updateToken Finish====");
		
		return mv;
	}
}
