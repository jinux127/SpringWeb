package com.jointree.common.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.jointree.trms.service.impl.SignalMeasurementServiceImpl;
import com.jointree.trms.vo.SearchVO;

@Component("signalMeasurementUtil")
public class SignalMeasurementUtil {

	@Resource(name="signalMeasurementService")
	private SignalMeasurementServiceImpl signalMeasurementService;
	
	public List<Map<String,Object>> measurementAlgorithm(SearchVO searchVO) throws Exception{
		
		//방 갯수 조회
		int roomCount = signalMeasurementService.getRoomCount(searchVO);
		//측정 최근값 조회
		List<Map<String,Object>> measureInfoList = signalMeasurementService.getMeasureInfo(searchVO);	
		//신호 정확도
		double sigAcc;
		//이탈 상태값 I=in O=out F=false
		String status = "F";
		//저장 신호 갯수
		double saveSig;
		//현재 방위치
		String roomNo = "";
		double h=0;
		double aa;
		
		//최근 조회시간 저장
		String recentDt = signalMeasurementService.getRecentDt(searchVO);
		searchVO.setRecentDt(recentDt);
		
		//저장된 신호정보 없을 시 return
		if(roomCount == 0) {
			searchVO.setStatus(status);
			searchVO.setRoomNo(null);
			signalMeasurementService.setStatus(searchVO);
			List<Map<String,Object>> resultList = signalMeasurementService.statusList();
			return resultList;
		}
		
		for(int i=1; i<=roomCount; i++) {
			sigAcc= 0;
			aa=0;
			searchVO.setRoomNo(Integer.toString(i));
			List<Map<String,Object>> saveInfoList = signalMeasurementService.getSaveInfo(searchVO);
			saveSig = saveInfoList.size();
			
			for(Map<String,Object> saveInfo : saveInfoList) {			
				for(Map<String,Object> measureInfo : measureInfoList) {
					if(saveInfo.get("bssid").toString().equalsIgnoreCase(measureInfo.get("bssid").toString()) &&
							Double.parseDouble(saveInfo.get("level").toString()) <= Double.parseDouble(measureInfo.get("level").toString())) {
						aa += (Double.parseDouble(saveInfo.get("level").toString())-Double.parseDouble(measureInfo.get("level").toString()))*-1;
						sigAcc++;			
						continue;
					}
				}				
			}			
			
			// 정확도 80 이상일 시
			if((sigAcc/saveSig *100) >= 70) {				
				
				//첫 1번 실행
				if(h == 0) {
					status = "I";
					h = aa;
					roomNo = Integer.toString(i);
				}else {
					if(h<aa) {
						roomNo = Integer.toString(i);
						h = aa;
					}
				}
			}			
		}

		if(status.equalsIgnoreCase("I")) {
			searchVO.setRoomNo(roomNo);
			searchVO.setStatus(status);
		}else {
			searchVO.setStatus("O");
			searchVO.setRoomNo(null);
		}
		signalMeasurementService.setStatus(searchVO);
		
		List<Map<String,Object>> resultList = signalMeasurementService.statusList();
		
		return resultList;
	}
}