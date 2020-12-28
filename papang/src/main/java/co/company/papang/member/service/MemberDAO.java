package co.company.papang.member.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.company.papang.impl.EsMapper;
import co.company.papang.vo.MemberVO;

@Repository
public class MemberDAO {

	@Autowired
	SqlSession sqlSession;
	
//	public int insertUser(MemberVO member) {
//		int result=0;
//		EsMapper mapper = sqlSession.getMapper(EsMapper.class);
//		
//		try {
//			result = mapper.insertUser(member);
//		} catch(Exception e) {
//			e.printStackTrace();
//			return result;
//		}
//		return result;
//	}
	
	public MemberVO login(MemberVO member) {
		MemberVO result = null;
		EsMapper mapper = sqlSession.getMapper(EsMapper.class);
		
		try {
			result = mapper.login(member);
		} catch (Exception e) {
			e.printStackTrace();
			return result;
		}
	return result;
	}
}
