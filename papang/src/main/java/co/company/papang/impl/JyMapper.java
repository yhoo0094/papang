package co.company.papang.impl;

import java.util.List;
import java.util.Map;

import co.company.papang.vo.NqVO;


public interface JyMapper {
	// 공지등록
	public int insertNq(NqVO nqVO);

	// 공지 전체 조회
	public List<NqVO> getListNq(NqVO nqVO);

	// 단건조회
	public NqVO getNq(NqVO nqVO);

	// 수정
	public int updateNq(NqVO vo);

	// 삭제
	public int deleteNq(NqVO vo);

}
