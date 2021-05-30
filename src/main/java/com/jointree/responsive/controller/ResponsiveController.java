package com.jointree.responsive.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jointree.responsive.service.impl.BoardServiceImpl;

@Controller
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

	
	/* 2021.05.30 수정
	 * 게시판 전체 조
	 */
	@RequestMapping(value = "/getAllList.do")
	public @ResponseBody Map<String,Object> getAllList() throws Exception {
		return boardService.getAllList();
	}

}
