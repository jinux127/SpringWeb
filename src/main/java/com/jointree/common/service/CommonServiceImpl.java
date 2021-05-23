package com.jointree.common.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jointree.common.dao.mapper.CommonMapper;
import com.jointree.common.util.FcmUtil;

@Service("commonService")
public class CommonServiceImpl implements CommonService{
	
	@Autowired
	private CommonMapper commonMapper;
	
	
//	토큰 업데이트
	@Override
	public void updateToken(String token, String userId) {
		System.out.println("CommonService - updateToken start");
		System.out.println(token);
		commonMapper.updateToken(token, userId);
		System.out.println("CommonService - updateToken end");
		
	}

	//	토큰을 아이디로 조회
	@Override
	public String lookupToken(String productSeq) {
		
		String token = "";
		
//		토큰을 아이디로 조회
		token = commonMapper.lookupToken(productSeq);
				
		return token;
	
	}

	@Override
	public String idLookupToken(String userId) {

		String token ="";
		
		token = commonMapper.idLookupToken(userId);
		
		return token;
	}


	
}
