package co.company.papang.impl;

import java.util.List;
import java.util.Map;

import co.company.papang.vo.Act_comVO;
import co.company.papang.vo.ChildVO;
import co.company.papang.vo.CookVO;
import co.company.papang.vo.MemberVO;
import co.company.papang.vo.PlayVO;
import co.company.papang.vo.PreventionVO;

public interface SaMapper {

	public int insertPreven(PreventionVO preventionVO);
	
	//----------예방접종--------------
	//내자녀 조회
	public List<ChildVO> selectChild(ChildVO childVO);
	
	
	
	//----------활동--------------
	//1.[요리]
	public List<Map<String,Object>> getCookList(CookVO cookVO);//리스트 전체 조회
	public int insertCook(CookVO cookVO); //요리 글 등록
	public CookVO getCook(CookVO cookVO);//요리 단건 조회
	
	
	//2.[놀이]
	public List<Map<String,Object>> getPlayList(PlayVO playVO); //리스트 전체 조회
	public PlayVO getPlay(PlayVO playVO); //리스트 단건 조회
	public int hitPlus(PlayVO playVO);//조회수
	public int insertPlay(PlayVO playVO);//놀이 글 등록
	public MemberVO getMember(MemberVO memberVO);//멤버 조회(멤버 사진 조회용)
	
	//3.[활동후기]
	//3-1.놀이후기
	public List<Act_comVO> getActComm(Act_comVO act_comVO);//놀이후기 전체조회
	public Act_comVO getStar(Act_comVO act_comVO);//놀이 단건글 평점조회
	public int insertActComm(Act_comVO act_comVO);//놀이 후기글 등록
	//3-2.요리후기
	public List<Act_comVO> getCActComm(Act_comVO act_comVO);//요리후기 전제 조회
	public int insertCookActComm(Act_comVO act_comVO);//요리 후기글 등록
	
	
	
	
}

