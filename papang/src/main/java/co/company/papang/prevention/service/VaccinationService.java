package co.company.papang.prevention.service;

import java.util.List;

import org.springframework.stereotype.Service;

import co.company.papang.vo.ChildVO;
import co.company.papang.vo.PreventionVO;

public interface VaccinationService  {

	public List<ChildVO> selectChild(ChildVO childVO);	//내자녀 조회
	public int insertPrevent(PreventionVO preventionVO);//예방접종 일지 등록
	public List<PreventionVO> getPreventList(PreventionVO preventionVO);//예방접종 전체 조회
	public PreventionVO getPrevent(PreventionVO preventionVO);//예방접종 단건 쿼리
	public int updatePrevent(PreventionVO preventionVO);//예방접종 업데이트
	public ChildVO getChild(ChildVO childVO);//아이 단건 조회
}
