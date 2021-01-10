package co.company.papang.sitter.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.company.papang.community.service.CommunityService;
import co.company.papang.impl.SmMapper;
import co.company.papang.sitter.service.SitterService;
import co.company.papang.vo.ChildVO;
import co.company.papang.vo.CommunityVO;
import co.company.papang.vo.Community_comVO;
import co.company.papang.vo.SitterVOChk;
import co.company.papang.vo.Sitter_revChkVO;
import co.company.papang.vo.Sitter_revVO;

@Service
public class SitterServiceImpl implements SitterService {
	@Autowired SmMapper dao;

	@Override
	public List<SitterVOChk> getSitterList(SitterVOChk sitterVOChk) {
		return dao.getSitterList(sitterVOChk);
	}

	@Override
	public SitterVOChk getSitter(SitterVOChk sitterVOChk) {
		return dao.getSitter(sitterVOChk);
	}

	@Override
	public List<ChildVO> getChildList(ChildVO childVO) {
		return dao.getChildList(childVO);
	}

	@Override
	public int insertReservation(Sitter_revVO sitter_revVO) {
		return dao.insertReservation(sitter_revVO);
	}

	@Override
	public String selectReservationKey() {
		return dao.selectReservationKey();
	}

	@Override
	public List<Sitter_revChkVO> getReservationList(Sitter_revChkVO sitter_revChkVO) {
		return dao.getReservationList(sitter_revChkVO);
	}

	@Override
	public int updateReservationStatus(Sitter_revChkVO sitter_revChkVO) {
		return dao.updateReservationStatus(sitter_revChkVO);
	}

	@Override
	public int deleteReservation(Sitter_revChkVO sitter_revChkVO) {
		return dao.deleteReservation(sitter_revChkVO);
	}
	
}
