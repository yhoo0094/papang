package co.company.papang.member.service;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import co.company.papang.impl.EsMapper;
import co.company.papang.impl.YrMapper;
import co.company.papang.vo.MemberVO;

@Service
public class UserMailSendService {
	@Autowired JavaMailSender mailSender;
	@Autowired SqlSessionTemplate sqlSession;
	private EsMapper dao;
	private YrMapper yrDao;

	// 이메일 난수 만드는 메서드
	private String init() {
		Random ran = new Random();
		StringBuffer sb = new StringBuffer();
		int num = 0;

		do {
			num = ran.nextInt(75) + 48;
			if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
				sb.append((char) num);
			} else {
				continue;
			}

		} while (sb.length() < size);
		if (lowerCheck) {
			return sb.toString().toLowerCase();
		}
		return sb.toString();
	}

	// 난수를 이용한 키 생성
	private boolean lowerCheck;
	private int size;

	public String getKey(boolean lowerCheck, int size) {
		this.lowerCheck = lowerCheck;
		this.size = size;
		return init();
	}

	// 회원가입 발송 이메일(인증키 발송)
	public void mailSendWithUserKey(String mrb_email, String mbr_id, HttpServletRequest request) {
		
		String key = getKey(false, 20);
		dao = sqlSession.getMapper(EsMapper.class);
		dao.GetKey(mbr_id, key); 
		MimeMessage mail = mailSender.createMimeMessage();
		String htmlStr = "<h2>안녕하세요 Papang 입니다</h2>" 
				+ "<h3>" + mbr_id + "님</h3>," + "<p>인증하기 버튼을 누르시면 로그인을 하실 수 있습니다 : " 
				+ "<a href='http://localhost/papang/member/key_alter?mbr_id="+ mbr_id +"&authkey="+key+"'>인증하기</a></p>"
				+ "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)";
		try {
			mail.setSubject("[본인인증] 아빠들의 육아커뮤니티, Papang의 인증메일입니다", "utf-8");
			mail.setText(htmlStr, "utf-8", "html");
			mail.addRecipient(RecipientType.TO, new InternetAddress(mrb_email));
			mailSender.send(mail);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
	}

	// 인증 확인 메서드 (Y 값으로 바꿔주는 메서드)
	public int alter_userKey_service(String mbr_id, String key) {
		int resultCnt = 0;
		dao = sqlSession.getMapper(EsMapper.class);
		resultCnt = dao.alter_authkey(mbr_id, key);
		return resultCnt;
	}
	
	// 패스워드 찾기 이메일 발송
		public void mailSendWithPassword(String mbr_id, String mbr_email, HttpServletRequest request) {
			// 비밀번호는 6자리로 보내고 데이터베이스 비밀번호를 바꿔준다
			String key = getKey(false, 6);
			dao = sqlSession.getMapper(EsMapper.class);

			MimeMessage mail = mailSender.createMimeMessage();
			String htmlStr = "<h2>안녕하세요 Papang 입니다</h2><br><br>" 
					+ "<p>비밀번호 찾기를 신청해주셔서 임시 비밀번호를 발급해드립니다.</p>"
					+ "<p>임시로 발급 드린 비밀번호는 <h2 style='color : blue'>" + key +"</h2>이며 로그인 후 마이페이지에서 비밀번호를 변경해주시면 됩니다.</p><br>"
					+ "<h3><a href='http://localhost/papang'>Papang 접속하기</a></h3><br><br>"
					+ "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)";
			try {
				mail.setSubject("[임시 비밀번호] 아빠들의 육아커뮤니티, Papang에서 임시 비밀번호가 발급되었습니다", "utf-8");
				mail.setText(htmlStr, "utf-8", "html");
				mail.addRecipient(RecipientType.TO, new InternetAddress(mbr_email));
				mailSender.send(mail);
			} catch (MessagingException e) { 
				e.printStackTrace();
			}
			// 비밀번호 암호화해주는 메서드
			key = Sha256.encrypt(key);
			// 데이터 베이스 값은 암호한 값으로 저장시킨다.
			dao.findPw(mbr_id, mbr_email, key);
//			System.out.println("바뀐비번>>"+key);
		}
}