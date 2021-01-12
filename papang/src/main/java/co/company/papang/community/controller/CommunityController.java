package co.company.papang.community.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import co.company.papang.community.service.CommunityService;
import co.company.papang.vo.CommunityVO;
import co.company.papang.vo.Community_comVO;
import co.company.papang.vo.MemberVO;
import co.company.papang.vo.NqVO;

@Controller
public class CommunityController {
	@Autowired
	CommunityService service;

	/*-------------------------- 커뮤니티 --------------------------*/
	@RequestMapping("/community/board") // 커뮤니티 게시판 보기
	public ModelAndView communityBoard(CommunityVO communityVO, ModelAndView mav) {
		// = new ModelAndView();
		mav.addObject("NqVOList", service.getNoticeList());
		mav.addObject("CommunityVOList", service.getCommunityList(communityVO));
		mav.setViewName("community/communityBoard");
		return mav; // jsp주소
	}

	@RequestMapping("/community/form") // 커뮤니티 글쓰러 가기
	public String communityForm(Model model, HttpServletRequest request, HttpServletResponse response,
			CommunityVO communityVO, Community_comVO community_comVO, @CookieValue(required = false) String communuity) {
		if (communityVO.getCom_no() != null) {
			// 조회수 작업
			// 쿠키생성
			String commnunityCookieVal = communuity==null?"":communuity;
			if(communuity == null || communuity.indexOf(communityVO.getCom_no() + "A") == -1) { //쿠키 자체가 없을 떄/ 쿠키 안에 값이 없을 때
				commnunityCookieVal = commnunityCookieVal + communityVO.getCom_no() + "A";
				service.hitPlus(communityVO);
				Cookie cookie = new Cookie("communuity", commnunityCookieVal);
				cookie.setMaxAge(60 * 60 * 24);
				response.addCookie(cookie);
			}
			// 조회수 작업 끝
			model.addAttribute("communityVO", service.getCommunity(communityVO));
			model.addAttribute("community_comVOList", service.getCommunityComList(community_comVO));
		}
		return "community/communityForm"; // jsp주소
	}

	@RequestMapping("/community/noticeForm") // 공지사항 보기 가기
	public String noticeForm(Model model, HttpServletRequest request, HttpServletResponse response, NqVO nqVO, @CookieValue(required = false) String notice) {
		// 조회수 작업
		// 쿠키생성
		String commnunityCookieVal = notice==null?"":notice;
		if(notice == null || notice.indexOf(nqVO.getNq_no() + "A") == -1) { //쿠키 자체가 없을 떄/ 쿠키 안에 값이 없을 때
			commnunityCookieVal = commnunityCookieVal + nqVO.getNq_no() + "A";
			service.noticeHitPlus(nqVO);
			Cookie cookie = new Cookie("notice", commnunityCookieVal);
			cookie.setMaxAge(60 * 60 * 24);
			response.addCookie(cookie);
		}
		// 조회수 작업 끝
		model.addAttribute("nqVO", service.getNotice(nqVO));
		return "community/noticeView"; // jsp주소
	}

	@RequestMapping("/community/formInsert") // 커뮤니티 글 인서트
	public String communityFormInsert(CommunityVO communityVO, Errors errors, HttpServletRequest request,
			HttpSession session) {
		MemberVO memberVO = (MemberVO) session.getAttribute("user");
		String mbr_id = memberVO.getMbr_id();
		communityVO.setMbr_id(mbr_id);
		service.communityFormInsert(communityVO);
		return "redirect:/community/board"; // jsp주소
	}

	@RequestMapping("/community/update") // 커뮤니티 글 업데이트
	public String communityUpdate(CommunityVO communityVO) {
		service.communityFormUpdate(communityVO);
		return "redirect:/community/board"; // jsp주소
	}

	@RequestMapping("/community/delete") // 커뮤니티 글 삭제
	public String communityDelete(CommunityVO communityVO) {
		service.communityFormDelete(communityVO);
		return "redirect:/community/board"; // jsp주소
	}

	// 파일다운
	@RequestMapping("/community/filedown")
	public void filedown(HttpServletResponse response, HttpServletRequest request, @RequestParam String uFile) // 파라미터로 파일이름(uFile) 받기. 값이 여러개라면 Map으로 묶으면 됨
			throws IOException {
		response.setContentType("application/octet-stream;charset=UTF-8");
		// 파일 이름 uFile에 인코딩해주기(너무길어서 따로 뺌)
		String fn = URLEncoder.encode(uFile, "utf-8");
		response.setHeader("Content-Disposition", "attachment;filename=\"" + fn + "\"");
		// ContentType이 jsp에서는 그냥 text/html 였는데, 응답으로 보낼때는 다운로드라고 해줘야함
		BufferedInputStream in = null;
		BufferedOutputStream out = null;
		try {
			String path = request.getSession().getServletContext().getRealPath("resources/images/nqfile");
			in = new BufferedInputStream(new FileInputStream(path + "/" + uFile));
			// 이때 path는 파일 업로드한 경로라서, 다운받을 파일이랑 +로 같이써줘야함
			out = new BufferedOutputStream(response.getOutputStream());
			// response로 아웃풋 스트림보내면 그게 파일다운받기임
			FileCopyUtils.copy(in, out);
			out.flush();
		} catch (IOException ex) {
		} finally {
			in.close();
			response.getOutputStream().flush();
			response.getOutputStream().close();
		}
	}

	/*-------------------------- 기타 --------------------------*/
	@RequestMapping(value = "/normalBoard")
	public String normalBoard() {
		return "normal/normalBoard";
	}

	@RequestMapping(value = "/normalBoard2")
	public String normalBoard2() {
		return "normal/normalBoard2";
	}

	@RequestMapping(value = "/calender")
	public String calender() {
		return "normal/calender";
	}

}
