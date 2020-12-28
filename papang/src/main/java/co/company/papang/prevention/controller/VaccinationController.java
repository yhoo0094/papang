package co.company.papang.prevention.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import co.company.papang.impl.SaMapper;
import co.company.papang.vo.PreventionVO;

@Controller
public class VaccinationController {
	@Autowired SaMapper dao;
	
	@RequestMapping("vaccination/vaccinationList") 
	public ModelAndView vaccinationList(HttpServletResponse response) throws IOException{
		return new ModelAndView("vaccination/vaccinationList");
	}
	
	@RequestMapping("vaccination/vaccNotice") 
	public ModelAndView vaccinationNOtice(HttpServletResponse response) throws IOException{
		return new ModelAndView("vaccination/vaccination_notice");
	}
	
	@RequestMapping("vaccination/test") 
	public ModelAndView test(HttpServletResponse response) throws IOException{
		return new ModelAndView("vaccination/test");
	}
}