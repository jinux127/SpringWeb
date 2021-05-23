package com.jointree.trms.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import org.springframework.stereotype.Service;

import com.jointree.trms.dao.mapper.WorkplaceMapper;
import com.jointree.trms.service.WorkplaceService;
import com.jointree.trms.vo.WorkplaceVO;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("workplaceService")
public class WorkplaceServiceImpl extends EgovAbstractServiceImpl implements WorkplaceService {

	@Resource(name="workplaceMapper")
	private WorkplaceMapper workplaceMapper;

//======================사업장 목록 페이지========================
	// gethostSeq By hostId
	@Override
	public String getHostSeq(String hostId) {
		return workplaceMapper.getHostSeq(hostId);
	}
	//목록 호출
	@Override
	public List<WorkplaceVO> getWorkplaceList(String hostSeq) {
		List<WorkplaceVO> temp = workplaceMapper.getWorkplaceList(hostSeq);
		int count = temp.size(); // 가져온 목록의 수
		
		for(int i = 0; i < count; i++) {
			String val = temp.get(i).getWorkplaceStatus();
			if(val.equals ("e")){
				temp.get(i).setWorkplaceStatus("활성화"); 
			} else if(val.equals ("d")) {
				temp.get(i).setWorkplaceStatus("비활성화");
			}
		}
		return temp;
	}
//======================사업장 등록 페이지========================
	//사업장 등록
	@Override
	public void insertWorkplaceInfo(WorkplaceVO vo) {
		//사업장 기본 정보 입력
		workplaceMapper.insertWorkplaceInfo(vo);

		//workplaceSeq 반환
		vo.setWorkplaceSeq(workplaceMapper.getWorkplaceSeq(vo));
		
		
		if(vo.getAccountSeq() == "" || vo.getAccountSeq() == null) {
			//계좌 정보 입력
			workplaceMapper.insertAccountInfo(vo);
			//account_seq 세팅
			vo.setAccountSeq(workplaceMapper.getAccountSeq(vo));
		}
		//사업장, 계좌 매핑
		workplaceMapper.accountMapping(vo);
		
		
		//사업장 주소 정보 입력
		workplaceMapper.insertAddressInfo(vo);
	}
//======================사업장 상세 페이지========================
	//사업장 상세 정보 호출
	@Override
	public WorkplaceVO getWorkplaceInfo(String workplaceSeq) {
		return workplaceMapper.getWorkplaceInfo(workplaceSeq);
	}
	//사업장 상세 정보 업데이트
	@Override
	public void setWorkplaceInfo(WorkplaceVO vo) {
		if(vo.getAccountSeq() == "" || vo.getAccountSeq() == null) {
			//계좌 정보 입력
			workplaceMapper.insertAccountInfo(vo);
			//account_seq 세팅
			vo.setAccountSeq(workplaceMapper.getAccountSeq(vo));
		}
		workplaceMapper.setWorkplaceInfo(vo);
	}
	//사업장 삭제
	@Override
	public void delWorkplace(String workplaceSeq) {
		workplaceMapper.delWorkplace(workplaceSeq);
	}
//======================공룡========================
	//은행 리스트
	@Override
	public List<Map<String,Object>> getBank(){
		return workplaceMapper.getBank();
	}
}
