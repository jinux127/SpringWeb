package com.jointree.trms.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface ReservationService {
	
//	예약자 정보 입력
	public void rsvctm(Map<String, Object> map);
//	예약 상품 입력
	public void productRsv(Map<String, Object> map);
//	예약 상품, 예약자 매핑 입력
	public void rsvMapping(Map<String, Object> map);
//	예약자 목록 조회
	public Map<String,Object> getRsvList(Map<String, Object> map);
//	Fullcallendar 표시 위한 전체 예약자 조회
	public Map<String,Object> getAllRsvList(Map<String, Object> map);
//	예약자 상태 변경
	public void updateRsvStatus(Map<String, Object> map);
}
