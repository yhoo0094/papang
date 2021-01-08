package co.company.papang.admin.service;

import java.util.List;
import java.util.Map;

import co.company.papang.vo.BannerVO;
import co.company.papang.vo.MemberVO;
import co.company.papang.vo.NqVO;
import co.company.papang.vo.ProductVO;
import co.company.papang.vo.SitterVO;
import co.company.papang.vo.WarehousingVO;

public interface AdminService {
	// �⑤벊占쏙옙踰묉에占�
	public int insertNq(NqVO nqVO);

	// �⑤벊占� 占쎌읈筌ｏ옙 鈺곌퀬�돳
	public List<NqVO> getListNq(NqVO nqVO);

	// 占쎈뼊椰꾨똻�쒙옙�돳
	public NqVO getNq(NqVO nqVO);

	// 占쎈땾占쎌젟
	public int updateNq(NqVO vo);

	// 占쎄텣占쎌젫
	public int deleteNq(NqVO vo);

	// �쉶�썝 �쟾泥� 議고쉶
	public List<MemberVO> getListMember(MemberVO vo);

	// �쉶�썝 沅뚰븳 �닔�젙
	public int updateMember(MemberVO vo);

	// 시터 등록
	public int insertSitter(SitterVO vo);

	// 시터 삭제
	public int deleteSitter(SitterVO vo);

	// 시터 단건 조회
	public SitterVO getSitter(SitterVO vo);

	// 시터 수정
	public int updateSitter(SitterVO vo);

	// 맴버 탈퇴
	public int deleteMember(MemberVO vo);

	// 시터권한 알림
	public int insertSitterAlarm(MemberVO vo);

	// 배너등록
	public int insertBanner(BannerVO vo);

	// 배너조회
	public List<BannerVO> getbannerlist(BannerVO vo);

	// 배너 단건
	public BannerVO getBanner(BannerVO vo);

	// 배너 수정
	public int updateBanner(BannerVO vo);

	// 배너 삭제
	public int deleteBanner(BannerVO vo);

	// 배너 상태 수정
	public int updateBannerstatus(BannerVO vo);

	// 상품 이름,번호
	public List<ProductVO> getprono(ProductVO vo);

	// 입고 등록
	public int Wareinsert(WarehousingVO vo);

	// 입출고 조회
	public List<Map<String, Object>> warehousinglist(WarehousingVO vo);
	
	//상품 수량 입고 수정
	public int updateprocnt(WarehousingVO vo);
}
