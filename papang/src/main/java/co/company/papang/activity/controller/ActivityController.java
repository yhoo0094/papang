package co.company.papang.activity.controller;

import java.io.File;
import java.io.IOException;
import java.util.Collections;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import co.company.papang.activity.service.ActivityService;
import co.company.papang.vo.Act_comVO;
import co.company.papang.vo.MemberVO;
import co.company.papang.vo.PlayVO;

@Controller
public class ActivityController {
	@Autowired ActivityService service;
	
	@RequestMapping("activity/cookList") 
	public ModelAndView cookList(HttpServletResponse response) throws IOException{
		return new ModelAndView("activity/cookList"); 
	}
	
	@RequestMapping("activity/cookForm")
	public ModelAndView cookForm(HttpServletResponse response) throws IOException{
		return new ModelAndView("activity/cookForm"); 
	}
	
	@RequestMapping("activity/cookView") 
	public ModelAndView cookView(HttpServletResponse response) throws IOException{
		return new ModelAndView("activity/cookView"); 
	}
	
	@RequestMapping("activity/test") 
	public ModelAndView test(HttpServletResponse response) throws IOException{
		return new ModelAndView("activity/test"); 
	}
	
	
	//놀이
	//1. 놀이 리스트 전체 조회/ 놀이 리스트 검색
	@RequestMapping("activity/playList") 
	public ModelAndView playList(HttpServletResponse response,PlayVO playVO,MemberVO memberVO,HttpSession session) throws IOException{
		ModelAndView mav = new ModelAndView();
		System.out.println("----");
		//memberVO =(MemberVO)session.getAttribute("user");
		//mav.addObject("member",service.getMember(memberVO));
		System.out.println(memberVO.getMbr_id());
		mav.addObject("playlist",service.getPlayList(playVO));
		mav.setViewName("activity/playList");
		return mav; 
	}
	
	
	//놀이 단건 조회
	@RequestMapping("activity/playView") 
	public ModelAndView playView(HttpServletResponse response,HttpServletRequest request,PlayVO playVO,Act_comVO act_comVO) throws IOException{
		//조회수 작업
		boolean existCookie = false;
		Cookie[] cookieList = request.getCookies();
		for(Cookie co : cookieList) {
			if(co.getValue().equals(playVO.getPlay_no())) {
				existCookie = true;
			}
		}
		//쿠키생성
		if(!existCookie) {
			//쿠키가 없는 경우
			System.out.println("쿠키생성");
			Cookie cookie = new Cookie("cookieCode", playVO.getPlay_no());
			cookie.setMaxAge(60*60*24);
			response.addCookie(cookie);
			service.hitPlus(playVO);
		}
		//조회수 작업 끝
		ModelAndView mav = new ModelAndView();
		mav.addObject(service.getPlay(playVO));
		act_comVO.setPc_no(playVO.getPlay_no());
		mav.addObject("actcommList", service.getActComm(act_comVO)); 
		mav.addObject("acrate",service.getStar(act_comVO));
		mav.setViewName("activity/playView");
		return mav;
	}
	
	//놀이 리스트 글 등록폼 가기
	@RequestMapping("activity/playForm") 
	public ModelAndView playForm(HttpServletResponse response, HttpSession session,MemberVO member) throws IOException{
	
		return new ModelAndView("activity/playForm"); 
	}
	
	
   //놀이 글 등록
	//사원등록
		@PostMapping("activity/insertPlay")
		public String insertPlay(Model model, PlayVO playVO) {
			service.insertPlay(playVO);
			return  "redirect:playList";
		}
	
		
	//놀이 후기등록
	//등록처리
	@RequestMapping(value = "/acInsert", method = RequestMethod.POST)
	@ResponseBody
			public Act_comVO insertAC(Act_comVO vo, Model model, HttpServletResponse response, HttpServletRequest request)
					throws IllegalStateException, IOException {
		       //파일업로드
				MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
				MultipartFile multipartFile = multipartRequest.getFile("uploadFile");
				if (!multipartFile.isEmpty() && multipartFile.getSize() > 0) {
					String path = request.getSession().getServletContext().getRealPath("/images/actCom");
					System.out.println("path=" + path);
					multipartFile.transferTo(new File(path, multipartFile.getOriginalFilename())); 
																									
					vo.setAc_pic(multipartFile.getOriginalFilename());
				}
				
				service.insertActComm(vo);
				// return Collections.singletonMap("result", true);
				return vo;
			}
		
	
	
	@RequestMapping("activity/playtest") 
	public ModelAndView playtest(HttpServletResponse response) throws IOException{
		return new ModelAndView("activity/test");
	}

	
}
