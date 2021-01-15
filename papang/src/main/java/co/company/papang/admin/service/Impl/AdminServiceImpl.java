package co.company.papang.admin.service.Impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.company.papang.admin.service.AdminService;
import co.company.papang.impl.JyMapper;
import co.company.papang.vo.AlarmVO;
import co.company.papang.vo.BannerVO;
import co.company.papang.vo.MemberVO;
import co.company.papang.vo.NqVO;
import co.company.papang.vo.Order_infoVO;
import co.company.papang.vo.ProductVO;
import co.company.papang.vo.ReportVO;
import co.company.papang.vo.Report_info;
import co.company.papang.vo.SitterVO;
import co.company.papang.vo.Sitter_revVO3;
import co.company.papang.vo.WarehousingVO;
@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	JyMapper jyMapper;
	
	@Override
	public int insertNq(NqVO nqVO) {
		// TODO Auto-generated method stub
		return jyMapper.insertNq(nqVO);
	}

	@Override
	public List<NqVO> getListNq(NqVO nqVO) {
		// TODO Auto-generated method stub
		return jyMapper.getListNq(nqVO);
	}

	@Override
	public NqVO getNq(NqVO nqVO) {
		// TODO Auto-generated method stub
		return jyMapper.getNq(nqVO);
	}

	@Override
	public int updateNq(NqVO vo) {
		// TODO Auto-generated method stub
		return jyMapper.updateNq(vo);
	}

	@Override
	public int deleteNq(NqVO vo) {
		// TODO Auto-generated method stub
		return jyMapper.deleteNq(vo);
	}

	@Override
	public List<MemberVO> getListMember(MemberVO vo) {
		// TODO Auto-generated method stub
		return jyMapper.getListMember(vo);
	}

	@Override
	public int updateMember(MemberVO vo) {
		// TODO Auto-generated method stub
		return jyMapper.updateMember(vo);
	}

	@Override
	public int insertSitter(SitterVO vo) {
		// TODO Auto-generated method stub
		return jyMapper.insertSitter(vo);
	}

	@Override
	public int deleteSitter(SitterVO vo) {
		// TODO Auto-generated method stub
		return jyMapper.deleteSitter(vo);
	}

	@Override
	public SitterVO getSitter(SitterVO vo) {
		// TODO Auto-generated method stub
		return jyMapper.getSitter(vo);
	}

	@Override
	public int updateSitter(SitterVO vo) {
		// TODO Auto-generated method stub
		return jyMapper.updateSitter(vo);
	}

	@Override
	public int deleteMember(MemberVO vo) {
		// TODO Auto-generated method stub
		return jyMapper.deleteMember(vo);
	}

	@Override
	public int insertSitterAlarm(MemberVO vo) {
		// TODO Auto-generated method stub
		return jyMapper.insertSitterAlarm(vo);
	}

	@Override
	public int insertBanner(BannerVO vo) {
		// TODO Auto-generated method stub
		return jyMapper.insertBanner(vo);
	}

	@Override
	public List<BannerVO> getbannerlist(BannerVO vo) {
		// TODO Auto-generated method stub
		return jyMapper.getbannerlist(vo);
	}

	@Override
	public BannerVO getBanner(BannerVO vo) {
		// TODO Auto-generated method stub
		return jyMapper.getBanner(vo);
	}

	@Override
	public int updateBanner(BannerVO vo) {
		// TODO Auto-generated method stub
		return jyMapper.updateBanner(vo);
	}

	@Override
	public int deleteBanner(BannerVO vo) {
		// TODO Auto-generated method stub
		return jyMapper.deleteBanner(vo);
	}

	@Override
	public int updateBannerstatus(BannerVO vo) {
		// TODO Auto-generated method stub
		return jyMapper.updateBannerstatus(vo);
	}

	@Override
	public List<ProductVO> getprono(ProductVO vo) {
		// TODO Auto-generated method stub
		return jyMapper.getprono(vo);
	}

	@Override
	public int Wareinsert(WarehousingVO vo) {
		// TODO Auto-generated method stub
		return jyMapper.Wareinsert(vo);
	}

	@Override
	public List<Map<String, Object>> warehousinglist(WarehousingVO vo) {

		return jyMapper.warehousinglist(vo);
	}

	@Override
	public int updateprocnt(WarehousingVO vo) {
		// TODO Auto-generated method stub
		return jyMapper.updateprocnt(vo);
	}

	@Override
	public List<AlarmVO> getacount(AlarmVO vo) {
		// TODO Auto-generated method stub
		return jyMapper.getacount(vo);
	}

	@Override
	public int updateAstatus(AlarmVO vo) {
		// TODO Auto-generated method stub
		return jyMapper.updateAstatus(vo);
	}

	@Override
	public int insertReport(ReportVO vo) {
		// TODO Auto-generated method stub
		return jyMapper.insertReport(vo);
	}

	@Override
	public List<ReportVO> reportselect(ReportVO vo) {
		// TODO Auto-generated method stub
		return jyMapper.reportselect(vo);
	}

	@Override
	public List<Map<String, Object>> reportinfoselect(Report_info vo) {
		// TODO Auto-generated method stub
		return jyMapper.reportinfoselect(vo);
	}

	@Override
	public List<Map<String,Object>> reportselectone(ReportVO vo) {
		// TODO Auto-generated method stub
		return jyMapper.reportselectone(vo);
	}

	@Override
	public int reportinfoinsert(Report_info vo) {
		// TODO Auto-generated method stub
		return jyMapper.reportinfoinsert(vo);
	}

	@Override
	public int updatestatus(Report_info vo) {
		// TODO Auto-generated method stub
		return jyMapper.updatestatus(vo);
	}

	@Override
	public int updaterepoans(Report_info vo) {
		// TODO Auto-generated method stub
		return jyMapper.updaterepoans(vo);
	}

	@Override
	public int insertreportAlarm(Report_info vo) {
		// TODO Auto-generated method stub
		return jyMapper.insertreportAlarm(vo);
	}

	@Override
	public List<Order_infoVO> orderinfoselect(Order_infoVO vo) {
		// TODO Auto-generated method stub
		return jyMapper.orderinfoselect(vo);
	}

	@Override
	public List<Order_infoVO> orderinfoselect2(Order_infoVO vo) {
		// TODO Auto-generated method stub
		return jyMapper.orderinfoselect2(vo);
	}

	@Override
	public List<Map<String,Object>> sitterinfoselect(Sitter_revVO3 vo) {
		// TODO Auto-generated method stub
		return jyMapper.sitterinfoselect(vo);
	}

	@Override
	public List<Sitter_revVO3> sitterinfoselect2(Sitter_revVO3 vo) {
		// TODO Auto-generated method stub
		return jyMapper.sitterinfoselect2(vo);
	}

	@Override
	public List<Map<String, Object>> gendercount() {
		// TODO Auto-generated method stub
		return jyMapper.gendercount();
	}

	

	
}
