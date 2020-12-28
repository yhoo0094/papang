package co.company.papang.admin.service;

import java.util.List;

import co.company.papang.vo.MemberVO;
import co.company.papang.vo.NqVO;

public interface AdminService {
	// 怨듭��벑濡�
	public int insertNq(NqVO nqVO);

	// 怨듭� �쟾泥� 議고쉶
	public List<NqVO> getListNq(NqVO nqVO);

	// �떒嫄댁“�쉶
	public NqVO getNq(NqVO nqVO);

	// �닔�젙
	public int updateNq(NqVO vo);

	// �궘�젣
	public int deleteNq(NqVO vo);

	// 회원 전체 조회
	public List<MemberVO> getListMember(MemberVO vo);

	// 회원 권한 수정
	public int updateMember(MemberVO vo);
}
