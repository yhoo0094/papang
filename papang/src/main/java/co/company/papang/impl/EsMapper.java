package co.company.papang.impl;

import java.util.List;

import co.company.papang.vo.AdminVO;
import co.company.papang.vo.BagVO;
import co.company.papang.vo.MemberVO;
import co.company.papang.vo.Od_detailVO;
import co.company.papang.vo.ProductVO;
import co.company.papang.vo.Order_infoVO;
import co.company.papang.vo.UsedVO;

public interface EsMapper {

	// 회원가입
	public int insertUser(MemberVO member); // 등록
	public int insertKakaoUser(MemberVO member); // 카카오 회원등록
	public int GetKey(String mbr_id, String authkey); // 유저 인증키 생성 메서드
	public int alter_authkey(String mbr_id, String authkey); // 유저 인증키 Y로 바꿔줌
	// 중복체크
	public int checkId(String mbr_id); // 아이디
	public int checkNk(String mbr_nick); // 닉네임
	public int checkEm(String mbr_email); // 이메일
	
	// 로그인
	public MemberVO login(MemberVO member); // 로그인
	public String loginCheck(MemberVO member); // 로그인 체크
	public AdminVO adminLogin(AdminVO admin); // 관리자로그인
	public String adminLoginCheck(AdminVO admin); // 관리자로그인 체크
	public MemberVO kLogin(MemberVO member); // 카카오로그인
	public int kakaoCheck(String kid); // 카톡아이디 체크
	
	// 판매상품
	public List<ProductVO> getItemList(ProductVO product);// 전체조회
	public ProductVO getItem(ProductVO product); // 단건조회
	public int insertItem(ProductVO product); // 등록
	public int updateItem(ProductVO product); // 수정
	public int deleteItem(ProductVO product); // 삭제
	
	// 중고장터
	public List<UsedVO> getUsedList(UsedVO used);//전체조회
	public List<UsedVO> onSaleUsedList(UsedVO used);//판매중 조회
	public UsedVO getUsed(UsedVO used); // 단건조회
	public int insertUsed(UsedVO used); // 등록
	public int updateUsed(UsedVO used); // 수정
	public int deleteUsed(UsedVO used); // 삭제
	public int hitPlus(UsedVO used); //조회수
	
	// 장바구니
	public List<BagVO> getCartList(String mbr_id);//전체조회
	public int insertCart(BagVO bag); // 등록
	public int countCart(String pro_no, String mbr_id); // 장바구니 상품확인
	public void cntChange(BagVO bag); // 등록시 수량수정
	
	public void updateCart(BagVO bag); // 수정
	public int deleteCart(BagVO bag); // 주문후 장바구니 전체삭제
	

	// 주문
	public void orderInfo(Order_infoVO order); // 주문내역 생성
	public void orderDetail(Od_detailVO detail); // 주문 상세정보
	public void deleteAllCart(String mbr_id); // 주문후 장바구니 비우기
}

