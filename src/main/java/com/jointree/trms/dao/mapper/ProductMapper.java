package com.jointree.trms.dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jointree.trms.vo.ProductVO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("productMapper")
public interface ProductMapper {
	// 상품 목록 호출
	public List<ProductVO> getProductList(String workplaceSeq);
	//상품 등록
	public void insertProduct(ProductVO vo);
	//상품 상세 정보 호출
	public ProductVO getProductInfo(@Param("productSeq") String productSeq);
	//상품 수정
	public void setProductInfo(ProductVO vo);
	//상품 수정
	public void delProduct(String productSeq);

	
	
	
}
