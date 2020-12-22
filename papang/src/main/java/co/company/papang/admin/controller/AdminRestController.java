package co.company.papang.admin.controller;

import java.util.Collections;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import co.company.papang.impl.JyMapper;
import co.company.papang.vo.NqVO;



@RestController
public class AdminRestController {
	@Autowired
	JyMapper jyMapper;

	// 전체조회
	@RequestMapping(value = "/nq", method = RequestMethod.GET)
	public List<NqVO> getNqList(Model model, NqVO vo) {
		return jyMapper.getListNq(vo);
	}

	// 등록
	@RequestMapping(value = "/nq", method = RequestMethod.POST
	// ,produces="application/json"
	// ,consumes="application/json"
	// ,headers = {"Content-type=application/json" }
	)
	public Map insertNQ(@RequestBody NqVO vo, Model model, HttpServletResponse response) {
		jyMapper.insertNq(vo);

		return Collections.singletonMap("result", true);
	}
	
	//단건조회
		@RequestMapping(value="/nq/{nq_no}",  method=RequestMethod.GET)
		public NqVO getNq(@PathVariable String nq_no, NqVO vo, Model model) {
			vo.setNq_no(nq_no);
			return  jyMapper.getNq(vo);
		}
}
