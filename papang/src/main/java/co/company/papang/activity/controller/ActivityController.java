package co.company.papang.activity.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import co.company.papang.activity.service.ActivityService;
import co.company.papang.vo.Act_comVO;
import co.company.papang.vo.CookVO;
import co.company.papang.vo.MemberVO;
import co.company.papang.vo.PlayVO;

@Controller
public class ActivityController {
	@Autowired
	ActivityService service;

	// ###################################요리###################################
	// 1.요리 리스트 전제 조회
	@RequestMapping("activity/cookList")
	public ModelAndView cookList(HttpServletResponse response, CookVO cookVO,Act_comVO act_comVO) throws IOException {
		ModelAndView mvc = new ModelAndView();
		System.out.println("==================");
		System.out.println(service.getCookList(cookVO));
		mvc.addObject("cookList", service.getCookList(cookVO));
		mvc.setViewName("activity/cookList");
		return mvc;
	}

	// 요리 글 등록
	@PostMapping("activity/insertCook")
	public String insertCook(Model model, CookVO cookVO) {
		service.insertCook(cookVO);
		return "redirect:cookList";
	}

	
	@RequestMapping("activity/cookForm")
	public ModelAndView cookForm(HttpServletResponse response) throws IOException {
		return new ModelAndView("activity/cookForm");
	}
	
	@RequestMapping("activity/cookDelete")//요리 글 삭제
	public String deleteCook(HttpServletResponse response, HttpServletRequest request, CookVO cookVO,Act_comVO act_comVO) {
		service.deleteCook(cookVO);
		service.deleteCookAcCom(act_comVO);
		return "redirect:cookList";
	}
	// 요리 글 단건조회
	@RequestMapping("activity/cookView")
	public ModelAndView cookView(HttpServletResponse response, HttpServletRequest request, CookVO cookVO,
			Act_comVO act_comVO,@CookieValue(required = false) String cook) throws IOException {
		// 조회수 작업
					// 쿠키생성
					String cookCookieVal = cook==null?"":cook;
					if(cook == null || cook.indexOf(cookVO.getCook_no() + "A") == -1) { //쿠키 자체가 없을 떄/ 쿠키 안에 값이 없을 때
						cookCookieVal = cookCookieVal + cookVO.getCook_no() + "A";
						service.cookhitPlus(cookVO);
						Cookie cookie = new Cookie("cook", cookCookieVal);
						cookie.setMaxAge(60 * 60 * 24);
						response.addCookie(cookie);
					}
					// 조회수 작업 끝
		 
		ModelAndView mav = new ModelAndView();
		mav.addObject(service.getCook(cookVO));
		act_comVO.setPc_no(cookVO.getCook_no());
		mav.addObject("acrate", service.getStar(act_comVO));
		List<Act_comVO> actcommList = service.getCActComm(act_comVO);
		int chk = 0; //리스트에 값이 있다
		if(actcommList.size()==0) {
			chk = 1; //리스트에 값이 없다
		}
		mav.addObject("chk", chk);
		mav.addObject("actcommList", actcommList);
		mav.setViewName("activity/cookView");
		/* System.out.println(service.getCook(cookVO)); */
		return mav;
	}

	//요리글 삭제
	@RequestMapping("activity/deleteCook")
	public String deletePaly(HttpServletResponse response, Model model, HttpSession session, CookVO cookVO,
			MemberVO memberVO, Act_comVO act_comVO) {
		service.deleteCook(cookVO);
		service.deleteCookAcCom(act_comVO);
		return "redirect:cookList";
	}
	
	//요리 글 수정폼 불러오기
	@RequestMapping("activity/updateCook")
	public ModelAndView updateCook(HttpServletResponse response, CookVO cookVO) {
		ModelAndView mav = new ModelAndView();
		mav.addObject(service.getCook(cookVO));
		mav.setViewName("activity/cookForm");
		return mav;
	}
	
	
	//요리 글 수정폼 불러오기
	@RequestMapping("activity/updateSuccessCook")
	public ModelAndView updateSuccessCook(HttpServletResponse response, CookVO cookVO) {
		ModelAndView mav = new ModelAndView();
		mav.addObject(service.updateCook(cookVO));
		mav.setViewName("activity/cookView");
		return mav;
	}
	
	
	// ###################################요리 후기 ###################################
	// 요리 후기등록
	@RequestMapping(value = "/cacInsert", method = RequestMethod.POST)
	@ResponseBody
	public Act_comVO insertCookActComm(Act_comVO vo, Model model, HttpServletResponse response,
			HttpServletRequest request) throws IllegalStateException, IOException {
		// 파일업로드
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		MultipartFile multipartFile = multipartRequest.getFile("uploadFile");
		if (!multipartFile.isEmpty() && multipartFile.getSize() > 0) {
			String path = request.getSession().getServletContext().getRealPath("/images/actCom");
			System.out.println("path=" + path);
			multipartFile.transferTo(new File(path, multipartFile.getOriginalFilename()));

			vo.setAc_pic(multipartFile.getOriginalFilename());
		}

		System.out.println("==============");
		System.out.println(service.insertCookActComm(vo));
		return vo;
	}

	@RequestMapping("activity/test")
	public ModelAndView test(HttpServletResponse response) throws IOException {
		return new ModelAndView("activity/test");
	}

	// ###################################놀이###################################
	// 1. 놀이 리스트 전체 조회/ 놀이 리스트 검색
	@RequestMapping("activity/playList")
	public ModelAndView playList(HttpServletResponse response, PlayVO playVO, MemberVO memberVO) throws IOException {
		ModelAndView mav = new ModelAndView();
		// System.out.println(memberVO.getMbr_id());
		// System.out.println(service.getPlayList(playVO));
		mav.addObject("playlist", service.getPlayList(playVO));
		mav.setViewName("activity/playList");
		return mav;
	}

	// 놀이 단건 조회
	@RequestMapping("activity/playView")
	public ModelAndView playView(HttpServletResponse response, HttpServletRequest request, PlayVO playVO,
			Act_comVO act_comVO) throws IOException {
		// 조회수 작업
		boolean existCookie = false;
		Cookie[] cookieList = request.getCookies();
		for (Cookie co : cookieList) {
			if (co.getValue().equals(playVO.getPlay_no())) {
				existCookie = true;
			}
		}
		// 쿠키생성
		if (!existCookie) {
			// 쿠키가 없는 경우
			System.out.println("쿠키생성");
			Cookie cookie = new Cookie("cookieCode", playVO.getPlay_no());
			cookie.setMaxAge(60 * 60 * 24);
			response.addCookie(cookie);
			service.hitPlus(playVO);
		}
		// 조회수 작업 끝
		ModelAndView mav = new ModelAndView();
		mav.addObject(service.getPlay(playVO));
		act_comVO.setPc_no(playVO.getPlay_no());
		
		List<Act_comVO> actcommList = service.getActComm(act_comVO);
		
		int chk = 0; //리스트에 값이 있다
		if(actcommList.size()==0) {
			chk = 1; //리스트에 값이 없다
		}
		mav.addObject("chk", chk);
		
		mav.addObject("actcommList", actcommList); // 놀이 후기 조회
		mav.addObject("acrate", service.getStar(act_comVO));
		mav.setViewName("activity/playView");
		return mav;
	}

	// 놀이 리스트 글 등록폼 가기
	@RequestMapping("activity/playForm")
	public ModelAndView playForm(HttpServletResponse response, HttpSession session, MemberVO member)
			throws IOException {
		return new ModelAndView("activity/playForm");
	}

	// 놀이 글 등록
	@PostMapping("activity/insertPlay")
	public String insertPlay(Model model, PlayVO playVO) {
		service.insertPlay(playVO);
		return "redirect:playList";
	}

	// 놀이 글 삭제
	@RequestMapping("activity/deletePlay")
	public String deletePaly(HttpServletResponse response, Model model, HttpSession session, PlayVO playVO,
			MemberVO memberVO, Act_comVO act_comVO) {
		service.deletePaly(playVO);
		service.deletePlayAct(act_comVO);
		return "redirect:playList";
	}

	// 놀이글 수정폼 데이터 불러오기
	@GetMapping("activity/updatePlay")
	public ModelAndView getupdatePlay(HttpServletResponse response, Model model, PlayVO playVO) {
		ModelAndView mav = new ModelAndView();
		mav.addObject(service.getPlay(playVO));
		mav.setViewName("activity/playForm");
		return mav;
	}

	// 놀이 글 수정하기
	@PostMapping("activity/updateSuccess")
	public String updatePaly(HttpServletResponse response, Model model, HttpSession session, PlayVO playVO,
			MemberVO memberVO, Act_comVO act_comVO) {
		service.updatePlay(playVO);
		model.addAttribute("playlist", service.getPlayList(playVO));
		return "activity/playList";
	}

	// ###################################놀이 후기 ###################################
	// 놀이 후기등록
	@RequestMapping(value = "/acInsert", method = RequestMethod.POST)
	@ResponseBody
	public Act_comVO insertAC(Act_comVO vo, Model model, HttpServletResponse response, HttpServletRequest request)
			throws IllegalStateException, IOException {
		// 파일업로드
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		MultipartFile multipartFile = multipartRequest.getFile("uploadFile");
		if (!multipartFile.isEmpty() && multipartFile.getSize() > 0) {
			String path = request.getSession().getServletContext().getRealPath("/images/actCom");
			System.out.println("path=" + path);
			multipartFile.transferTo(new File(path, multipartFile.getOriginalFilename()));

			vo.setAc_pic(multipartFile.getOriginalFilename());
		}
		service.insertActComm(vo);
		return vo;
	}

	@RequestMapping("activity/actComList")
	public ModelAndView actttest(HttpServletResponse response,Act_comVO act_comVO) throws IOException {
		ModelAndView mav = new ModelAndView();
		mav.addObject("actList",service.getActList(act_comVO));
		mav.setViewName("activity/actComList");
		return mav;
	}

	
	@RequestMapping("activity/playtest")
	public ModelAndView playtest(HttpServletResponse response) throws IOException {
		return new ModelAndView("activity/test");
	}

}
