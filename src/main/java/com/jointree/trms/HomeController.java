package com.jointree.trms;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.TreeMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.jointree.trms.service.impl.WifiTestServiceImpl;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Resource(name="wifiTestService")
	private WifiTestServiceImpl wifiTestService;
	
	
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home.tiles";
	}
	// 위치 탐색
	int flag = 1;
	String targetTel = "01020203030";
	@RequestMapping(value = "/wifi/hoinTest.do")
	public void Test(@RequestBody List<Map<String,String>> test) {
//		// APList를 통해 나온 방 갯수를 count 하기 위하여 Map, Array, String 생성
//		Map<String,Integer> roomMap = new HashMap<String, Integer>();
//		ArrayList<String> roomArray = new ArrayList<String>();
//		String roomName = "";
//		
//		for(int i=0;i<test.size();i++) {
//			String roomname = wifiTestService.getTargetData(test.get(i));
//			roomArray.add(roomname);
//		}
//		// 방 갯수 카운트
//		for(int v = 0; v < roomArray.size();v++) {
//			if(roomMap.containsKey(roomArray.get(v))) {
//				roomMap.put(roomArray.get(v), roomMap.get(roomArray.get(v)) + 1);
//			}else {
//				roomMap.put(roomArray.get(v),1);
//			}
//		}
//		
//		// 가장 많이 나온 방 고르기
//		int maxValue = Collections.max(roomMap.values());
//		for(Map.Entry<String, Integer> m : roomMap.entrySet()) {
//			if(m.getValue() == maxValue) {
//				roomName = m.getKey();
//			}
//		}
//
//		System.out.println("==========" + flag + "회차==========");
//		for(int z = 0; z < test.size(); z++)
//			System.out.println(test.get(z));
//		System.out.println("====================\n" + 
//							"roomMap : " + roomMap + "\n" +
//							"현재 위치는 : " +roomName + "\n====================");
//		System.out.println(flag++ + "회차");
		logger.info("\n" + flag++ + "회차" + new Date() + "\n" + test);
//		System.out.println();
		// targetTel 꺼내기
//		targetTel = test.get(0).get("targetTel");
		
//		System.out.println(test);
//		Map<String, String> map1 = new HashMap<String, String>();
//		for(int i = 0; i < test.size(); i++)
//			map1.put(test.get(i).get("bssid"), test.get(i).get("level"));
//		logger.info("\n" + map1.toString());
//		System.out.println("!!!!!!!!!!!");
//		System.out.println(map1.keySet());
	}
	
	// 격리자 정보 등록	
	@RequestMapping(value = "/wifi/hoinTest2.do")
	public void Test2(@RequestBody Map<String,String> test) {
		try {
			System.out.println("===============================================================================================================================================================================");
			System.out.println(test);
			wifiTestService.insertTargetData(test);
			System.out.println("===============================================================================================================================================================================");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
//	
//	@RequestMapping(value = "/rsv/test3.do")
//	public String Test3() throws Exception {
//		List<Map<String, String>> tempListMap = new ArrayList<Map<String,String>>();
//		tempListMap = wifiTestService.getWifiList(targetTel);
//		Map<String, String> wifiListMap = new HashMap<String, String>();
//		for(int i = 0; i < tempListMap.size(); i++)
//			wifiListMap.put(tempListMap.get(i).get("roomName"), tempListMap.get(i).get("wifiList"));
//		System.out.println(wifiListMap);
//		return "Welcome";
//	}
}
