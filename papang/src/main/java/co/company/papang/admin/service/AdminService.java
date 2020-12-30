package co.company.papang.admin.service;

import java.util.List;

import co.company.papang.vo.MemberVO;
import co.company.papang.vo.NqVO;
import co.company.papang.vo.SitterVO;

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
}
