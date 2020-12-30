package co.company.papang.mypage.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


import co.company.papang.impl.YrMapper;
import co.company.papang.vo.CommunityVO;
import co.company.papang.vo.MemberVO;

@Controller
public class MypageController {
	
	@Autowired 
	YrMapper dao;
	
	@RequestMapping("mypage/myhome") //회원정보수정 (마이페이지 메인홈)
	public ModelAndView test(HttpSession session,HttpServletResponse response,MemberVO memberVO) throws IOException{
		
		ModelAndView mav=new ModelAndView();
		
		System.out.println("===================");
		MemberVO vo = (MemberVO) session.getAttribute("user");
		String mbr_id = vo.getMbr_id();
		System.out.println("===================");
		
		
		System.out.println(mbr_id);
		memberVO.setMbr_id(mbr_id);
		System.out.println(memberVO);
	

		mav.addObject(dao.getMemberVO(memberVO));
		mav.setViewName("mypage/myhome");
		return mav; 
	}
	@RequestMapping("mypage/update") //회원정보수정 (마이페이지 메인홈)
	public ModelAndView test22(HttpServletResponse response,MemberVO memberVO) throws IOException{
		
		ModelAndView mav=new ModelAndView();

		System.out.println(memberVO);
	
		dao.updateMemberVO(memberVO);
		mav.setViewName("mypage/myhome");
		return mav; 
	}
	
	
	
	@RequestMapping("mypage/notjoin") //회원탈퇴
	public ModelAndView test2(HttpSession session,HttpServletResponse response,MemberVO memberVO) throws IOException{
		ModelAndView mav=new ModelAndView();
		
		MemberVO vo = (MemberVO) session.getAttribute("user");
		String mbr_id = vo.getMbr_id();
		memberVO.setMbr_id(mbr_id);
		
	

		mav.addObject(dao.getMemberVO(memberVO));
		mav.setViewName("mypage/notjoin");
		return mav; 
	}
	
	@RequestMapping("mypage/notjoin2") 
	public ModelAndView test23(HttpSession session,HttpServletResponse response,MemberVO memberVO) throws IOException{
		
		MemberVO vo = (MemberVO) session.getAttribute("user");
		String mbr_id = vo.getMbr_id();
		System.out.println(memberVO);
		//href="${pageContext.request.contextPath} 
		//dao.notjoinMemberVO(memberVO);
		//mav.setViewName();
		memberVO.setMbr_id(mbr_id);
		memberVO.setMbr_status("탈퇴");
		dao.notjoinMemberVO(memberVO);
		
		return new ModelAndView("main/main"); 
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
	public ModelAndView test6(HttpSession session,HttpServletResponse response,CommunityVO communityVO) throws IOException{
		ModelAndView mav=new ModelAndView();
		MemberVO vo = (MemberVO) session.getAttribute("user");
		String mbr_id = vo.getMbr_id();
		
		communityVO.setMbr_id(mbr_id);
		mav.addObject("cos",dao.myboard_questionCommunityVO(communityVO));
		//System.out.println(communityVO);
		mav.setViewName("mypage/myboard_question");
		return mav;
	}
	
	@RequestMapping("mypage/myboard_answer") //내 댓글보기
	public ModelAndView test7(HttpServletResponse response) throws IOException{
		
		return new ModelAndView("mypage/myboard_answer"); 
	}
	@RequestMapping("mypage/myboard_qna") //질문??
	public ModelAndView test8(HttpServletResponse response) throws IOException{
		return new ModelAndView("mypage/myboard_qna"); 
	}
	
	@RequestMapping("mypage/myboard_police") //신고현황보기
	public ModelAndView test9(HttpServletResponse response) throws IOException{
		return new ModelAndView("mypage/myboard_police"); 
	}
	@RequestMapping("mypage/myboard_care") //돌봄신청내역
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
	
	
	@RequestMapping("mypage/test") //시터 정보보기(시터권한)
	public ModelAndView test13(HttpServletResponse response) throws IOException{
		return new ModelAndView("mypage/test"); 
	}
	
	
}
