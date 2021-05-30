package com.jointree.responsive.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.stereotype.Service;

import com.jointree.responsive.dao.mapper.BoardMapper;
import com.jointree.responsive.service.BoardService;


@Service("BoardService")
public class BoardServiceImpl implements BoardService{

	@Resource
	private BoardMapper boardMapper;
	
	@Override
	public Map<String, Object> getAllList() throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();

		resultMap.put("data", resultMap);
		
		
		return resultMap;
	}
}
