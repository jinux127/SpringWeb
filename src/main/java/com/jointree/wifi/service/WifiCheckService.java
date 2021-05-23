package com.jointree.wifi.service;

import java.util.List;
import java.util.Map;

public interface WifiCheckService {

	public List<Map<String,String>> selectWifi_1(String targetName, String roomName);
	
	public void insertWifiSet();
	
	public void deleteWifiSet(String targetName, String roomName);
	
	public List<Map<String,String>> selectRoom(String targetName);
}
