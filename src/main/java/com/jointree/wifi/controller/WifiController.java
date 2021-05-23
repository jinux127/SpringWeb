package com.jointree.wifi.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.jointree.common.service.CommonService;
import com.jointree.common.service.CommonServiceImpl;
import com.jointree.common.util.FcmUtil;
import com.jointree.trms.service.impl.WifiTestServiceImpl;
import com.jointree.wifi.service.WifiCheckService;
import com.jointree.wifi.service.impl.WifiServiceImpl;

@RestController
@RequestMapping(value = "/wifi")
public class WifiController {
	
	Logger log = Logger.getLogger(this.getClass());

	@Autowired
	private WifiServiceImpl wifiService;
	
	@Resource(name="wifiTestService")
	private WifiTestServiceImpl wifiTestService;
	
	@Resource
	CommonService commonService;
	
	@Resource(name="wifiCheckService")
	private WifiCheckService wifiCheckService;
	
	@RequestMapping(value = "/updateLevel.do", produces = "application/json;charset=UTF-8" )
	public Map<String, String> updateWifiLevel(@RequestBody List<Map<String, String>> requestListMap) {

		for(Map<String, String> map : requestListMap){
			System.out.println("=======map=======");
			for(Map.Entry<String, String> entry : map.entrySet()){
				String key = entry.getKey();
				Object value = entry.getValue();
				System.out.println( key + " : " + value);
			}
			System.out.println("=======map=======");
		}
		
		String count = requestListMap.get(0).get("count").toString();

		log.error("count :"+count);
		
		if (count.equals("4")) {
			String tartgetTel = requestListMap.get(0).get("targetTel").toString();
			String roomName = requestListMap.get(0).get("roomName").toString();
			log.error("targetName :"+tartgetTel);
			log.error("roomName :"+roomName);
		}
		
		Map<String, String> result = new HashMap<String, String>();
        result.put("data1", "메모에요");
        result.put("data2", "두번째 메모입니다.");
        return result;
	}

	@RequestMapping(value = "/test.do", produces = "application/json;charset=UTF-8" )
	public Map<String, String> test(@RequestBody List<Map<String, String>> requestListMap, HttpServletRequest req) {
		
		for(Map<String, String> map : requestListMap){
			System.out.println("=======map=======");
			for(Map.Entry<String, String> entry : map.entrySet()){
				String key = entry.getKey();
				Object value = entry.getValue();
				System.out.println( key + " : " + value);
			}
			System.out.println("=======map=======");
		}
		
		String resultString = wifiService.findLocation(requestListMap);
		log.debug(resultString);
		
		String tokenId = commonService.idLookupToken("test1");
		
		FcmUtil fcmUtil = new FcmUtil();
		fcmUtil.send_FCM(tokenId, "현재위치",resultString, "http://192.168.0.147:8080/",req);
		

		Map<String, String> result = new HashMap<String, String>();
		result.put("currentLocation", resultString);
		
		return result;
	}
	
	@RequestMapping(value = "/tani.do", produces = "application/json;charset=UTF-8" )
	public Map<String, String> test2(@RequestBody List<Map<String, String>> requestListMap, HttpServletRequest req) {
		
		for(Map<String, String> map : requestListMap){
			System.out.println("=======map=======");
			for(Map.Entry<String, String> entry : map.entrySet()){
				String key = entry.getKey();
				Object value = entry.getValue();
				System.out.println( key + " : " + value);
			}
			System.out.println("=======map=======");
		}
		
		String tokenId = commonService.idLookupToken("test1");
		String location = wifiService.findLocationToni(requestListMap);
		
		FcmUtil fcmUtil = new FcmUtil();
		fcmUtil.send_FCM(tokenId, "현재위치",location, "http://192.168.0.147:8080/", req);
		
		Map<String, String> result = new HashMap<String, String>();
		result.put("currentLocation",location);
		
		return result;
	}
	
	@RequestMapping(value = "/getCurrentWifi.do", produces = "application/json;charset=UTF-8" )
	public void getCurrentWifi(@RequestBody List<Map<String, String>> test) {
		
		System.out.println("===============================================================================================================================================================================");
		
		// 위치 탐색
		int flag = 0;
		
		// APList를 통해 나온 방 갯수를 count 하기 위하여 Map, Array, String 생성
		Map<String,Integer> roomMap = new HashMap<String, Integer>();
		ArrayList<String> roomArray = new ArrayList<String>();
		String roomName = "";
		
		for(int i=0;i<test.size();i++) {
			String roomname = wifiTestService.getTargetData(test.get(i));
			roomArray.add(roomname);
		}
		// 방 갯수 카운트
		for(int v = 0; v < roomArray.size();v++) {
			if(roomMap.containsKey(roomArray.get(v))) {
				roomMap.put(roomArray.get(v), roomMap.get(roomArray.get(v)) + 1);
			}else {
				roomMap.put(roomArray.get(v),1);
			}
		}
		// 가장 많이 나온 방 고르기
		int maxValue = Collections.max(roomMap.values());
		for(Map.Entry<String, Integer> m : roomMap.entrySet()) {
			if(m.getValue() == maxValue) {
				roomName = m.getKey();
			}
		}
		
		System.out.println("=====현재 위치는 : " +roomName + "==========" + flag + "번째 호출 ===========================================================================================================================================================================");
		flag++;
	}
}
