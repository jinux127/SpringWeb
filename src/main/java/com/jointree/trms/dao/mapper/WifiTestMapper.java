package com.jointree.trms.dao.mapper;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("wifiTestMapper")
public interface WifiTestMapper {
	
	public void wifiTestInsert(Map<String, String> map);
	
	public void insertTargetData(Map<String,String> map);

	public List<Map<String,String>> getTargetData(Map<String, String> data);
	
	public List<Map<String, String>> getWifiList(String targetTel);

}
