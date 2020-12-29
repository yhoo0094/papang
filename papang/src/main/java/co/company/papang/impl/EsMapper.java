package co.company.papang.impl;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import co.company.papang.vo.BagVO;
import co.company.papang.vo.MemberVO;
import co.company.papang.vo.ProductVO;
import co.company.papang.vo.UsedVO;

public interface EsMapper {

	// 회원가입
	public int insertUser(MemberVO member); // 등록
	
	// 중복체크
	public int checkId(String mbr_id); // 아이디
	public int checkNk(String mbr_nick); // 닉네임
	
	// 로그인
	public MemberVO login(MemberVO member); // 로그인
	public String loginCheck(MemberVO member); // 로그인 체크
	
	// 판매상품
	public List<ProductVO> getItemList(ProductVO product);// 전체조회
	public ProductVO getItem(ProductVO product); // 단건조회
	public int insertItem(ProductVO product); // 등록
	public int updateItem(ProductVO product); // 수정
	public int deleteItem(ProductVO product); // 삭제
	
	// 중고장터
	public List<UsedVO> getUsedList(UsedVO used);//전체조회
	public UsedVO getUsed(UsedVO used); // 단건조회
	public int insertUsed(UsedVO used); // 등록
	public int updateUsed(UsedVO used); // 수정
	public int deleteUsed(UsedVO used); // 삭제
	
	// 장바구니
	public List<BagVO> getCart(BagVO bag);//전체조회
	public int insertCart(BagVO bag); // 등록
	public int updateCart(BagVO bag); // 수정
	public int deleteCart(BagVO bag); // 삭제
}

