package com.jointree.trms.dao.mapper;

import java.util.List;
import java.util.Map;

import com.jointree.trms.vo.MrmtInsertVO;
import com.jointree.trms.vo.SearchVO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("signalMeasurementMapper")
public interface SignalMeasurementMapper {

	public List<Map<String,Object>> getMeasureInfo(SearchVO searchVO);
	
	public int getRoomCount(SearchVO searchVO);
	
	public List<Map<String,Object>> getSaveInfo(SearchVO searchVO);
	
	public void setStatus(SearchVO searchVO);
	
	public List<Map<String,Object>> statusList();
	
	public String getRecentDt(SearchVO searchVO);
	
	public void mrmtLog(MrmtInsertVO mrmtInsertVO);
}
