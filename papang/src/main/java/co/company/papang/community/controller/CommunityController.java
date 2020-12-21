package co.company.papang.community.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CommunityController {

	@RequestMapping("/communityBoard") //url 예전 .do
	public ModelAndView communityBoard(HttpServletResponse response) throws IOException{
		return new ModelAndView("community/communityBoard"); //jsp주소
	}
	
	@RequestMapping("/communityForm") //url 예전 .do
	public ModelAndView communityForm(HttpServletResponse response) throws IOException{
		return new ModelAndView("community/communityForm"); //jsp주소
	}
	
	@RequestMapping("/sitterMenu") //url 예전 .do
	public ModelAndView sitterMenu(HttpServletResponse response) throws IOException{
		return new ModelAndView("layout/sitterMenu"); //jsp주소
	}
}
