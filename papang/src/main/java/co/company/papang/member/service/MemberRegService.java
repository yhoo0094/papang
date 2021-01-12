package co.company.papang.member.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.company.papang.impl.EsMapper;
import co.company.papang.vo.MemberVO;

@Service
public class MemberRegService {
	@Autowired
	private SqlSessionTemplate memberSqlSession;
	private EsMapper dao;
	
	// 아이디 중복체크
	public int mbrIdCheck(String mbr_id) {
		dao = memberSqlSession.getMapper(EsMapper .class);
		return dao.checkId(mbr_id);
	}
//	// 닉네임 중복체크
//	public int mbrNkCheck(String mbr_nick) {
//		dao = memberSqlSession.getMapper(EsMapper .class);
//		return dao.checkNk(mbr_nick);
//	}
	// 이메일 중복체크
	public int mbrEmCheck(String mbr_email) {
		dao = memberSqlSession.getMapper(EsMapper .class);
		return dao.checkEm(mbr_email);
	}
	// 회원가입
	public int insertUser(MemberVO member) {
		int resultCnt = 0;
		dao = memberSqlSession.getMapper(EsMapper.class);
		try {
			resultCnt = dao.insertUser(member);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return resultCnt;
	}
	public int insertKakaoUser(MemberVO member) {
		int resultCnt = 0;
		dao = memberSqlSession.getMapper(EsMapper.class);
		try {
			resultCnt = dao.insertKakaoUser(member);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return resultCnt;
	}
}
