package com.jointree.trms.dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("reservationMapper")
public interface ReservationMapper {
	
//	예약자 수 조회
	public int getRsvListCount(Map<String,Object> map);
//	예약자 정보 등록
	public void rsvctm(Map<String, Object> map);
//	예약 상품 등록
	public void productRsv(Map<String, Object> map);
//	예약 상품, 예약자 매핑 등록
	public void rsvMapping(Map<String, Object> map);
//	예약자 목록 조회
	public List<Map<String, Object>>  getRsvList(Map<String, Object> map);
//	Fullcallendar 표시 위한 전체 예약자 조회
	public List<Map<String, Object>>  getAllRsvList(Map<String, Object> map);
//	예약자 상태 변경
	public void updateRsvStatus(Map<String,Object> map);
	
}
