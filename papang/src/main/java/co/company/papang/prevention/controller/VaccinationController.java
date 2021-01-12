package co.company.papang.prevention.controller;

import java.io.IOException;
import java.util.Collections;
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
import co.company.papang.vo.PreventionVO;

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

	@ResponseBody // 아이 전체조회
	@RequestMapping(value = "/child", method = RequestMethod.GET)
	public List<ChildVO> selectChild(Model model, ChildVO child) {
		return service.selectChild(child);
	}

	@ResponseBody // 예방 접종 등록
	@RequestMapping(value = "/prevInsert", method = RequestMethod.POST)
	public int insertPrevent(Model model, ChildVO child, PreventionVO preventionVO) {
		System.out.println("============");
		System.out.println(preventionVO);
		return service.insertPrevent(preventionVO);
	}


  @ResponseBody //아이별 예방접종 전체 조회
  @RequestMapping(value = "/prevSelectList", method = RequestMethod.GET) 
  public List<PreventionVO> getPreventList(Model model, PreventionVO preventionVO) {
  return service.getPreventList(preventionVO);
  }
  
  @ResponseBody //아이별 예방접종 단건 조회
  @RequestMapping(value = "/prevSelect", method = RequestMethod.GET) 
  public PreventionVO getPrevent(Model model, PreventionVO preventionVO) {
  return service.getPrevent(preventionVO);
  }
  
  @ResponseBody //아이별 예방접종 업데이트
  @RequestMapping(value = "/prevUpdate", method = RequestMethod.POST) 
  public int updatePrevent(Model model, PreventionVO preventionVO) {
	  return  service.updatePrevent(preventionVO);
  }
  
  @ResponseBody //아이별 예방접종 업데이트
  @RequestMapping(value = "/getChild", method = RequestMethod.GET) 
  public ChildVO getChild(Model model, ChildVO childVO) {
	  return  service.getChild(childVO);
  }
  
	 

}