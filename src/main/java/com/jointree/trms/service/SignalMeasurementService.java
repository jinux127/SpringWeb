package com.jointree.trms.service;

import java.util.List;
import java.util.Map;

import com.jointree.trms.vo.MrmtInsertVO;
import com.jointree.trms.vo.SearchVO;

public interface SignalMeasurementService {
	public List<Map<String,Object>> getMeasureInfo(SearchVO searchVO) throws Exception;
	
	public int getRoomCount(SearchVO searchVO) throws Exception;
	
	public List<Map<String,Object>> getSaveInfo(SearchVO searchVO) throws Exception;
	
	public void setStatus(SearchVO searchVO) throws Exception;
	
	public List<Map<String,Object>> statusList() throws Exception;
	
	public String getRecentDt(SearchVO searchVO) throws Exception;
	
	public void mrmtLog(MrmtInsertVO mrmtInsertVO) throws Exception;
}
