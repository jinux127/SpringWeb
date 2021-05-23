package com.jointree.trms.controller;

import java.security.Principal;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jointree.common.service.UserService;
import com.jointree.trms.service.impl.WorkplaceServiceImpl;
import com.jointree.trms.vo.WorkplaceVO;

@Controller
@RequestMapping(value = "/workplace")
public class Workplacecontroller {
	
	@Resource(name="workplaceService")
	private WorkplaceServiceImpl workplaceService;
	
	@Resource
	private UserService userService;
	
//======================사업장 목록 페이지========================
	//목록 페이지 이동
	@RequestMapping(value="/list", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView workplaceList(Principal principal) throws Exception{
		
		String hostId = principal.getName();
		
		ModelAndView mv = new ModelAndView("jsonView");
		String hostSeq = workplaceService.getHostSeq(hostId);
		
		mv.addObject("hostSeq",hostSeq);
		mv.setViewName("workplacelist.tiles");
			
		return mv;
	}
	
	//목록 호출 ajax
	@RequestMapping(value="/getlist.do", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView getWorkplaceList(String hostSeq) throws Exception{
	
		ModelAndView mv = new ModelAndView("jsonView");
		
		List<WorkplaceVO> result = workplaceService.getWorkplaceList(hostSeq);
		mv.addObject("List",result);
			
		return mv;
	}
//======================사업장 등록 페이지========================
	//사업장 등록 페이지 이동
	@RequestMapping(value="/insert", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView workplaceInsert(Principal principal) throws Exception{
		String hostId = principal.getName();
		ModelAndView mv = new ModelAndView("jsonView");
		String hostSeq = workplaceService.getHostSeq(hostId);
		
		mv.addObject("hostSeq", hostSeq);
		mv.addObject("hostId", hostId);
		
		mv.setViewName("workplaceinsert.tiles");
			
		return mv;
	}
	//사업장 상세 정보 등록 ajax
	@RequestMapping(value = "/insertinfo.do")
	@ResponseBody
	public void insertWorkplaceInfo(WorkplaceVO vo) throws Exception {
		workplaceService.insertWorkplaceInfo(vo);
	}
	
	//유저 계좌 정보 조회 ajax
	@RequestMapping(value = "/getUserAccountInfo.do")
	public ModelAndView getUserAccountInfo(Principal principal) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		
		String userId = principal.getName();
		
		mv.addObject("userAccountInfo", userService.getUserAccountInfo(userId));
		
		return mv;
	}

//======================사업장 상세 페이지========================
	//사업장 상세보기 페이지
	@RequestMapping(value="/detail", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView workplaceDetail(Principal principal, String workplaceSeq) throws Exception{
	
		ModelAndView mv = new ModelAndView("jsonView");
		
		mv.addObject("hostId", principal.getName());
		mv.addObject("workplaceSeq", workplaceSeq);

		mv.setViewName("workplacedetail.tiles");
			
		return mv;
	}
	//사업장 상세 정보 호출 ajax
	@RequestMapping(value = "/getworkplaceinfo.do",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView getWorkplaceInfo(String workplaceSeq) throws Exception {
		
		ModelAndView mv = new ModelAndView("jsonView");
		WorkplaceVO vo = workplaceService.getWorkplaceInfo(workplaceSeq);
		mv.addObject("workplaceInfo", vo);
		
		return mv;
	}
	//사업장 상세 정보 업데이트 ajax
	@RequestMapping(value="/setworkplaceinfo.do", method = RequestMethod.POST)
	@ResponseBody
	public void setWorkplaceInfo(WorkplaceVO vo) throws Exception {
		workplaceService.setWorkplaceInfo(vo);
	}
	//사업장 삭제 ajax
	@RequestMapping(value="/delete.do", method = RequestMethod.POST)
	@ResponseBody
	public void deleteWorkplace(String workplaceSeq) throws Exception {
		workplaceService.delWorkplace(workplaceSeq);
	}
//======================공용========================
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
