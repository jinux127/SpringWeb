package com.jointree.common.service;

public interface CommonService {
	
//	토큰값 업데이트
	public void updateToken(String token,String userId);

//	토큰 조회
	public String lookupToken(String productSeq);

	//	아이디로 토큰 조회
	public String idLookupToken(String userId);
	
}
