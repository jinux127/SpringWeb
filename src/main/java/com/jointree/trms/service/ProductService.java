package com.jointree.trms.service;

import java.util.List;

import com.jointree.trms.vo.ProductVO;

public interface ProductService {
	// 상품 목록 호출
	public List<ProductVO> getProductList(String workplaceSeq) throws Exception;
	//상품 등록
	public void insertProduct(ProductVO vo) throws Exception;
	//상품 상세 정보 호출
	public ProductVO getProductInfo(String productSeq) throws Exception;
	//상품 수정
	public void setProductInfo(ProductVO vo) throws Exception;
	//상품 삭제
	public void delProduct(String productSeq) throws Exception;
}
