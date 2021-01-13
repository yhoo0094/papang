package co.company.papang.admin.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import co.company.papang.admin.service.AdminService;
import co.company.papang.vo.ProductVO;

@Controller
public class AdminController {
	
	
	@Autowired AdminService service;
	@RequestMapping("/admin") //url 예전 .do
	public ModelAndView test(HttpServletResponse response) throws IOException{
		return new ModelAndView("admin/admin"); //jsp주소
	}
	
	@RequestMapping("/admin/nqInsert") //url 예전 .do
	public ModelAndView test2(HttpServletResponse response) throws IOException{
		return new ModelAndView("admin/nqInsert"); //공지사항 리스트
	}
	
	
	@RequestMapping("/admin/sittermember") //url 예전 .do
	public ModelAndView test3(HttpServletResponse response) throws IOException{
		return new ModelAndView("admin/sittermember"); //jsp주소
	}
	
	@RequestMapping("/admin/sitterSchedule") //url 예전 .do
	public ModelAndView test4(HttpServletResponse response) throws IOException{
		return new ModelAndView("admin/sitterSchedule"); //jsp주소
	}
	
	@RequestMapping("/admin/lullaby") //url 예전 .do
	public ModelAndView test5(HttpServletResponse response) throws IOException{
		return new ModelAndView("admin/lullaby"); //jsp주소
	}
	
	@RequestMapping("/admin/lullabyInsert") //url 예전 .do
	public ModelAndView test5_1(HttpServletResponse response) throws IOException{
		return new ModelAndView("admin/lullabyInsert"); //jsp주소
	}
	
	@RequestMapping("/admin/banner") //url 예전 .do
	public ModelAndView test6(HttpServletResponse response) throws IOException{
		return new ModelAndView("admin/banner"); //jsp주소
	}
	
	@RequestMapping("/admin/bannerInsert") //url 예전 .do
	public ModelAndView test6_1(HttpServletResponse response) throws IOException{
		return new ModelAndView("admin/bannerInsert"); //jsp주소
	}
	
	@RequestMapping("/admin/alarm") //url 예전 .do
	public ModelAndView test7(HttpServletResponse response) throws IOException{
		return new ModelAndView("admin/alarm"); //jsp주소
	}
	
	
	@RequestMapping("/admin/warehousing") //url 예전 .do
	public ModelAndView test8(HttpServletResponse response,ProductVO vo) throws IOException{
		ModelAndView mav = new ModelAndView();
		System.out.println("=============");
		System.out.println(service.getprono(vo));
		mav.addObject("product", service.getprono(vo));
		mav.setViewName("admin/warehousing");
		return mav; //jsp주소
	}
	
	@RequestMapping("/admin/report") //url 예전 .do
	public ModelAndView test9(HttpServletResponse response) throws IOException{
		return new ModelAndView("admin/report"); //jsp주소
	}
	
	@RequestMapping("/admin/sitterChart") //url 예전 .do
	public ModelAndView test10(HttpServletResponse response) throws IOException{
		return new ModelAndView("admin/sitterChart"); //jsp주소
	}
	
	@RequestMapping("/admin/productChart") //url 예전 .do
	public ModelAndView test11(HttpServletResponse response) throws IOException{
		return new ModelAndView("admin/productChart"); //jsp주소
	}
	
	@RequestMapping("report") //url 예전 .do
	public ModelAndView test12(HttpServletResponse response) throws IOException{
		return new ModelAndView("report/report"); //공지사항 리스트
	}
}
