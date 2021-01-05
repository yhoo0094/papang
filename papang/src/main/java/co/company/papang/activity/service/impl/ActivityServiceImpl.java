package co.company.papang.activity.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import co.company.papang.activity.service.ActivityService;
import co.company.papang.impl.SaMapper;
import co.company.papang.vo.Act_comVO;
import co.company.papang.vo.ChildVO;
import co.company.papang.vo.MemberVO;
import co.company.papang.vo.PlayVO;

@Service
public class ActivityServiceImpl implements ActivityService {
	@Autowired SaMapper dao;

	@Override//리스트 전체 조회
	
	//리스트 전체 조회
	public List<Map<String,Object>> getPlayList(PlayVO playVO) {
		return dao.getPlayList(playVO);
	}

	@Override//내자녀 조회
	public List<ChildVO> selectChild(ChildVO childVO) {
		return dao.selectChild(childVO);
	}

	@Override//리스트 단건 조회
	public PlayVO getPlay(PlayVO playVO) {
		return dao.getPlay(playVO);
	}

	@Override//요리후기 전제조회
	public List<Act_comVO> getActComm(Act_comVO act_comVO) {
		return dao.getActComm(act_comVO);
	}

	@Override//요리단건 평점조회
	public Act_comVO getStar(Act_comVO act_comVO) {
		return dao.getStar(act_comVO);
	}

	@Override//놀이 후기글 등록
	public int insertActComm(Act_comVO act_comVO) {
		return dao.insertActComm(act_comVO);
	}

	@Override//놀이 조회수
	public int hitPlus(PlayVO playVO) {
		return dao.hitPlus(playVO);
	}

	@Override//놀이 글등록
	public int insertPlay(PlayVO playVO) {
		return dao.insertPlay(playVO);
	}

	
	@Override//멤버 조회
	public MemberVO getMember(MemberVO memberVO) {
		return dao.getMember(memberVO);
	}
}
