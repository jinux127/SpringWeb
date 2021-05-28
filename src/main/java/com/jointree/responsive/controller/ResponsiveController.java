package com.jointree.responsive.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/responsive")
public class ResponsiveController {
	
	@RequestMapping(value = "/main")
	public ModelAndView responsiveMain() {
		ModelAndView mv = new ModelAndView("jsonView");
		
		mv.setViewName("responsiveMain.responsive");
		return mv;
	}
}
