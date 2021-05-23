package com.jointree.map.dao.mapper;

import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("mapMapper")
public interface MapMapper {
	public void insertMapData(Map<String, String> map);
}
