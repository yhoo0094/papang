package co.company.papang.activity.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ActivityController {

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
	
	@RequestMapping("activity/playList") 
	public ModelAndView playList(HttpServletResponse response) throws IOException{
		return new ModelAndView("activity/playList"); 
	}
	
	@RequestMapping("activity/playForm") 
	public ModelAndView playForm(HttpServletResponse response) throws IOException{
		return new ModelAndView("activity/playForm"); 
	}
	
	@RequestMapping("activity/playView") 
	public ModelAndView playView(HttpServletResponse response) throws IOException{
		return new ModelAndView("activity/playView");
	}
	
	@RequestMapping("activity/playtest") 
	public ModelAndView playtest(HttpServletResponse response) throws IOException{
		return new ModelAndView("activity/test");
	}
	
	@RequestMapping("activity/vaccinationList") 
	public ModelAndView vaccinationList(HttpServletResponse response) throws IOException{
		return new ModelAndView("vaccination/vaccinationList");
	}
	
	
}
