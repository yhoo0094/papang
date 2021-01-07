package co.company.papang.market.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.company.papang.impl.EsMapper;
import co.company.papang.vo.UsedVO;

@Service
public class UsedServiceImpl implements UsedService{
	@Autowired EsMapper dao;

	@Override
	public List<UsedVO> getUsedList(UsedVO used) {
		return dao.getUsedList(used);
	}
	@Override
	public List<UsedVO> onSaleUsedList(UsedVO used) {
		return dao.onSaleUsedList(used);
	}

	@Override
	public UsedVO getUsed(UsedVO used) {
		return dao.getUsed(used);
	}

	@Override
	public int insertUsed(UsedVO used) {
		return dao.insertUsed(used);
	}

	@Override
	public int hitPlus(UsedVO used) {
		return dao.hitPlus(used);
	}
}
