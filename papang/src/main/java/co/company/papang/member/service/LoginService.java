package co.company.papang.member.service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.company.papang.impl.EsMapper;
import co.company.papang.vo.MemberVO;

@Service
public class LoginService {

	@Autowired private SqlSessionTemplate sqlSesison;
//	@Autowired private RedundantLoginService loginManager; 중복아이디 접속 관리..
	
	private EsMapper dao;
	// admin dao가 필요할때가 있다고..?
	
	public int memberLogin_service(MemberVO mvo, HttpSession session, String remember, HttpServletResponse response) {
		// db값과 입력값 비교용
		String mbr_id = mvo.getMbr_id();
		String mbr_pw = mvo.getMbr_pw();
		
		MemberVO vo = dao.login(mbr_id);
		int result = 0;
		if (vo == null) { // 회원X
			result = 0;
			return result;
		}
		// 회원 O
		if (vo != null) {
			// 아이디랑 비번이 db의 값과 같을때
			if(vo.getMbr_id().equals(mbr_id) && vo.getMbr_pw().equals(mbr_pw)) {
				// 쿠키 검사
				Cookie cookie = new Cookie("remember", mbr_id);
				if(remember.equals("true")) { // 저장O
					response.addCookie(cookie); // 체크돼있으면 서버로 보내기
				} else { // 저장X
					cookie.setMaxAge(0); // 쿠키죽여
					response.addCookie(cookie);
					
				}
			}
			// 세션에 객체 저장
			session.setAttribute("mbr", vo); // id값으로 가져온 객체들을 세션에 저장
			// 뽑을때 ${mbr.mbr_id} 이런식으로 하면 될듯??
			result = 1;
		}
		return result;
	}
}
