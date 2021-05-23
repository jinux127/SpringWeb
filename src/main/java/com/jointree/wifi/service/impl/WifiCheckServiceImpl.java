package com.jointree.wifi.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jointree.wifi.dao.mapper.WifiCheckMapper;
import com.jointree.wifi.service.WifiCheckService;

@Service("wifiCheckService")
public class WifiCheckServiceImpl implements WifiCheckService{

	@Resource(name="wifiCheckMapper")
	private WifiCheckMapper wifiCheckMapper;
	
	@Override
	public List<Map<String,String>> selectWifi_1(String targetName, String roomName) {
		return wifiCheckMapper.selectWifi_1(targetName, roomName);
	}
	
	@Override
	public void insertWifiSet() {
		wifiCheckMapper.insertWifiSet();
	}
	
	@Override
	public void deleteWifiSet(String targetName, String roomName) {
		wifiCheckMapper.deleteWifiSet(targetName, roomName);
	}
	
	@Override
	public List<Map<String,String>> selectRoom(String targetName) {
		return wifiCheckMapper.selectRoom(targetName);
	}
}
