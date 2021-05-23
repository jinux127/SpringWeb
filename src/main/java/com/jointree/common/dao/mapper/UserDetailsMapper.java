package com.jointree.common.dao.mapper;

import java.util.List;

import com.jointree.common.vo.UserDetailsVO;
import com.jointree.common.vo.UserInfo;
import com.jointree.trms.vo.WorkplaceVO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("userDetailsMapper")
public interface UserDetailsMapper {

//	유저 아이디, 비밀번호 입력
	public void insertUserDetails(UserInfo userInfo);

//	유저 아이디, 비밀번호 조회, 권한 조회
	public UserInfo getUserInfo(String userId);

	int idChk(String userId);// 아이디 중복체크

	void countFailure(String userId);// 로그인 실패횟수 입력

	int checkFailureCount(String userId);// 로그인 실패횟수 검색

	void disabledUserId(String userId);// 로그인 비활성화

	void resetFailureCount(String userId);// 로그인 실패횟수 초기화

	// 유저 계좌 정보 입력
	public void insertAccountInfo(UserInfo userInfo);

	// 유저 계좌 정보 조회
	public UserInfo getUserAccountInfo(String userId);

	// 유저 계좌 정보 목록 조회
	public List<UserInfo> getAccountList(String userId);

	// 유저 계좌 수정
	public void setAccount(UserInfo userInfo);

	// 유저 계좌 삭제
	public void deleteAccount(String accountSeq);
}
