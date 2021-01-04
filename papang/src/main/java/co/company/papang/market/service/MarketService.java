package co.company.papang.market.service;

import java.util.List;

import co.company.papang.vo.BagVO;
import co.company.papang.vo.ProductVO;
import co.company.papang.vo.Tran_infoVO;

public interface MarketService {
	// 판매상품
	public ProductVO getItem(ProductVO product); // 단건조회
	public int insertItem(ProductVO product); // 등록
	
	// 장바구니
	public int insertCart(BagVO bag); // 등록
	public List<BagVO> getCartList(String mbr_id);// 목록
	public int deleteCart(BagVO bag);
	
	// 주문
	public void orderInfo(Tran_infoVO tran); // 주문하기
}

