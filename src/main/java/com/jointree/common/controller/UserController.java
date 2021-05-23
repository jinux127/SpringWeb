package com.jointree.common.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jointree.common.service.UserService;
import com.jointree.common.vo.UserDetailsVO;
import com.jointree.common.vo.UserInfo;
import com.jointree.trms.service.impl.WorkplaceServiceImpl;


@Controller
@RequestMapping(value = "/user")
public class UserController {

	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	@Resource
	UserService userService;
	
	@Resource(name="workplaceService")
	private WorkplaceServiceImpl workplaceService;

	
	@RequestMapping(value="/login")
	public String login() throws Exception{
		return "page/login";
	}
	@RequestMapping(value="/denied")
	public String denied() throws Exception{
		return "page/denied";
	}
	@RequestMapping(value="/join", method = RequestMethod.GET)
	public String joinGET() throws Exception{
		return "page/join";
	}
	
//	회원가입 
	@RequestMapping(value="/register", method = RequestMethod.POST)
	public String join(UserInfo userInfo) throws Exception{
//		체크 기능 구현
		int result = userService.idChk(userInfo.getUserId());
		try {
			if(result == 1) {
				return "/user/login";
			}else if(result == 0) {
				userService.insertUserDetails(userInfo);
			}
		} catch (Exception e) {
			throw new RuntimeException();
		}
//		작성하는 서비스 호출
//		로그인 페이지 리턴
		return "redirect:/user/login";
	}
	
//	아이디 중복 체크
	@ResponseBody
	@RequestMapping(value="/idChk", method = RequestMethod.POST)
	public int idChk(UserInfo userInfo) throws Exception{
		int result = userService.idChk(userInfo.getUserId());
		return result;
		
	}
	
	//은행 리스트 호출 ajax
	@RequestMapping(value="/getbank.do", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView getBank() throws Exception {

		ModelAndView mv = new ModelAndView("jsonView");
		List<Map<String,Object>> result = workplaceService.getBank();
		mv.addObject("bank", result);
		
		return mv;
	}
	
}
