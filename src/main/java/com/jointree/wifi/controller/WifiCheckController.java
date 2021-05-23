package com.jointree.wifi.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jointree.wifi.service.WifiCheckService;

@Controller
public class WifiCheckController {
	
	@Resource(name="wifiCheckService")
	private WifiCheckService wifiCheckService;

	@RequestMapping(value="/wifiCheck", method = RequestMethod.GET)
	public String wifiView() {
		return "wifiCheck.tiles";
	}
	
	@RequestMapping(value="/leaveAt", method = RequestMethod.GET)
	public void selectLeaveAt() {
		
		List<Map<String,String>> roomList = wifiCheckService.selectRoom("010-2020-3030");
		
		int[] roomCnt = new int[roomList.size()];
		int runAt = 0;
		
		for(int i = 0; i < roomList.size(); i++) { //방갯수 만큼 반복
			
			int leaveCnt = 0;
			
			String rnm = roomList.get(i).get("ROOM_NAME").toString();
			
			List<Map<String,String>> totalList = wifiCheckService.selectWifi_1("010-2020-3030", rnm);
			
			for(int j = 0; j < totalList.size(); j++) { //APLIST 만큼 반복
				boolean bssidAt = false;
				
				/* for start */
				bssidAt = totalList.get(j).get("BSSID").toString().contains("7c:8b:ca:9a:77:3d");
				
				if(bssidAt == true) {
					double level = Double.parseDouble(String.valueOf(totalList.get(j).get("LEVEL")));
					leaveCnt += 1;
					if(level - 2 < level && level < level + 2) {
						leaveCnt += 1;
					}
				}
				/* for end */
				roomCnt[i] = leaveCnt;
			}
			runAt = totalList.size();
			System.out.println(roomCnt[i]);
		}
		
		int max = Arrays.stream(roomCnt).max().getAsInt();
		int m = 0;
		for(m = 0; m < roomCnt.length; m++) {//방 이름 뽑기
			if(roomCnt[m] >= runAt + Math.floor(runAt/2)) {
				if(roomCnt[m] == max) {
					System.out.println(roomList.get(m).get("ROOM_NAME").toString());
					break;
				}
			}
			else {
				System.out.println("이탈");
			}
		}
	}
}

