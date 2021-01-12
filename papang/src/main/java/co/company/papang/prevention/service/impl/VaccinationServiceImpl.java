package co.company.papang.prevention.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.company.papang.impl.SaMapper;
import co.company.papang.prevention.service.VaccinationService;
import co.company.papang.vo.ChildVO;
import co.company.papang.vo.PreventionVO;

@Service
public class VaccinationServiceImpl implements VaccinationService {
	@Autowired SaMapper dao;

	@Override//아이 전제 조회
	public List<ChildVO> selectChild(ChildVO childVO) {
		return dao.selectChild(childVO);
	}

	@Override//예방접종 일지등록
	public int insertPrevent(PreventionVO preventionVO) {
		return dao.insertPrevent(preventionVO);
	}

	@Override//예방접종 전체 조회
	public List<PreventionVO> getPreventList(PreventionVO preventionVO) {
		return dao.getPreventList(preventionVO);
	}

	@Override//예방접종 단건 쿼리
	public PreventionVO getPrevent(PreventionVO preventionVO) {
		return dao.getPrevent(preventionVO);
	}

	@Override//예방접종 업데이트
	public int updatePrevent(PreventionVO preventionVO) {
		return dao.updatePrevent(preventionVO);
	}

	@Override
	public ChildVO getChild(ChildVO childVO) {
		return dao.getChild(childVO);
	}

	@Override
	public ChildVO getDate(ChildVO childVO) {
		return dao.getDate(childVO);
	}
	



}
