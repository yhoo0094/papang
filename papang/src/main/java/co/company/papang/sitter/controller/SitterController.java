package co.company.papang.sitter.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import co.company.papang.sitter.service.SitterService;
import co.company.papang.vo.ChildVO;
import co.company.papang.vo.MemberVO;
import co.company.papang.vo.SitterVOChk;
import co.company.papang.vo.Sitter_revVO;

@Controller
public class SitterController {
	@Autowired SitterService service;
	
	/*-------------------------- 시터 --------------------------*/
	@RequestMapping("/sitter/board") //시터 보드 가기
	public String sitterBoard(Model model, SitterVOChk sitterVOChk) {
		if(sitterVOChk.getOff_days() != null) {
			String off_days =  sitterVOChk.getOff_days().replace(',', '|');
			sitterVOChk.setOff_days(off_days);
			System.out.println(sitterVOChk.getOff_days());
		}
		model.addAttribute("sitterVOChkList",service.getSitterList(sitterVOChk));
		return "sitter/sitterBoard"; //jsp주소
	}
	
	@RequestMapping("/sitter/form") //시터 폼 보기
	public String sitterForm(Model model, SitterVOChk sitterVOChk, ChildVO childVO, HttpSession session) {
		model.addAttribute("sitterVOChk",service.getSitter(sitterVOChk));
		MemberVO memberVO = (MemberVO) session.getAttribute("user");
		childVO.setMbr_id(memberVO.getMbr_id());
		model.addAttribute("childVOList",service.getChildList(childVO));
		return "sitter/sitterForm"; //jsp주소
	}
	
	@RequestMapping("/sitter/reservation") //시터 서비스 예약하기
	public String sitterReservation(Sitter_revVO sitter_revVO, @RequestParam("reservationDays") String reservationDays, HttpSession session) {
		String[] reservationArray = reservationDays.split(" ");
		MemberVO memberVO = (MemberVO) session.getAttribute("user");
		String mbr_id = memberVO.getMbr_id();
		sitter_revVO.setMbr_id(mbr_id);
		for(String reservation : reservationArray) {
			sitter_revVO.setSrv_date(reservation);
			service.insertReservation(sitter_revVO);
			System.out.println(sitter_revVO);
		}
		return "redirect:/sitter/reservationView"; //jsp주소
	}
	
	@RequestMapping("/sitter/scheduleView") //시터 스케쥴 보기
	public String sitterScheduleView() {
		return "sitter/sitterScheduleView"; //jsp주소
	}
	
	@RequestMapping("/sitter/reservationView") //예약정보 보기
	public String reservationView() {
		return "sitter/reservationView"; //jsp주소
	}
	
	@RequestMapping("/sitter/menu") //시터 사이드 메뉴
	public String sitterMenu() {
		return "layout/sitterMenu"; //jsp주소
	}
}
