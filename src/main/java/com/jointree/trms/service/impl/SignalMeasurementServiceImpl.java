package com.jointree.trms.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jointree.trms.dao.mapper.SignalMeasurementMapper;
import com.jointree.trms.service.SignalMeasurementService;
import com.jointree.trms.vo.MrmtInsertVO;
import com.jointree.trms.vo.SearchVO;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("signalMeasurementService")
public class SignalMeasurementServiceImpl extends EgovAbstractServiceImpl implements SignalMeasurementService {
	
	@Resource(name="signalMeasurementMapper")
	private SignalMeasurementMapper signalMeasurementMapper;
	
	@Override
	public List<Map<String,Object>> getMeasureInfo(SearchVO searchVO){
		return signalMeasurementMapper.getMeasureInfo(searchVO);
	}
	
	@Override
	public int getRoomCount(SearchVO searchVO) {
		return signalMeasurementMapper.getRoomCount(searchVO);
	}
	
	@Override
	public List<Map<String,Object>> getSaveInfo(SearchVO searchVO){
		return signalMeasurementMapper.getSaveInfo(searchVO);
	}
	
	@Override
	public void setStatus(SearchVO searchVO) {
		signalMeasurementMapper.setStatus(searchVO);
	}
	
	@Override
	public List<Map<String,Object>> statusList(){
		return signalMeasurementMapper.statusList();
	}
	
	@Override
	public String getRecentDt(SearchVO searchVO){
		return signalMeasurementMapper.getRecentDt(searchVO);
	}
	
	@Override
	public void mrmtLog(MrmtInsertVO mrmtInsertVO) {
		signalMeasurementMapper.mrmtLog(mrmtInsertVO);
	}
}
