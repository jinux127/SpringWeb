package com.jointree.responsive.controller;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.jointree.responsive.service.impl.BoardServiceImpl;

@RestController
@RequestMapping(value = "/responsive")
public class ResponsiveController {
	
	@Resource(name = "BoardService")
	private BoardServiceImpl boardService;
	
	@RequestMapping(value = "/main")
	public ModelAndView responsiveMain() {
		ModelAndView mv = new ModelAndView("jsonView");
		
		mv.setViewName("responsiveMain.responsive");
		return mv;
	}

	@RequestMapping(value = "/androidMain")
	public ModelAndView androidMain() {
		ModelAndView mv = new ModelAndView("jsonView");
		mv.setViewName("androidMain.responsive");
		return mv;
	}

	
	/* 2021.05.30 수정
	 * 게시판 전체 조
	 */
	@RequestMapping(value = "/getAllList.do")
	public @ResponseBody Map<String,Object> getAllList() throws Exception {
		return boardService.getAllList();
	}
	
	/* 2021.06.03
	 * Retrofit 통신 Ex
	 */
	@RequestMapping(value = "/retrofit.do")
	public ModelAndView retrofitEx() throws Exception {	
		System.out.println("호출됨");
		ModelAndView mv = new ModelAndView("jsonView");
		mv.setViewName("androidMain.responsive");
		return mv;

	}

}
