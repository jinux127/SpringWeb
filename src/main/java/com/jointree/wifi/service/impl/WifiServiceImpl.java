package com.jointree.wifi.service.impl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.jointree.common.dao.mapper.CommonMapper;
import com.jointree.common.util.FcmUtil;
import com.jointree.wifi.dao.mapper.WifiMapper;
import com.jointree.wifi.service.WifiService;
import com.jointree.wifi.util.Tanimoto;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Service("wifiService")
public class WifiServiceImpl implements WifiService {

	Logger log = Logger.getLogger(this.getClass());

	@Autowired
	private WifiMapper wifiMapper;

	@Autowired
	private CommonMapper commonMapper;

	@Override
	public void updateWifiLevel(List<Map<String, String>> listMap) {

		for (Map<String, String> map : listMap) {
			wifiMapper.updateWifiLevel(map);
		}

	}

	@Override
	public String findLocation(List<Map<String, String>> listMap) {

		Map<String, Integer> resultMap = new HashMap<String, Integer>();

		int failCount = 0;

		String location = "";

		for (Map<String, String> map : listMap) {

			log.error(failCount);

			if (failCount > listMap.size()/2) {
				location = "danger";
				return location;
			}

			if (wifiMapper.countWifiList(map) < 1) { // 조회되는 wifi가 없을 경우
				++failCount;
			} else {
				String roomName = wifiMapper.selectNearRoom(map).get("roomName"); // 조회된 wifi 목록중 레벨이 가장 근접한 방이름 가져옴
				log.error("====================");
				log.error("roomName: " + roomName);
				log.error("====================");

				if (resultMap.containsKey(roomName)) { // 이미 등록되어 있을 경우 카운트
					log.error("====================");

					Integer value = resultMap.get(roomName);
					log.error("value: " + value);
					resultMap.put(roomName, ++value);
					log.error("++value: " + value);
					log.error("====================");
				} else {// 결과에 조회한 방이름 등록
					log.error("====================");
					resultMap.put(roomName, 1);
					log.error("first roomName: " + roomName);
					log.error("====================");

				}
			}
		}

		for (Map.Entry<String, Integer> elem : resultMap.entrySet()) {
			log.error("====================");

			String key = elem.getKey();
			Integer value = elem.getValue();
			log.error(key + " : " + value);

			log.error("====================");
		}

		int maxValue = Collections.max(resultMap.values());

		for (Map.Entry<String, Integer> entry : resultMap.entrySet()) {// 가장 많이 카운트된 방이름
			if (entry.getValue() == maxValue) {
				log.error("====================");
				log.error("====================");
				log.error("====================");
				location = entry.getKey();
				log.error(entry.getKey());
				log.error("====================");
			}

		}
		return location;

	}

	@Override
	public String findLocationToni(List<Map<String, String>> listMap) {

//		listmap = [{"targetTel":"01020203030","00:00:00:00":"-70"},{"targetTel":"01020203030","11:11:11:11":"-70"},...]
//		json으로 변환하면 이런 형태로 담겨옴
		
		Tanimoto tanimoto = new Tanimoto();//타니모토 계수이용 알고리즘
		ObjectMapper mapper = new ObjectMapper();
		Gson gson = new Gson();
		JsonObject jsonObject = new JsonObject();
		
		Map<String,String> recentMap = new HashMap<String, String>();//최근 조회한
		List<Map<String, String>> wifiListMap = new ArrayList<Map<String,String>>(); //전화번호로 조회한 와이파이 및 레벨 담기 위한 ListMap

		wifiListMap = wifiMapper.selectWifiListJson(listMap.get(0)); // 번호로 조회한 격리자의 Wifi 리스트 ListMap 담기
		
		for(Map<String, String> map : listMap){ //최근 조회 Wifi를 비교하기위해 번호 제거 
			map.remove("targetTel"); 
		}
		
		
		for(Map<String, String> map : listMap){//현재 [{"00:00:00:00" : "-70"},{"11:11:11:11" : "-70"},...}] 형태로 담겨있음 
			log.error("=====================");
			for(Map.Entry<String, String> entry : map.entrySet()){
				
				String key = entry.getKey();
				String value = entry.getValue();
				jsonObject.addProperty(key, value); 
				
				String recentjson = gson.toJson(jsonObject); // List에서 각 Map을 뽑아서 json형태로 변환 
				
				try {
					recentMap = mapper.readValue(recentjson, Map.class); // json을 map으로 변환{"00:00:00:00" : "-70", "11:11:11:11" : "-70", ...}
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				log.error( key + " : " + value);
			}
			log.error("=====================");
		}
		

		Double temp = 0.0; //최댓값 담기위한 temp
		String resultName = ""; // 최댓갑인 이름
		for(Map<String, String> map1 : wifiListMap){// 리스트맵 형태로 와이파이 정보들(room_name, json형태(맥주소:레벨) )이 담겨있음
			try {
				Map<String, String> jsonMap = mapper.readValue(map1.get("jsonValue"), Map.class); //각 리스트별 json형태로 담겨온 정보를 맵으로 추출 
				log.error(map1.get("room_name"));
				log.error(tanimoto.tanimoto(jsonMap, recentMap));
				if (temp< tanimoto.tanimoto(jsonMap, recentMap)) { //최근 유사도 측정값이 크면 temp,resultName에 저장
					temp = tanimoto.tanimoto(jsonMap, recentMap);
					resultName = map1.get("room_name");
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		log.error("가장 큰값: "+temp);
		log.error("이름: "+resultName);
		
		return resultName; //유사도가 가장 큰 방이름 리턴
	}

}
