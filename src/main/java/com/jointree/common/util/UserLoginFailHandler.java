package com.jointree.common.util;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.AccountExpiredException;
import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Service;

import com.jointree.common.service.UserService;


@Service
public class UserLoginFailHandler implements AuthenticationFailureHandler{
	
	
	@Resource
	private UserService userService;
	
    private String userId;
    private String password;
    private String defaultFailureUrl;
 
    

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		
        

		String id = request.getParameter(userId);

		
		if (exception instanceof AuthenticationServiceException) {
			request.setAttribute("loginFailMsg", "존재하지 않는 사용자입니다.");
			
		} else if(exception instanceof LockedException) {
			request.setAttribute("loginFailMsg", "잠긴 계정입니다..");
			
		} else if(exception instanceof DisabledException) {
			request.setAttribute("loginFailMsg", "비활성화된 계정입니다..");
			
		} else if(exception instanceof AccountExpiredException) {
			request.setAttribute("loginFailMsg", "만료된 계정입니다..");
			
		} else if(exception instanceof CredentialsExpiredException) {
			request.setAttribute("loginFailMsg", "비밀번호가 만료되었습니다.");
			
		} else if(exception instanceof BadCredentialsException) {
			try {
				loginFailureCount(userId);
				int cnt = userService.checkFailureCount(userId);
				request.setAttribute("loginFailMsg", "아이디 또는 비밀번호가 틀립니다.\n남은 횟수 :"+cnt+"/5");

			} catch (Exception e) {
				request.setAttribute("loginFailMsg", "존재하지 않는 사용자입니다.");
			}
			
		}
        
        request.setAttribute(userId, id);
        request.getRequestDispatcher(defaultFailureUrl).forward(request, response);

	}
	

	protected void loginFailureCount(String userId) {
		userService.countFailure(userId);
		int cnt = userService.checkFailureCount(userId);
		if(cnt>3) {
			userService.disabledUserId(userId);
		}
	}
	public String getUserId() {
		return userId;
	}



	public void setUserId(String userId) {
		this.userId = userId;
	}



	public String getPassword() {
		return password;
	}



	public void setPassword(String password) {
		this.password = password;
	}



	public String getDefaultFailureUrl() {
		return defaultFailureUrl;
	}



	public void setDefaultFailureUrl(String defaultFailureUrl) {
		this.defaultFailureUrl = defaultFailureUrl;
	}

	
	
}
