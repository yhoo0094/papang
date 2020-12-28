package co.company.papang.prevention.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import co.company.papang.prevention.service.VaccinationService;
import co.company.papang.vo.ChildVO;

@Controller
public class VaccinationController {
	@Autowired
	VaccinationService service; // 서비스

	@RequestMapping("vaccination/vaccinationList")
	public ModelAndView vaccinationList(HttpServletResponse response) throws IOException {
		return new ModelAndView("vaccination/vaccinationList");
	}

	@RequestMapping("vaccination/vaccNotice")
	public ModelAndView vaccinationNOtice(HttpServletResponse response) throws IOException {
		return new ModelAndView("vaccination/vaccination_notice");
	}

	@RequestMapping("vaccination/test")
	public ModelAndView test(HttpServletResponse response) throws IOException {
		return new ModelAndView("vaccination/test");
	}

	// 전체조회
	@ResponseBody
	@RequestMapping(value = "/child", method = RequestMethod.GET)
	public List<ChildVO> selectChild(Model model, ChildVO vo) {
		return service.selectChild(vo);
	}

}