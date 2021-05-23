package com.jointree.trms.dao.mapper;

import java.util.List;
import java.util.Map;
		
import egovframework.rte.psl.dataaccess.mapper.Mapper;
import com.jointree.trms.vo.WorkplaceVO;

@Mapper("workplaceMapper")
public interface WorkplaceMapper {
//======================사업장 목록 페이지 시작========================
	// gethostSeq By hostId
	public String getHostSeq(String hostId);
	//목록 호출
	public List<WorkplaceVO> getWorkplaceList(String hostSeq);
//======================사업장 등록 페이지 시작========================
	//사업장 기본 정보 입력
	public void insertWorkplaceInfo(WorkplaceVO vo);
	//workplaceSeq 반환
	public String getWorkplaceSeq(WorkplaceVO vo);
	//accountSeq 반환
	public String getAccountSeq(WorkplaceVO vo);
	//사업장 계좌 정보 입력
	public void insertAccountInfo(WorkplaceVO vo);
	//사업장 계좌 매핑
	public void accountMapping(WorkplaceVO vo);
	//사업장 주소 정보 입력
	public void insertAddressInfo(WorkplaceVO vo);
//======================사업장 상세 페이지 시작========================
	//사업장 상세 정보 호출
	public WorkplaceVO getWorkplaceInfo(String workplaceSeq);
	//사업장 상세 정보 업데이트
	public void setWorkplaceInfo(WorkplaceVO vo);
	//사업장 삭제
	public void delWorkplace(String workplaceSeq);
//======================공용========================
	//은행 리스트
	public List<Map<String,Object>> getBank();
}
