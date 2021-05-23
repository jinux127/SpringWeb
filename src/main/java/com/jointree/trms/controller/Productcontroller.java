package com.jointree.trms.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.enterprise.inject.Model;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jointree.trms.service.impl.ProductServiceImpl;
import com.jointree.trms.vo.ProductVO;

@Controller
@RequestMapping(value = "/product")
public class Productcontroller {

	@Resource(name="productService")
	private ProductServiceImpl productService;
//====================상품 목록====================
	//상품 목록 페이지 이동
	@RequestMapping(value="list", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView listProduct(String workplaceSeq) throws Exception {
		
		ModelAndView mv = new ModelAndView("jsonView");
		
		mv.addObject("workplaceSeq", workplaceSeq);
		mv.setViewName("productlist.tiles");
		
		return mv;
	}
	// 상품 목록 호출
	@RequestMapping(value="/getlist.do", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView getProductList(String workplaceSeq) throws Exception {
		
		ModelAndView mv = new ModelAndView("jsonView");
		
		List<ProductVO> result = productService.getProductList(workplaceSeq);
		mv.addObject("List", result);
		
		return mv;
	}
	// 예약 날짜 선택 창 이동
	@RequestMapping(value="/getdate", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView getdate(String productSeq) throws Exception {
		
		ModelAndView mv = new ModelAndView("jsonView");
		mv.addObject("productSeq", productSeq);
		mv.setViewName("dateSelect");
		
		return mv;
	}
	
//====================상품 등록====================
	// 상품 등록 페이지 이동
	@RequestMapping(value="/insert", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView insertProduct(String workplaceSeq) throws Exception {
	
		ModelAndView mv = new ModelAndView("jsonView");
		
		mv.addObject("workplaceSeq", workplaceSeq);
		mv.setViewName("productinsert.tiles");
			
		return mv;
	}
	//상품 등록 ajax
	@RequestMapping(value="/insert.do", method = RequestMethod.POST)
	@ResponseBody
	public void insertProduct(ProductVO vo) throws Exception {
		productService.insertProduct(vo);
	}
//====================상품 상세====================
	// 상품 상세 페이지 이동
	@RequestMapping(value="/detail", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView productDetail(String productSeq) throws Exception {
		
		ModelAndView mv = new ModelAndView("jsonView");
		
		mv.addObject("productSeq", productSeq);
		mv.setViewName("productDetail.tiles");
		
		return mv;
	}
	// 상품 상세 정보 호출 ajax
	@RequestMapping(value="/getproductinfo.do", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView getProductInfo(String productSeq) throws Exception {
		
		ModelAndView mv = new ModelAndView("jsonView");
		ProductVO vo = productService.getProductInfo(productSeq);
		
		mv.addObject("ProductInfo", vo);
		
		return mv;
	}
//====================상품 업데이트====================
	// 상품 수정 ajax
	@RequestMapping(value="/setproductinfo.do", method = RequestMethod.POST)
	@ResponseBody
	public void setProductInfo(ProductVO vo) throws Exception {
		productService.setProductInfo(vo);
	}
//====================상품 삭제====================	
	// 상품 삭제 ajax
	@RequestMapping(value="/delete.do", method = RequestMethod.POST)
	@ResponseBody
	public void delProduct(String productSeq) throws Exception {
		productService.delProduct(productSeq);
	}
	
}
