package com.jointree.responsive.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.jointree.responsive.service.LocaleService;
import com.jointree.responsive.service.impl.BoardServiceImpl;
import com.jointree.responsive.service.impl.LocaleServiceImpl;

@RestController
@RequestMapping(value = "/responsive")
public class ResponsiveController {
	
	@Resource(name = "BoardService")
	private BoardServiceImpl boardService;
	@Resource(name = "LocaleService")
	private LocaleServiceImpl localService;
	
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
	public Map<String,Object> retrofitEx(@RequestBody String requestStringBody) throws Exception {	
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Map<String, Object> testMap = new HashMap<String, Object>();
		
		System.out.println(requestStringBody);
		
		JSONObject json = (JSONObject) new JSONParser().parse(requestStringBody);
		System.out.println(json.toJSONString());
		
		testMap.put("test1", "1");
		testMap.put("test2", "2");
		testMap.put("test3", "3");
		
		JSONObject json2 = new JSONObject(testMap);
		
		resultMap.put("id", "1");
		resultMap.put("data", json2.toString());
		System.out.println(json2.toString());
		return resultMap;

	}
	/* 2021.06.03
	 * Retrofit 통신 Ex
	 */
	@RequestMapping(value = "/localeEx.do")
	@ResponseBody
	public ModelAndView localeEx(String country, String language) throws Exception {	
		ModelAndView mv = new ModelAndView("jsonView");
		mv.addObject("data", localService.getLocaleList(language));
		return mv;
		
	}

}
