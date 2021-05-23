package com.jointree.trms.service;

import java.util.List;
import java.util.Map;

import com.jointree.trms.vo.WorkplaceVO;

public interface WorkplaceService {
//======================사업장 목록 페이지========================
	// gethostSeq By hostId
	public String getHostSeq(String hostId) throws Exception;
	//목록 호출
	public List<WorkplaceVO> getWorkplaceList(String hostSeq) throws Exception;
//======================사업장 등록 페이지========================
	//사업장 등록
	public void insertWorkplaceInfo(WorkplaceVO vo) throws Exception;
//======================사업장 상세 페이지========================
	//사업장 상세 정보 호출
	public WorkplaceVO getWorkplaceInfo(String workplaceSeq) throws Exception;
	//사업장 상세 정보 업데이트
	public void setWorkplaceInfo(WorkplaceVO vo) throws Exception;
	//사업장 삭제
	public void delWorkplace(String workplaceSeq) throws Exception;
//======================공용========================
	//은행 리스트
	public List<Map<String,Object>> getBank() throws Exception;
}
