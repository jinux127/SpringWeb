package com.jointree.wifi.dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("wifiCheckMapper")
public interface WifiCheckMapper {
	
	public List<Map<String,String>> selectWifi_1(@Param("targetName") String targetName, @Param("roomName") String roomName);
	
	public void insertWifiSet();
	
	public void deleteWifiSet(@Param("targetName") String targetName, @Param("roomName") String roomName);
	
	public List<Map<String,String>> selectRoom(@Param("targetName") String targetName);

}
