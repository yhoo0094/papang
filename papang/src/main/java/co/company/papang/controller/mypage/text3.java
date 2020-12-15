package co.company.papang.controller.mypage;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class text3{

	@RequestMapping("/test3") //url 예전 .do
	public ModelAndView test(HttpServletResponse response) throws IOException{
		return new ModelAndView("mypage/test3"); //jsp주소
	}
	
	
}
