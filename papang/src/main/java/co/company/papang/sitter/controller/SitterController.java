package co.company.papang.sitter.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.company.papang.sitter.service.SitterService;
import co.company.papang.vo.ChildVO;
import co.company.papang.vo.MemberVO;
import co.company.papang.vo.SitterVOChk;
import co.company.papang.vo.Sitter_comVO;
import co.company.papang.vo.Sitter_revChkVO;
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
		}
		model.addAttribute("sitterVOChkList",service.getSitterList(sitterVOChk));
		return "sitter/sitterBoard"; //jsp주소
	}
	
	@RequestMapping("/sitter/form") //시터 폼 보기
	public String sitterForm(Model model, SitterVOChk sitterVOChk, ChildVO childVO, HttpSession session, Sitter_revChkVO sitter_revChkVO) {
		//별점구하기
		sitterVOChk = service.getSitter(sitterVOChk);
		if(sitterVOChk.getRate() != null) {
			int rateInt = Integer.parseInt(sitterVOChk.getRate());
			String rate = "";
			for(int i =0; i < rateInt; i++) {
				rate = rate + "★";
			}
			sitterVOChk.setRate(rate);
		}
		model.addAttribute("sitterVOChk",sitterVOChk);
		
		if(session.getAttribute("user") != null) { //아이 리스트 뽑기
			MemberVO memberVO = (MemberVO) session.getAttribute("user");
			childVO.setMbr_id(memberVO.getMbr_id());
			model.addAttribute("childVOList",service.getChildList(childVO));
		}
		
		model.addAttribute("sitter_revChkVOList",service.getReviewList(sitter_revChkVO));
		
		return "sitter/sitterForm"; //jsp주소
	}
	
	@RequestMapping("/sitter/reservation") //시터 서비스 예약하기
	public String sitterReservation(Sitter_revVO sitter_revVO, @RequestParam("reservationDays") String reservationDays, HttpSession session) {
		//mbr_id
		MemberVO memberVO = (MemberVO) session.getAttribute("user");
		String mbr_id = memberVO.getMbr_id();
		sitter_revVO.setMbr_id(mbr_id);
		
		//srv_no
		String srv_no = service.selectReservationKey();
		sitter_revVO.setSrv_no(srv_no);
		
		//예약 인서트
		String[] reservationArray = reservationDays.split(" ");
		for(String reservation : reservationArray) {
			sitter_revVO.setSrv_date(reservation);
			service.insertReservation(sitter_revVO);
		}
		return "redirect:/sitter/reservationView"; //jsp주소
	}
	
	@RequestMapping("/ajax/getBabyInfo")//예약한 아기 정보 가져오기(아작스)
	@ResponseBody
	public ChildVO ajaxReservatedSchedual(ChildVO childVO) {
		childVO = service.getBaby(childVO);
		childVO.setChi_birth(childVO.getChi_birth().substring(0,11));
		return childVO;
	}
	
	@RequestMapping("/ajax/getSitter")//시터정보 가져오기(아작스)
	@ResponseBody
	public SitterVOChk ajaxGetSitter(SitterVOChk sitterVOChk) {
		//별점구하기
		sitterVOChk = service.getSitter(sitterVOChk);
		String rate = "";
		if(sitterVOChk.getRate() != null) {
			int rateInt = Integer.parseInt(sitterVOChk.getRate());
			for(int i =0; i < rateInt; i++) {
				rate = rate + "★";
			}
		} else {
			rate = "평점 정보가 없습니다.";
		}
		sitterVOChk.setRate(rate);
		return sitterVOChk; //jsp주소
	}
	
	@RequestMapping("/ajax/reservatedDays")//예약된 날짜 데이터 가져오기(유저용)
	@ResponseBody
	public List<Sitter_revChkVO> reservatedDays(Sitter_revChkVO sitter_revChkVO, @RequestParam("calenderY") String calenderY, @RequestParam("calenderM") String calenderM, HttpSession session) {
		
		//날짜 범위 집어넣기
		List<Sitter_revChkVO> reservatedDayList = new ArrayList<Sitter_revChkVO>();
		Calendar cal = Calendar.getInstance();
        DateFormat df = new SimpleDateFormat("yy/MM/dd");
        Date date = null;
        String start_date = null; //범위 시작
        String end_date = null; //범위 끝
        String standardDate = calenderY + "/" + calenderM + "/" + "1";//기준날짜
        try {
            date = df.parse(standardDate);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        cal.setTime(date);
        cal.add(Calendar.DATE, -8);//이번달 -8일
        start_date = df.format(cal.getTime());
        cal.add(Calendar.DATE, 15);//기준 날짜 + 8
		cal.add(Calendar.MONTH, 1);//다음달 1일
		end_date = df.format(cal.getTime());
		sitter_revChkVO.setStart_date(start_date);
        sitter_revChkVO.setEnd_date(end_date);
        List<Sitter_revChkVO> sitter_revChkVOList = service.getReservationList(sitter_revChkVO);
		for(Sitter_revChkVO temp : sitter_revChkVOList) {
			reservatedDayList.add(temp);
		}
		return reservatedDayList;
	}
	
	@RequestMapping("/ajax/reservatedSchedual")//예약된 날짜 데이터 가져오기(시터용)
	@ResponseBody
	public List<Sitter_revChkVO> reservatedSchedual(Sitter_revChkVO sitter_revChkVO, @RequestParam("calenderY") String calenderY, @RequestParam("calenderM") String calenderM, HttpSession session) {
		//mbr_id
		MemberVO memberVO = (MemberVO) session.getAttribute("user");
		String mbr_id = memberVO.getMbr_id();
		sitter_revChkVO.setSit_mbr_id(mbr_id);
		
		//날짜 범위 집어넣기
		List<Sitter_revChkVO> reservatedDayList = new ArrayList<Sitter_revChkVO>();
		Calendar cal = Calendar.getInstance();
        DateFormat df = new SimpleDateFormat("yy/MM/dd");
        Date date = null;
        String start_date = null; //범위 시작
        String end_date = null; //범위 끝
        String standardDate = calenderY + "/" + calenderM + "/" + "1";//기준날짜
        try {
            date = df.parse(standardDate);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        cal.setTime(date);
        cal.add(Calendar.DATE, -8);//이번달 -8일
        start_date = df.format(cal.getTime());
        cal.add(Calendar.DATE, 15);//기준 날짜 + 8
		cal.add(Calendar.MONTH, 1);//다음달 1일
		end_date = df.format(cal.getTime());
		sitter_revChkVO.setStart_date(start_date);
        sitter_revChkVO.setEnd_date(end_date);
        List<Sitter_revChkVO> sitter_revChkVOList = service.getReservationList(sitter_revChkVO);
		for(Sitter_revChkVO temp : sitter_revChkVOList) {
			reservatedDayList.add(temp);
		}
		return reservatedDayList;
	}
	
	@RequestMapping("/sitter/scheduleView") //시터 스케쥴 보기
	public String sitterScheduleView(HttpSession session, SitterVOChk sitterVOChk, Model model) {
		//mbr_id
		MemberVO memberVO = (MemberVO) session.getAttribute("user");
		String mbr_id = memberVO.getMbr_id();
		sitterVOChk.setSit_mbr_id(mbr_id);
		
		//시터 정보
		model.addAttribute("sitterVOChk",service.getSitter(sitterVOChk));
		return "sitter/sitterScheduleView"; //jsp주소
	}
	
	@RequestMapping("/sitter/reservationView") //예약정보 보기
	public String reservationView(Model model, HttpSession session, Sitter_revChkVO sitter_revChkVO, ChildVO childVO) {
		//mbr_id
		MemberVO memberVO = (MemberVO) session.getAttribute("user");
		String mbr_id = memberVO.getMbr_id();
		sitter_revChkVO.setMbr_id(mbr_id);
		
		//아이정보
		childVO.setMbr_id(memberVO.getMbr_id());
		model.addAttribute("childVOList",service.getChildList(childVO));
		return "sitter/reservationView"; //jsp주소
	}
	
	@RequestMapping("/sitter/reservationPay") //결제완료로 바꾸기
	public String reservationPay(Sitter_revChkVO sitter_revChkVO) {
		service.updateReservationStatus(sitter_revChkVO);
		return "redirect:/sitter/reservationView"; //jsp주소
	}
	
	@RequestMapping("/sitter/reservationCancle") //예약 딜리트
	public String reservationCancle(Sitter_revChkVO sitter_revChkVO, @RequestParam("from") String from) {
		service.deleteReservation(sitter_revChkVO);
		if(from.equals("user")) {
			return "redirect:/sitter/reservationView"; //jsp주소
		} else {
			return "redirect:/sitter/scheduleView"; //jsp주소
		}
	}
	
	@RequestMapping("/sitter/insertReview") //리뷰인서트
	public String insertReview(Sitter_comVO sitter_comVO) {
		service.insertReview(sitter_comVO);
		return "redirect:/sitter/reservationView"; //jsp주소
	}
	
	@RequestMapping("/sitter/updateReview") //리뷰업데이트
	public String updateReview(Sitter_comVO sitter_comVO) {
		service.updateReview(sitter_comVO);
		return "redirect:/sitter/reservationView"; //jsp주소
	}
	
	@RequestMapping("/sitter/deleteReview") //리뷰딜리트
	public String deleteReview(Sitter_comVO sitter_comVO) {
		service.deleteReview(sitter_comVO);
		return "redirect:/sitter/reservationView"; //jsp주소
	}
	
	@RequestMapping("/ajax/getReview")//리뷰데이터 가져오기
	@ResponseBody
	public Sitter_comVO getReview(Sitter_comVO sitter_comVO) {
		sitter_comVO = service.getReview(sitter_comVO);
		return sitter_comVO; //jsp주소
	}
	
	@RequestMapping("/sitter/menu") //시터 사이드 메뉴
	public String sitterMenu() {
		return "layout/sitterMenu"; //jsp주소
	}
}
