package com.jointree.trms.service.impl;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jointree.trms.dao.mapper.WifiTestMapper;
import com.jointree.trms.service.WifiTestService;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("wifiTestService")
public class WifiTestServiceImpl  extends EgovAbstractServiceImpl implements WifiTestService {

	@Resource(name = "wifiTestMapper")
	private WifiTestMapper wifiTestMapper;

	@Override
	public void wifiTestInsert(Map<String, String> map) throws Exception {
		wifiTestMapper.wifiTestInsert(map);
	}

	@Override
	public void insertTargetData(Map<String, String> map) throws Exception {
		wifiTestMapper.insertTargetData(map);
	}

	@Override
	public String getTargetData(Map<String, String> data) {
		
		// 와이파이 정보 insert
		wifiTestMapper.wifiTestInsert(data);
		
		// 현재 위치 탐색
		int inputLevel = Math.abs(Integer.valueOf(data.get("level"))); // 입력된 레벨 절대값
		int compareLevelMin = 0; // 비교값이 가장 작은 값
		int compareLevel = 0; // 인풋과 아웃풋의 차이값
		String returnRoomName = "";
		
		List<Map<String,String>> outputdata = wifiTestMapper.getTargetData(data);
		
		for(int i = 0; i<outputdata.size();i++) {
			Map<String, String> tempdata = new HashMap<String, String>();
			tempdata = outputdata.get(i);
			
			String tempRoomName = tempdata.get("roomName"); //가져온 방 이름
			int outputLevel = (int) Math.round(Math.abs(Double.valueOf(tempdata.get("level")))); //출력된 레벯 절대값
//			int outputLevel = Math.abs(Integer.valueOf(tempdata.get("level"))); //출력된 레벯 절대값
			
			compareLevel = Math.abs(outputLevel - inputLevel); //절대값으로 반환
			
			if(i == 0) { //초회차에는 데이터를 바로 저장
				compareLevelMin = compareLevel;
				returnRoomName = tempRoomName;
			} else {			
				//기존에 저장된 값과 새로 비교한 값의 크기 비교
				if(compareLevel <= compareLevelMin) { 
					// 새로운 값이 더 작거나 같을 경우 -> 최소값 변경 후 반환할 방 이름을 변경
					compareLevelMin = compareLevel;
					returnRoomName = tempRoomName;
				} 
			}
		}
		
		return returnRoomName;
	}
	
	@Override
	public List<Map<String, String>> getWifiList(String targetTel) throws Exception {
		return wifiTestMapper.getWifiList(targetTel);
	}
}
