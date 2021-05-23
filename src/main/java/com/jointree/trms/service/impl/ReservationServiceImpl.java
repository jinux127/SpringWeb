package com.jointree.trms.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jointree.trms.dao.mapper.ReservationMapper;
import com.jointree.trms.dao.mapper.WorkplaceMapper;
import com.jointree.trms.service.ReservationService;
import com.jointree.trms.vo.ProductVO;
import com.jointree.trms.vo.WorkplaceVO;

@Service("reservationService")
public class ReservationServiceImpl implements ReservationService{

	@Autowired
	ReservationMapper reservationMapper;
	
	@Resource(name="workplaceService")
	private WorkplaceServiceImpl workplaceService;
	
	@Resource(name="productService")
	private ProductServiceImpl productService;
	
	@Resource(name = "workplaceMapper")
	WorkplaceMapper workplaceMapper;
	
	@Override
	public void rsvctm(Map<String, Object> map) {
		reservationMapper.rsvctm(map);
		
	}

	@Override
	public void productRsv(Map<String, Object> map) {
		reservationMapper.productRsv(map);
		
	}

	@Override
	public void rsvMapping(Map<String, Object> map) {

		reservationMapper.rsvMapping(map);
	}


	@Override
	public Map<String, Object> getRsvList(Map<String, Object> map) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		List<Map<String, Object>> listMap = reservationMapper.getRsvList(map);
		int totalRecords = reservationMapper.getRsvListCount(map);
		resultMap.put("data", listMap);
		resultMap.put("iTotalRecords", totalRecords);
		resultMap.put("iTotalDisplayRecords", totalRecords);
		
		
		return resultMap;
		
	}
	
	@Override
	public Map<String, Object> getAllRsvList(Map<String, Object> map) {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();

		resultMap.put("data", reservationMapper.getAllRsvList(map));
		
		return resultMap;
		
	}

	@Override
	public void updateRsvStatus(Map<String, Object> map) {
		
		reservationMapper.updateRsvStatus(map);
		
	}


}
