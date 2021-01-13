package co.company.papang.market.service;

import java.util.List;

import co.company.papang.vo.BagVO;
import co.company.papang.vo.Od_detailVO;
import co.company.papang.vo.ProductVO;
import co.company.papang.vo.Order_infoVO;

public interface MarketService {
	// 판매상품
	public ProductVO getItem(ProductVO product); // 단건조회
	public int insertItem(ProductVO product); // 등록
	public int updateItem(ProductVO product); // 수정
	public int deleteItem(ProductVO product); // 삭제
	
	// 장바구니
	public List<BagVO> getCartList(String mbr_id);//전체조회
	public int insertCart(BagVO bag); // 등록
	public int countCart(String pro_no, String mbr_id); // 장바구니 상품확인
	//public void cntChange(BagVO bag); // 등록시 수량수정
	
	public void updateCart(BagVO bag); // 수정
	public int deleteCart(BagVO bag); // 선택삭제
	
	
	// 주문
	public void orderInsert(Order_infoVO order, Od_detailVO detail, String mbr_id); // 주문
//	public void orderInfo(Order_infoVO order); // 주문내역 생성
//	public void orderDetail(Od_detailVO detail); // 주문 상세정보
//	public void deleteAllCart(String mbr_id); // 주문후 장바구니 비우기
	public void minusWareCnt(String mbr_id); // 출고내역 등록
}

