package com.jointree.trms.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jointree.trms.dao.mapper.ProductMapper;
import com.jointree.trms.service.ProductService;
import com.jointree.trms.vo.ProductVO;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("productService")
public class ProductServiceImpl extends EgovAbstractServiceImpl implements ProductService {

	@Resource(name="productMapper")
	private ProductMapper productMapper;
	// 상품 목록 호출
	@Override
	public List<ProductVO> getProductList(String workplaceSeq) {
		List<ProductVO> temp = productMapper.getProductList(workplaceSeq);
		int count = temp.size(); //가져온 목록의 수
		
		for(int i = 0; i < count; i++) {
			String val = temp.get(i).getProductStatus();
			if(val.equals ("e")){
				temp.get(i).setProductStatus("활성화"); 
			} else if(val.equals ("d")) {
				temp.get(i).setProductStatus("비활성화");
			}
		}
		return temp;
	}
	//상품 등록
	@Override
	public void insertProduct(ProductVO vo) {
		productMapper.insertProduct(vo);
	}
	//상품 상세 정보 호출
	@Override
	public ProductVO getProductInfo(String productSeq) throws Exception {
		
		return productMapper.getProductInfo(productSeq);

	}
	//상품 수정
	@Override
	public void setProductInfo(ProductVO vo) {
		productMapper.setProductInfo(vo);
	}
	//상품 삭제
	@Override
	public void delProduct(String productSeq) {
		productMapper.delProduct(productSeq);
	}
}
