package com.jointree.wifi.service;

import java.util.List;
import java.util.Map;

import javax.print.DocFlavor.STRING;

public interface WifiService {
	
//	와이파이 업데이트
	public void updateWifiLevel(List<Map<String,String>> listMap);
	
//	위치 검색
	public String findLocation(List<Map<String,String>> listMap); 
//	tonimoto
	public String findLocationToni(List<Map<String, String>> listMap);
}
