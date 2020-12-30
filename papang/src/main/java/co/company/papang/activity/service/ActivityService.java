package co.company.papang.activity.service;

import java.util.List;

import co.company.papang.vo.Act_comVO;
import co.company.papang.vo.ChildVO;
import co.company.papang.vo.PlayVO;

public interface ActivityService {

	//------예방접종----------
	public List<ChildVO> selectChild(ChildVO childVO);//내자녀 조회
	
	
	
	//----------활동--------------
	//1.[요리]
	
	
	
	//2.[놀이]
	public List<PlayVO> getPlayList(PlayVO playVO); //리스트 전체 조회
	public PlayVO getPlay(PlayVO playVO); //리스트 단건 조회
	
	
	//3.[활동후기]
		//3-1.놀이후기
		public List<Act_comVO> getActComm(Act_comVO act_comVO);//놀이후기 전체조회
		public Act_comVO getStar(Act_comVO act_comVO);//요리단건 평점조회
}