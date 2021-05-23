package com.jointree.map.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jointree.map.dao.mapper.MapMapper;
import com.jointree.map.service.MapService;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("mapService")
public class MapServiceImpl extends EgovAbstractServiceImpl implements MapService{

	
	@Resource(name="mapMapper")
	private MapMapper mapMapper;

	/* 위도, 경도, 주소 값 DB 입력 */
	@Override
	public void insertMapData(Map<String, String> map) throws Exception {
		mapMapper.insertMapData(map);
	}
}
