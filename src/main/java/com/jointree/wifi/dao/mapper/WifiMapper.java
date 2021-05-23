package com.jointree.wifi.dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("wifiMapper")
public interface WifiMapper {
	
//	와이파이 업데이트 
	public void updateWifiLevel(Map<String,String> map);
//	조회되는 와이파이 개수 조회 
	public int countWifiList(Map<String,String> map);
//	와이파이 업데이트 
	public Map<String,String> selectNearRoom(Map<String,String> map);
//	json 와이파이 목록 조회
	public List<Map<String,String>> selectWifiListJson(Map<String,String> map);
	
}
