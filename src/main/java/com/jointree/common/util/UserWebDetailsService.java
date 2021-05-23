package com.jointree.common.util;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.jointree.common.service.UserService;
import com.jointree.common.vo.UserDetailsVO;
import com.jointree.common.vo.UserInfo;


@Service("userWebDetailsService")
public class UserWebDetailsService implements UserDetailsService{

	@Resource
	UserService userService;
	
	@Override
	public UserDetails loadUserByUsername(String userId) throws UsernameNotFoundException {
		// 최종적으로 리턴해야할 객체
		UserDetailsVO userDetailsVO = new UserDetailsVO();
		List<String> list = new ArrayList<String>();
//		사용자 아이디, 패스워드
		UserInfo userInfo = userService.getUserInfo(userId);
		list.add("ROLE_" + userInfo.getAuthority());
		
		userDetailsVO.setUsername(userInfo.getUserId());
		userDetailsVO.setPassword(userInfo.getPassword());
		
		userDetailsVO.setAuthorities(list);

		return userDetailsVO;
	}

}
