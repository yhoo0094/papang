package co.company.papang.mypage.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import co.company.papang.impl.YrMapper;
import co.company.papang.vo.ChildVO;
import co.company.papang.vo.CommunityVO;
import co.company.papang.vo.Community_comVO;
import co.company.papang.vo.MemberVO;
import co.company.papang.vo.Od_detailVO;
import co.company.papang.vo.Order_infoVO;
import co.company.papang.vo.Pro_OdVO;
import co.company.papang.vo.ProductVO;
import co.company.papang.vo.ReportVO;
import co.company.papang.vo.SitChiVO;
import co.company.papang.vo.SitterVO;
import co.company.papang.vo.Sitter_revVO;


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
	public ModelAndView test22(HttpSession session,HttpServletResponse response,MemberVO memberVO,HttpServletRequest request) throws IOException{
		
		ModelAndView mav=new ModelAndView();

		System.out.println(memberVO);
		MultipartHttpServletRequest multipartRequest =
				(MultipartHttpServletRequest)request;
				//이미지파일
				MultipartFile multipartFile = multipartRequest.getFile("uploadFile");
				//첨부파일
				if(!multipartFile.isEmpty() && multipartFile.getSize()>0) {
					
					String path = request.getSession().getServletContext().getRealPath("/resources/images/sitterProfile");
					System.out.println("path="+path);
					
				multipartFile.transferTo(new File(path,multipartFile.getOriginalFilename()));
				memberVO.setMbr_pic(multipartFile.getOriginalFilename());
				}
		dao.updateMemberVO(memberVO);
		mav.setViewName("main/main");
		session.invalidate();
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
		session.invalidate();
		
		return new ModelAndView("main/main"); 
	}
	
	
	@RequestMapping("mypage/babyinfo") //아이관리
	public ModelAndView test3(HttpSession session,HttpServletRequest request,ChildVO childVO) throws IOException{
		
		ModelAndView mav=new ModelAndView();
		MemberVO vo = (MemberVO) session.getAttribute("user");
		String mbr_id = vo.getMbr_id();
		 
		childVO.setMbr_id(mbr_id);
		mav.addObject("cos5",dao.babyinfoChildVO(childVO));
		
		 
		
		
//		String[] exam = request.getParameterValues("user_CheckBox");
//		int size = exam.length;
//		
//		for(int i =0;i<size;i++) {
//			System.out.println("55555555555555");
//			System.out.println(exam[i]);
//			System.out.println("66666666666");
//		}
		
		
		
//		
//		String[] ajaxMsg = request.getParameterValues("valueArr");
//        int size = ajaxMsg.length;
//        for(int i=0; i<size; i++) {
//        	childVO.setCid_no(ajaxMsg[i])
//        	dao.babyinfodeleteChildVO(childVO)
        
        	
        	mav.setViewName("mypage/babyinfo");
		return mav;
	}

	@RequestMapping("mypage/babyinfodelete") //아이삭제
	public ModelAndView test34(HttpSession session,HttpServletRequest request,ChildVO childVO) throws IOException{
		
		
		String[] exam = request.getParameterValues("user_CheckBox");
		int size = exam.length;
		
		for(int i =0;i<size;i++) {
		System.out.println("55555555555555");
		System.out.println(exam[i]);
		childVO.setChi_no(exam[i]);
		dao.babyinfodeleteChildVO(childVO);
		System.out.println("66666666666");
	}
			
		
//		
//		String[] ajaxMsg = request.getParameterValues("valueArr");
//        int size = ajaxMsg.length;
//        for(int i=0; i<size; i++) {
//        	childVO.setCid_no(ajaxMsg[i])
//        	dao.babyinfodeleteChildVO(childVO)
        
		ModelAndView mav=new ModelAndView();
		MemberVO vo = (MemberVO) session.getAttribute("user");
		String mbr_id = vo.getMbr_id();
		 
		childVO.setMbr_id(mbr_id);
		mav.addObject("cos5",dao.babyinfoChildVO(childVO));
		mav.setViewName("mypage/babyinfo");
		return mav; 
	}
	
	@RequestMapping("mypage/babyinfoinsert") //아이등록
	public ModelAndView test35(HttpSession session,HttpServletRequest request,ChildVO childVO) throws IOException{
		
		ModelAndView mav=new ModelAndView();
		MemberVO vo = (MemberVO) session.getAttribute("user");
		String mbr_id = vo.getMbr_id();
		 
		childVO.setMbr_id(mbr_id);
		dao.babyinfoinsertChildVO(childVO);
		
		mav.addObject("cos5",dao.babyinfoChildVO(childVO));
		mav.setViewName("mypage/babyinfo");
		return mav; 
	}
	
	
//	@RequestMapping("mypage/market_buyinfo") //구매목록
//	public ModelAndView test4(HttpSession session,HttpServletRequest request,Order_infoVO order_infoVO,Od_detailVO od_detailVO) throws IOException{
//		ModelAndView mav=new ModelAndView();
//		MemberVO vo = (MemberVO) session.getAttribute("user");
//		
//		String no = request.getParameter("no");
//		System.out.println("나오나1"+no);
//		
//		String mbr_id = vo.getMbr_id(); 
//		
//		order_infoVO.setMbr_id(mbr_id);
//		
//		if(no==null) {
//				mav.addObject("cos6",dao.market_buyinfoOrder_infoVO(order_infoVO));
//				mav.setViewName("mypage/market_buyinfo");
//		return mav;
//		}
//		else {
//			mav.addObject("cos6",dao.market_buyinfoOrder_infoVO(order_infoVO));
//			mav.setViewName("mypage/market_buyinfo");
//			System.out.println("나오나2"+no);
//	        
//			
//			od_detailVO.setOrder_no(no);
//			
//			mav.addObject("cos7",dao.market_buyinfoOrder_info2VO(od_detailVO));
//			
//			mav.setViewName("mypage/market_buyinfo");
//			return mav;
//		}
//		
//	}
	
	@RequestMapping("mypage/market_buyinfo") //구매목록
	public ModelAndView test4(HttpSession session,HttpServletRequest request,Order_infoVO order_infoVO,Od_detailVO od_detailVO) throws IOException{
		ModelAndView mav=new ModelAndView();
		MemberVO vo = (MemberVO) session.getAttribute("user");
			
		String mbr_id = vo.getMbr_id(); 
		
		order_infoVO.setMbr_id(mbr_id);
				
		mav.addObject("cos6",dao.market_buyinfoOrder_infoVO(order_infoVO));
						
		mav.setViewName("mypage/market_buyinfo");
		return mav;
	}
	
	@RequestMapping("/mypage/market_buyinfomm") //구매목록2
	public ModelAndView test42(Order_infoVO order_infoVO,Pro_OdVO pro_odVO) throws IOException{
		ModelAndView mav=new ModelAndView();
		
		
		
		System.out.println("1111111111111");
		System.out.println(pro_odVO);
//		System.out.println(pro_odVO.getOrder_no());
//		pro_odVO.setOrder_no(pro_odVO.getOrder_no());
		mav.addObject("cos7",dao.market_buyinfoOrder_info2VO(pro_odVO));
		System.out.println("2222222222");
		mav.setViewName("no/mypage/aaa");
		return mav;
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
	public ModelAndView test9(HttpSession session,HttpServletResponse response,ReportVO reportVO) throws IOException{
		ModelAndView mav=new ModelAndView();
		MemberVO vo = (MemberVO) session.getAttribute("user");
		String mbr_id = vo.getMbr_id();
		reportVO.setMbr_id(mbr_id);
		mav.addObject("cos3",dao.myboard_policeReportVO(reportVO));
		mav.setViewName("mypage/myboard_police");
		return mav; 
	}
	@RequestMapping("mypage/myboard_care") //돌봄신청내역
	public ModelAndView test10(HttpServletResponse response) throws IOException{
		return new ModelAndView("mypage/myboard_care"); 
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
		@PostMapping("/mypage/sitterupdate") //정보변환
		public String userInsert(HttpServletRequest request,HttpSession session,HttpServletResponse response,SitterVO sitterVO,MemberVO memberVO) throws IllegalStateException, IOException {
			
			
			MemberVO vo = (MemberVO) session.getAttribute("user");
			String mbr_id = vo.getMbr_id();
			
			
			sitterVO.setSit_mbr_id(mbr_id);
//			@RequestMapping("mypage/babyinfodelete") //아이삭제
//			public ModelAndView test34(HttpSession session,HttpServletRequest request,ChildVO childVO) throws IOException{
//				
//				
//				String[] exam = request.getParameterValues("user_CheckBox");
//				int size = exam.length;
//				
//				for(int i =0;i<size;i++) {
//				System.out.println("55555555555555");
//				System.out.println(exam[i]);
//				childVO.setChi_no(exam[i]);
//				dao.babyinfodeleteChildVO(childVO);
//				System.out.println("66666666666");
//			}
			String[] exam = request.getParameterValues("array");
			int size = exam.length;
			String a ="";
			for(int i =0;i<size;i++) {
				
			
				System.out.println("나오냐냐냐냐");
				
				a = a+exam[i]+" ";
				System.out.println("나오냐냐냐냐");
				
			}
			System.out.println(a);
			MultipartHttpServletRequest multipartRequest =
					(MultipartHttpServletRequest)request;
					//이미지파일
					MultipartFile multipartFile = multipartRequest.getFile("uploadFile");
					//첨부파일
					if(!multipartFile.isEmpty() && multipartFile.getSize()>0) {
						 
						String path = request.getSession().getServletContext().getRealPath("/resources/images/sitterProfile");
						System.out.println("path="+path);
						
					multipartFile.transferTo(new File(path,multipartFile.getOriginalFilename()));
					sitterVO.setSit_pic(multipartFile.getOriginalFilename());
					}
					 
				      
				      sitterVO.setSit_off(a);
                     
					dao.updateSitterVO(sitterVO);
			return "main/main";
		}
	
	@RequestMapping("mypage/test") //시터 정보보기(시터권한)
	public ModelAndView test13(HttpServletResponse response) throws IOException{
		return new ModelAndView("mypage/test"); 
	}
	
	
	@RequestMapping("mypage/sitter_money") //예약정보보기
	public ModelAndView test136(HttpSession session,HttpServletResponse response,Sitter_revVO sitter_revVO,MemberVO memberVO) throws IOException{
		
		MemberVO vo = (MemberVO) session.getAttribute("user");
		String mbr_id = vo.getMbr_id();
		 
		
		sitter_revVO.setSit_mbr_id(mbr_id); 
		ModelAndView mav=new ModelAndView();
		mav.addObject("co",dao.getSitter_revVO(sitter_revVO));
		mav.setViewName("mypage/sitter_money");
		
	 return mav;
	} 
	
	@RequestMapping("/mypage/sitter_money2") //예약정보보기 디테일
	public ModelAndView test424(HttpServletRequest request,HttpSession session,SitChiVO sitChiVO,Sitter_revVO sitter_revVO,MemberVO memberVO) throws IOException{
		ModelAndView mav=new ModelAndView();

		MemberVO vo = (MemberVO) session.getAttribute("user");
		String mbr_id = vo.getMbr_id();
		String srv_no = request.getParameter("srv_no");
		System.out.println(srv_no);
//		System.out.println(pro_odVO.getOrder_no());
//		pro_odVO.setOrder_no(pro_odVO.getOrder_no());
		
		sitter_revVO.setSit_mbr_id(mbr_id); 
		sitter_revVO.setSrv_no(srv_no);
		mav.addObject("cos7",dao.getSitter_revVO2(sitChiVO));
		mav.addObject(dao.getSitter_revVO3(sitter_revVO));
		System.out.println("2222222222");
		mav.setViewName("no/mypage/bbb");
		return mav;
	}
	
	
	@RequestMapping("/mypage/sitter_money3") //예약정보보기 디테일
	public ModelAndView test422(HttpServletRequest request,HttpSession session,SitChiVO sitChiVO,Sitter_revVO sitter_revVO,MemberVO memberVO) throws IOException{
		ModelAndView mav=new ModelAndView();
		MemberVO vo = (MemberVO) session.getAttribute("user");
		String mbr_id = vo.getMbr_id();
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String year_month=year+"-"+month;
		
		sitter_revVO.setSit_mbr_id(mbr_id); 
		sitter_revVO.setSrv_status("결제완료"); 
		sitter_revVO.setSrv_date(year_month);
		
		mav.addObject("cos7",dao.getSitter_revVO4(sitter_revVO));
		mav.addObject(dao.getSitter_revVO5(sitter_revVO)); 
		System.out.println(dao.getSitter_revVO5(sitter_revVO));
		List<Sitter_revVO> a = dao.getSitter_revVO4(sitter_revVO);
		for(Sitter_revVO i : a) {
			System.out.println(i);
		}
		
		System.out.println(year);
		System.out.println(month);
	
		mav.setViewName("no/mypage/ccc");
		
	    
		return mav;
	}
	
	
	@RequestMapping("mypage/exam") //시터 정보보기(시터권한)
	public ModelAndView test132(HttpServletResponse response) throws IOException{
		return new ModelAndView("mypage/exam"); 
	}
}
