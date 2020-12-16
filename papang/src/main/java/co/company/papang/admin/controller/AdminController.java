package co.company.papang.admin.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {

	@RequestMapping("/admin") //url 예전 .do
	public ModelAndView test(HttpServletResponse response) throws IOException{
		return new ModelAndView("admin/admin"); //jsp주소
	}
	
	@RequestMapping("/admin/nqInsert") //url 예전 .do
	public ModelAndView test2(HttpServletResponse response) throws IOException{
		return new ModelAndView("admin/nqInsert"); //jsp주소
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
	
	@RequestMapping("/admin/banner") //url 예전 .do
	public ModelAndView test6(HttpServletResponse response) throws IOException{
		return new ModelAndView("admin/banner"); //jsp주소
	}
	
	@RequestMapping("/admin/alarm") //url 예전 .do
	public ModelAndView test7(HttpServletResponse response) throws IOException{
		return new ModelAndView("admin/alarm"); //jsp주소
	}
	
	
	@RequestMapping("/admin/warehousing") //url 예전 .do
	public ModelAndView test8(HttpServletResponse response) throws IOException{
		return new ModelAndView("admin/warehousing"); //jsp주소
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
		return new ModelAndView("admin/sitterChart"); //jsp주소
	}
}
