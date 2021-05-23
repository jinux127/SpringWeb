package com.jointree.trms.dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.jointree.trms.vo.HostVO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("hostMapper")
public interface HostMapper {

//	호스트 상세정보 조회	
	public HostVO getHostInfo(@Param("userId") String userId);
//	호스트 상세정보 입력
	public void setHostInfo(HostVO vo);
}
