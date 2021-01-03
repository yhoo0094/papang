package co.company.papang.mypage.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;


import co.company.papang.impl.YrMapper;
import co.company.papang.vo.CommunityVO;
import co.company.papang.vo.Community_comVO;
import co.company.papang.vo.MemberVO;
import co.company.papang.vo.SitterVO;


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
	public ModelAndView test7(HttpSession session,HttpServletResponse response,Community_comVO community_comVO) throws IOException{
		System.out.println("===================2");
		ModelAndView mav=new ModelAndView();
		MemberVO vo = (MemberVO) session.getAttribute("user");
		String mbr_id = vo.getMbr_id();
		System.out.println("===================2");
		community_comVO.setMbr_id(mbr_id);
		mav.addObject("cos2",dao.myboard_answerCommunity_comVO(community_comVO));
		System.out.println(community_comVO);
		System.out.println("===================2");
		mav.setViewName("mypage/myboard_answer");
		return mav;
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
	public ModelAndView test12(HttpSession session,HttpServletResponse response,SitterVO  sitterVo,MemberVO memberVO) throws IOException{
		
		ModelAndView mav=new ModelAndView();
		
		
		MemberVO vo = (MemberVO) session.getAttribute("user");
		String mbr_id = vo.getMbr_id();
		
		
		sitterVo.setSit_mbr_id(mbr_id);
		memberVO.setMbr_id(mbr_id);
		
		
	
		
		mav.addObject(dao.sitter_infoSitterVO(sitterVo));
		mav.addObject(dao.getMemberVO(memberVO));
		System.out.println(sitterVo.getSit_payday()); 
		
		mav.setViewName("mypage/sitter_info");
		
		
		return mav; 
		
		
	}
//	@RequestMapping("mypage/sitterupdate") //회원정보수정 (마이페이지 메인홈)
//	public ModelAndView test23(HttpSession session,HttpServletResponse response,SitterVO sitterVO,MemberVO memberVO) throws IOException{
//		
//		MemberVO vo = (MemberVO) session.getAttribute("user");
//		String mbr_id = vo.getMbr_id();
//		
//		
//		sitterVO.setSit_mbr_id(mbr_id);
//		
//		dao.updateSitterVO(sitterVO);
//		
//		return new ModelAndView("main/main"); 
//	}
	
	//등록처리
		@PostMapping("/mypage/sitterupdate")
		public String userInsert(HttpServletRequest request,HttpSession session,HttpServletResponse response,SitterVO sitterVO,MemberVO memberVO) throws IllegalStateException, IOException {
			
			MemberVO vo = (MemberVO) session.getAttribute("user");
			String mbr_id = vo.getMbr_id();
			
			
			sitterVO.setSit_mbr_id(mbr_id);
			
			MultipartHttpServletRequest multipartRequest =
					(MultipartHttpServletRequest)request;
					//이미지파일
					MultipartFile multipartFile = multipartRequest.getFile("uploadFile");
					//첨부파일
					if(!multipartFile.isEmpty() && multipartFile.getSize()>0) {
						
						String path = request.getSession().getServletContext().getRealPath("/resources/images/active/");
						System.out.println("path="+path);
						
					multipartFile.transferTo(new File(path,multipartFile.getOriginalFilename()));
					sitterVO.setSit_pic(multipartFile.getOriginalFilename());
					}
					
					dao.updateSitterVO(sitterVO);
			return "main/main";
		}
	
	@RequestMapping("mypage/test") //시터 정보보기(시터권한)
	public ModelAndView test13(HttpServletResponse response) throws IOException{
		return new ModelAndView("mypage/test"); 
	}
	
	
}
