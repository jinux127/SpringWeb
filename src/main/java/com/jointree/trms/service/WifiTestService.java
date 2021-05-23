package com.jointree.trms.service;

import java.util.List;
import java.util.Map;

public interface WifiTestService {
	public void wifiTestInsert(Map<String, String> map) throws Exception;
	public void insertTargetData(Map<String,String> map) throws Exception;
	public String getTargetData(Map<String, String> data) throws Exception;
	public List<Map<String, String>> getWifiList(String targetTel) throws Exception;
}
