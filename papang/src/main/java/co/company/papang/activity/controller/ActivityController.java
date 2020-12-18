package co.company.papang.activity.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ActivityController {

	@RequestMapping("/cookList") //url 예전 .do
	public ModelAndView test(HttpServletResponse response) throws IOException{
		return new ModelAndView("activity/cookList"); //jsp주소
	}
	
	@RequestMapping("/activityHAHA") //url 예전 .do
	public ModelAndView test1(HttpServletResponse response) throws IOException{
		return new ModelAndView("activity/test"); //jsp주소
	}
}
