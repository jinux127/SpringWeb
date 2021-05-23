package com.jointree.common.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.jointree.trms.vo.SearchVO;
import com.jointree.wifi.service.WifiCheckService;
import com.jointree.wifi.service.impl.WifiCheckServiceImpl;
import com.jointree.wifi.service.impl.WifiServiceImpl;

@RestController
@RequestMapping(value = "/wifi")
public class SignalMeasurementController {

	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "signalMeasurementUtil")
	private SignalMeasurementUtil signalMeasurementUtil;

	@Resource(name = "wifiService")
	private WifiServiceImpl wifiService;

	@Resource(name = "wifiCheckService")
	private WifiCheckServiceImpl wifiCheckService;

	@RequestMapping(value = "/measurement")
	public ModelAndView login(SearchVO searchVO) throws Exception {

		ModelAndView mv = new ModelAndView("jsonView");

		searchVO.setId("010-5342-6920");
		List<Map<String, Object>> resultList = signalMeasurementUtil.measurementAlgorithm(searchVO);

		mv.addObject("resultList", resultList);
		mv.setViewName("measurement.tiles");

		return mv;
	}

	@RequestMapping(value = "/adminMeasurement.do")
	public Map<String, String> measurement(@RequestBody List<Map<String, String>> requestListMap) {

		// 측정와이파이 insert
		wifiService.updateWifiLevel(requestListMap);
		int count = Integer.parseInt(requestListMap.get(0).get("count").toString());

		if (count == 4) {
			String tartgetTel = requestListMap.get(0).get("targetTel").toString();
			String roomName = requestListMap.get(0).get("roomName").toString();

			// wifi AP List 초기 셋팅
			wifiCheckService.insertWifiSet();
			wifiCheckService.deleteWifiSet(tartgetTel, roomName);
		}

		Map<String, String> result = new HashMap<String, String>();

		result.put("data1", "성공~");

		return result;

	}

}
