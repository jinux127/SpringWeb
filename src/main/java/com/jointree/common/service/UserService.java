package com.jointree.common.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.jointree.common.dao.mapper.UserDetailsMapper;
import com.jointree.common.vo.UserDetailsVO;
import com.jointree.common.vo.UserInfo;
import com.jointree.trms.dao.mapper.WorkplaceMapper;
import com.jointree.trms.service.impl.WorkplaceServiceImpl;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service
public class UserService extends EgovAbstractServiceImpl{
	
	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	
	
	@Autowired
	UserDetailsMapper userDetailsMapper;
	
	public void insertUserDetails(UserInfo userInfo){
		
		userInfo.setPassword(pwEncoder.encode(userInfo.getPassword()));
		
		if (userInfo.getBankName() == "") {
			userDetailsMapper.insertUserDetails(userInfo);
		}else {
			userDetailsMapper.insertUserDetails(userInfo);
			userDetailsMapper.insertAccountInfo(userInfo);
		}
		
	}
	
	public UserInfo getUserInfo(String userId) {
		
		return userDetailsMapper.getUserInfo(userId);
		
	}
	
//	유저 계좌 정보 조회
	public UserInfo getUserAccountInfo(String userId) {
		return userDetailsMapper.getUserAccountInfo(userId);
	}
//	유저 계좌 정보 목록 조회
	public List<UserInfo> getAccountList(String userId) {
		return userDetailsMapper.getAccountList(userId);
	}
//	유저 계좌 등록
	public void insertAccount(UserInfo userInfo) {
		userDetailsMapper.insertAccountInfo(userInfo);
	}
//	유저 계좌 수정
	public void setAccount(UserInfo userInfo) {
		userDetailsMapper.setAccount(userInfo);
	}
//	유저 계좌 삭제
	public void deleteAccount(String accountSeq) {
		userDetailsMapper.deleteAccount(accountSeq);
	}
//	아이디 체크
	public int idChk(String  userId) {
		int result = userDetailsMapper.idChk(userId);
		return result;
	}
//	실패 횟수 증가
	public void countFailure(String userId) {
		userDetailsMapper.countFailure(userId);
	}
//	실패횟수 조회
	public int checkFailureCount(String userId) {
		return userDetailsMapper.checkFailureCount(userId);
	}
//	아이디 잠금
	public void disabledUserId(String userId) {
		userDetailsMapper.disabledUserId(userId);
	}
//	실패횟수 초기화
	public void resetFailureCount(String userId) {
		userDetailsMapper.resetFailureCount(userId);
	}
}
