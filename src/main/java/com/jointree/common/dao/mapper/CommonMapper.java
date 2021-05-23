package com.jointree.common.dao.mapper;

import org.apache.ibatis.annotations.Param;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("commonMapper")
public interface CommonMapper {

//	토큰 업데이트
	public void updateToken(@Param("token") String token, @Param("userId") String userId);

//	토큰 조회
	public String lookupToken(String productSeq);

	// 토큰 조회
	public String idLookupToken(String userId);

}
