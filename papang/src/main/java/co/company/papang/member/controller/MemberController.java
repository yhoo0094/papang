package co.company.papang.member.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.JsonNode;

import co.company.papang.impl.EsMapper;
import co.company.papang.member.service.LoginService;
import co.company.papang.member.service.MemberRegService;
import co.company.papang.member.service.Sha256;
import co.company.papang.member.service.UserMailSendService;
import co.company.papang.vo.AdminVO;
import co.company.papang.vo.MemberVO;
import co.company.papang.vo.Report_info;

@Controller
public class MemberController {
	@Autowired EsMapper dao;
	@Autowired MemberRegService reg_service;
	@Autowired LoginService log_service;
	@Autowired UserMailSendService mailsender;

	// 회원가입 폼 버전1.. 일단 여기에 기능 몰빵해둠~~ 몰겠어 디자인적으로.. ㅎㅎ
	@RequestMapping("/member/joinForm") // url 예전 .do
	public ModelAndView test(HttpServletResponse response) throws IOException {
		return new ModelAndView("member/joinForm"); // jsp주소
	}
	// 소셜로그인 추가정보 입력 폼 버전
	@RequestMapping("/member/snsJoinForm") // url 예전 .do
	public ModelAndView test3(HttpServletResponse response) throws IOException {
		return new ModelAndView("member/snsJoinForm"); // jsp주소
	}

	// 아이디중복체크
	@RequestMapping(value = "/ajax/idchk", method = RequestMethod.GET) // url 예전 .do
	@ResponseBody
	public int idChk(@RequestParam("mbr_id") String mbr_id) throws IOException {
		return reg_service.mbrIdCheck(mbr_id); // jsp주소
	}

//	// 닉 중복체크
//	@RequestMapping(value = "/ajax/nkchk", method = RequestMethod.GET) // url 예전 .do
//	@ResponseBody
//	public int nkChk(@RequestParam("mbr_nick") String mbr_nick) throws IOException {
//		return reg_service.mbrNkCheck(mbr_nick); // jsp주소
//	}
	
	// 이메일 중복체크
	@RequestMapping(value = "/ajax/emailchk", method = RequestMethod.GET) // url 예전 .do
	@ResponseBody
	public int emailChk(@RequestParam("mbr_email") String mbr_email) throws IOException {
		return reg_service.mbrEmCheck(mbr_email); // jsp주소
	}

	// 회원가입 처리
	@PostMapping("/member/join")
	public void join(HttpServletRequest request, MemberVO member, HttpServletResponse response) throws IOException {
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;

		// 비밀번호 암호화(Sha256)
		String encryPw = Sha256.encrypt(member.getMbr_pw());
		member.setMbr_pw(encryPw);
		
		// 이미지파일(첨부파일 읽어내기)
		MultipartFile multipartFile = multipartRequest.getFile("uploadFile");
		if (!multipartFile.isEmpty() && multipartFile.getSize() > 0) {
			// 파일 경로 webapp 바로 밑이 최상위
			String path = request.getSession().getServletContext().getRealPath("/images/memberimage");
			multipartFile.transferTo(new File(path, multipartFile.getOriginalFilename()));
			member.setMbr_pic(multipartFile.getOriginalFilename());
		}
		reg_service.insertUser(member);
		
		// 인증 메일 보내기 메서드
		mailsender.mailSendWithUserKey(member.getMbr_email(), member.getMbr_id(), request);
		response.setContentType("text/html; charset=UTF-8");
		try {
			PrintWriter out = response.getWriter();
			out.println("<script>alert('이메일 인증을 완료해주세요');</script>");
			out.println("<script>location.href='/papang/';</script>");
		} catch (IOException e) {
			e.printStackTrace();
		}
		//return "main/main";
	}
	
	// e-mail 인증 컨트롤러
	@RequestMapping(value = "/member/key_alter", method = RequestMethod.GET)
	public void key_alterConfirm(@RequestParam("mbr_id") String mbr_id, @RequestParam("authkey") String key, HttpServletResponse response) {
		mailsender.alter_userKey_service(mbr_id, key); // mailsender의 경우 @Autowired
		response.setContentType("text/html; charset=UTF-8");
		try {
			PrintWriter out = response.getWriter();
			out.println("<script>alert('인증되었습니다');</script>");
			out.println("<script>location.href='/papang/';</script>");
		} catch (IOException e) {
			e.printStackTrace();
		}
		//return "main/main";
	}

	// 로그인 폼
	@RequestMapping("/member/loginForm") // url 예전 .do
	public ModelAndView test4(HttpServletResponse response) throws IOException {
		ModelAndView mav = new ModelAndView();
		String kakaoUrl = KakaoAPI.getAuthorizationUrl(); /* 생성한 인증 URL을 View로 전달 */
		mav.setViewName("member/loginForm"); // 로그인 폼
		// mav.addObject("naver_url", naverAuthUrl); // 네이버 로그인
		mav.addObject("kakao_url", kakaoUrl); // 카카오 로그인
		// 이때 mav에 설정한 오브젝트 이름을 로그인.jsp 에서 a태그에 불러서 씀
		return mav;
	}

	// 로그인처리
	@PostMapping("/member/login") // post 요청은 로그인 처리
	public void login(@ModelAttribute("member") MemberVO member, HttpSession session, Model model,
			HttpServletResponse response) throws ParseException {
		response.setContentType("text/html; charset=UTF-8"); // 한국어
		
		// 비밀번호 암호화(Sha256)
		String encryPw = Sha256.encrypt(member.getMbr_pw());
		member.setMbr_pw(encryPw);
		MemberVO mbr = new MemberVO();
		mbr = dao.login(member);
		if (mbr != null) {
			if (mbr.getAuthkey().equals("Y")) {
				if (mbr.getMbr_status().equals("활동중")) {
					session.setAttribute("user", mbr); // 회원의 정보들은 user 라는 이름으로 세션에 담는다
					try {
						PrintWriter out = response.getWriter();
						out.println("<script>alert('로그인되었습니다');</script>");
						out.println("<script>location.href='/papang/';</script>");
					} catch (IOException e) {
						e.printStackTrace();
					}
				} else if (mbr.getMbr_status().equals("탈퇴")) {
					try {
						PrintWriter out = response.getWriter();
						out.println("<script>alert('탈퇴한 회원입니다');</script>");
						out.println("<script>location.href='/papang/';</script>");
					} catch (IOException e) {
						e.printStackTrace();
					}
				} else if (mbr.getMbr_status().equals("활동정지")) {
					Report_info rinfo = dao.stChk(mbr);
					long day = System.currentTimeMillis();
					System.out.println(day);
					SimpleDateFormat simpl2 = new SimpleDateFormat("yyyy-MM-dd");
					
					String d = simpl2.format(day);
					String stDate = rinfo.getRinfo_start();
					
					String stReason = rinfo.getRinfo_reason();
					
					Date day1= simpl2.parse(d);
					Date day2= simpl2.parse(stDate);
					System.out.println(day1);
					System.out.println(day2);
					if(day2.after(day1)) {
						dao.updatestatus(mbr);
						//member = dao.login(member);
						session.setAttribute("user", mbr);
						try {
							PrintWriter out = response.getWriter();
							out.println("<script>alert('"+stDate+"이후로 활동정지가 풀렸습니다.');</script>");
							out.println("<script>alert('로그인되었습니다');</script>");
							out.println("<script>location.href='/papang/';</script>");
						} catch (IOException e) {
							e.printStackTrace();
						}
						
					}else {
						try {
							PrintWriter out = response.getWriter();
							out.println("<script>alert('"+stDate+"까지 활동정지입니다');</script>");
							out.println("<script>alert('정지사유 : "+stReason+"');</script>");
							out.println("<script>location.href='/papang/';</script>");
						} catch (IOException e) {
							e.printStackTrace();
						}
					}
					
				}
			} else {
				try {
					PrintWriter out = response.getWriter();
					out.println("<script>alert('이메일인증이 필요합니다');</script>");
					out.println("<script>location.href='/papang/';</script>");
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
//		} else if (chkPw == null || chkPw.equals("")) {
//			try {
//				PrintWriter out = response.getWriter();
//				out.println("<script>alert('없는 아이디 입니다');</script>");
//				out.println("<script>location.href='/papang/member/loginForm';</script>");
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
		} else {
			try {
				PrintWriter out = response.getWriter();
				out.println("<script>alert('아이디 혹은 비밀번호를 확인해주세요');</script>");
				out.println("<script>location.href='/papang/member/loginForm';</script>");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	// 관리자 로그인 폼
	@RequestMapping("/member/adminLoginForm") // url 예전 .do
	public ModelAndView test2(HttpServletResponse response) throws IOException {
		return new ModelAndView("member/adminLoginForm"); // jsp주소
	}

	// 관리자 로그인 처리
	@PostMapping("/member/adminLogin") // url 예전 .do
	public void adminLogin(@ModelAttribute("admin") AdminVO admin, HttpSession session, Model model,
			HttpServletResponse response) {
		AdminVO ad = new AdminVO();
		ad = log_service.adminLogin(admin);
		response.setContentType("text/html; charset=UTF-8");
		if (ad != null) {
			admin = dao.adminLogin(admin);
			session.setAttribute("admin", admin); // 관리자의 정보들은 admin 라는 이름으로 세션에 담는다
			try {
				PrintWriter out = response.getWriter();
				out.println("<script>alert('관리자 접속');</script>");
				out.println("<script>location.href='/papang/';</script>");
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			try {
				PrintWriter out = response.getWriter();
				out.println("<script>alert('아이디 혹은 비밀번호를 확인해주세요');</script>");
				out.println("<script>location.href='/papang/member/adminLoginForm';</script>");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	// 로그아웃
	@GetMapping("/member/logout")
	public String logout(HttpSession session) {
		// 세션 무효화
		session.invalidate(); // 로그아웃처리
		//return "main/main";
		return "redirect:/";
	}
// 소셜로그인
	// 카카오로그인
	@RequestMapping(value = "/kakaologin")
	public ModelAndView kLogin(@RequestParam("code") String code, HttpServletRequest request,
			HttpServletResponse response, HttpSession session, MemberVO member) throws Exception {
		// code : 인가 코드 받기 요청으로 얻은 인가 코드
		ModelAndView mav = new ModelAndView(); // 결과값을 node에 담아줌
		JsonNode node = KakaoAPI.getAccessToken(code); // accessToken에 사용자의 로그인한 모든 정보가 들어있음
		JsonNode accessToken = node.get("access_token"); // 사용자의 정보에 접근할수있는 토큰?
		JsonNode userInfo = KakaoAPI.getKakaoUserInfo(accessToken); // 토큰을 갖고 회원정보를 얻어냄
		String kid = null;
		String kemail = null;
		String kname = null;

		JsonNode id = userInfo.path("id");
		kid = id.asText();
		
		JsonNode kakao_account = userInfo.path("kakao_account");
		kemail = kakao_account.path("email").asText();
		
		JsonNode properties = userInfo.path("properties");
		kname = properties.path("nickname").asText();
		kname = properties.path("nickname").asText();
		
		// 회원가입 된 카카오 아이디인지 체크
		kid = "kakao" + kid;
		int chkKid = log_service.kakaoCheck(kid);
		
		if (chkKid == 0) { // 가입안된 카톡
			session.setAttribute("kid", kid);
			session.setAttribute("kemail", kemail);
			session.setAttribute("kname", kname);
			mav.setViewName("member/snsJoinForm");
		} else { // 기존에 가입한 카톡아이디면 메인으로 이동
			response.setContentType("text/html; charset=UTF-8");
			member.setMbr_id(kid);
			dao.kLogin(member);
			session.setAttribute("user", member);
			try {
				PrintWriter out = response.getWriter();
				out.println("<script>alert('로그인되었습니다');</script>");
				
			} catch (IOException e) {
				e.printStackTrace();
			}
			mav.setViewName("main/main");
		}
		
		return mav;
	}

	// 카카오 추가정보 기입 회원가입 처리
	@PostMapping("/member/kakaoJoin")
	public String kakaoJoin(HttpServletRequest request, MemberVO member) throws IOException {
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;

		// 이미지파일(첨부파일 읽어내기)
		MultipartFile multipartFile = multipartRequest.getFile("uploadFile");
		if (!multipartFile.isEmpty() && multipartFile.getSize() > 0) {
			// 파일 경로 webapp 바로 밑이 최상위
			String path = request.getSession().getServletContext().getRealPath("/images/memberimage");
			multipartFile.transferTo(new File(path, multipartFile.getOriginalFilename()));
			member.setMbr_pic(multipartFile.getOriginalFilename());
		}
		reg_service.insertKakaoUser(member);
		return "main/main";
	}
	
	// 아이디찾기
	@ResponseBody
	@RequestMapping("/ajax/findId") // url 예전 .do
	public String test5( MemberVO member, HttpServletResponse response) throws IOException {
		String id = dao.findId(member);
//		if (id.equals("") ) {
//			try {
//				PrintWriter out = response.getWriter();
//				out.println("<script>alert('다시한번 확인해주세요');</script>");
//				
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//		} 
		return id;
	}

	// 비번찾기
	@ResponseBody
	@RequestMapping("/ajax/findPw") // url 예전 .do
	public boolean test6(@RequestParam("mbr_id")String mbr_id, @RequestParam("mbr_email")String mbr_email, HttpServletRequest request) {
		mailsender.mailSendWithPassword(mbr_id, mbr_email, request);
		return true;
	}
	
}
