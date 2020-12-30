package co.company.papang.market.service;

import co.company.papang.vo.ProductVO;

public interface MarketService {
	// 판매상품
	public ProductVO getItem(ProductVO product); // 단건조회
	public int insertItem(ProductVO product); // 등록
}

