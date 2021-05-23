package com.jointree.map.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jointree.map.service.impl.MapServiceImpl;

@Controller
@RequestMapping(value = "/map")
public class MapController {
	
	@Resource(name="mapService")
	private MapServiceImpl mapService;
	
	@RequestMapping(value="/mapTest", method = RequestMethod.GET)
	public String mapTest() {
		return "mapTest.tiles";
	}

	@RequestMapping(value="/jusoPopup")
	public ModelAndView jusoPopup() {
		
		ModelAndView mv = new ModelAndView("jsonView");
		
		mv.setViewName("jusoPopup.tiles");	
		
		return mv;
	}
	
	
	@RequestMapping(value="/insertMapData.do", method = RequestMethod.POST)
	@ResponseBody
	public void insertMapData(@RequestParam Map<String, String> map) throws Exception {
		mapService.insertMapData(map);
	}
	


}
