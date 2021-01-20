package co.company.papang.activity.service;

import java.util.List;
import java.util.Map;

import co.company.papang.vo.Act_comVO;
import co.company.papang.vo.ChildVO;
import co.company.papang.vo.CookVO;
import co.company.papang.vo.PlayVO;

public interface ActivityService {

	//------예방접종----------
	public List<ChildVO> selectChild(ChildVO childVO);//내자녀 조회
	
	
	//----------활동--------------
	//1.[요리]
	public List<Map<String,Object>> getCookList(CookVO cookVO);//요리 리스트 전체 조회
	public int insertCook(CookVO cookVO); //요리 글 등록
	public CookVO getCook(CookVO cookVO);//요리 단건 조회
	public int cookhitPlus(CookVO cookVO);//요리글 조회수 증가
	public int deleteCook(CookVO cookVO);//요리 글 삭제
	public int deleteCookAcCom(Act_comVO act_comVO);//요리 글 삭제시 후기 삭제
	public int updateCook(CookVO cookVO);// 요리 글 업데이트
	
	//2.[놀이]
	public List<Map<String,Object>> getPlayList(PlayVO playVO); //리스트 전체 조회
	public PlayVO getPlay(PlayVO playVO); //리스트 단건 조회
	public int hitPlus(PlayVO playVO);//조회수
	public int insertPlay(PlayVO playVO);//놀이 글 등록
	public int deletePaly(PlayVO playVO); //놀이 글 삭제
	public int updatePlay(PlayVO playVO);//놀이 글 업데이트
	
	//3.[활동후기]
	//3-1.놀이후기
	public List<Act_comVO> getActComm(Act_comVO act_comVO);//놀이후기 전체조회
	public Act_comVO getStar(Act_comVO act_comVO);//요리단건 평점조회
	public int insertActComm(Act_comVO act_comVO);//놀이 후기글 등록
	public int deletePlayAct(Act_comVO act_comVO);//놀이 글 삭제시 관련 후기 삭제
	//3-2.요리후기
	public List<Act_comVO> getCActComm(Act_comVO act_comVO);//요리후기 전제 조회
	public int insertCookActComm(Act_comVO act_comVO);//요리 후기글 등록
	
	//5.후기 리스트 페이지
	public List<Act_comVO> getActList(Act_comVO act_comVO);//놀이후기 리스트 페이지용 전체조회
	public int updateActcom(Act_comVO act_comVO);//요리/놀이 후기 업데이트
	public int deleteActcom(Act_comVO act_comVO);//요리,놀이 후기 삭제
}
