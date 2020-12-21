package co.company.papang.mypage.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MypageController {

	@RequestMapping("mypage/myhome") //회원정보수정 (마이페이지 메인홈)
	public ModelAndView test(HttpServletResponse response) throws IOException{
		return new ModelAndView("mypage/myhome"); //jsp주소
	}
	
	@RequestMapping("mypage/notjoin") //회원탈퇴
	public ModelAndView test2(HttpServletResponse response) throws IOException{
		return new ModelAndView("mypage/notjoin"); 
	}
	
	@RequestMapping("mypage/babyinfo") //아이관리
	public ModelAndView test3(HttpServletResponse response) throws IOException{
		return new ModelAndView("mypage/babyinfo"); 
	}
	@RequestMapping("mypage/market_buyinfo") //구매목록
	public ModelAndView test4(HttpServletResponse response) throws IOException{
		return new ModelAndView("mypage/market_buyinfo"); 
	}
	@RequestMapping("mypage/market_deli") //배송 현황 조회
	public ModelAndView test5(HttpServletResponse response) throws IOException{
		return new ModelAndView("mypage/market_deli"); 
	}
	@RequestMapping("mypage/myboard_question") //내 질문보기
	public ModelAndView test6(HttpServletResponse response) throws IOException{
		return new ModelAndView("mypage/myboard_question"); 
	}
	
	@RequestMapping("mypage/myboard_answer") //내 답글
	public ModelAndView test7(HttpServletResponse response) throws IOException{
		return new ModelAndView("mypage/myboard_answer"); 
	}
	@RequestMapping("mypage/myboard_qna") //내 댓글보기
	public ModelAndView test8(HttpServletResponse response) throws IOException{
		return new ModelAndView("mypage/myboard_qna"); 
	}
	
	@RequestMapping("mypage/myboard_police") //신고현황보기
	public ModelAndView test9(HttpServletResponse response) throws IOException{
		return new ModelAndView("mypage/myboard_police"); 
	}
	@RequestMapping("mypage/myboard_care") //내 댓글보기
	public ModelAndView test10(HttpServletResponse response) throws IOException{
		return new ModelAndView("mypage/myboard_care"); 
	}
	
	@RequestMapping("mypage/sitter_money") //시터 월급보기(시터권한)
	public ModelAndView test11(HttpServletResponse response) throws IOException{
		return new ModelAndView("mypage/sitter_money"); 
	}
	
	@RequestMapping("mypage/sitter_info") //시터 정보보기(시터권한)
	public ModelAndView test12(HttpServletResponse response) throws IOException{
		return new ModelAndView("mypage/sitter_info"); 
	}
	
	
	
	
}
