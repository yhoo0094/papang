package co.company.papang.market.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.company.papang.impl.EsMapper;
import co.company.papang.vo.BagVO;
import co.company.papang.vo.ProductVO;
import co.company.papang.vo.Tran_infoVO;

@Service
public class MarketServiceImpl implements MarketService {
	@Autowired EsMapper dao;
	
	@Override
	public ProductVO getItem(ProductVO product) {
		return dao.getItem(product);
	}

	@Override
	public int insertItem(ProductVO product) {
		return dao.insertItem(product);
	}

	@Override
	public int insertCart(BagVO bag) {
		return dao.insertCart(bag);
	}

	@Override
	public List<BagVO> getCartList(String mbr_id) {
		return dao.getCartList(mbr_id);
	}

	@Override
	public int deleteCart(BagVO bag) {
		return dao.deleteCart(bag);
	}

	@Override
	public void orderInfo(Tran_infoVO tran) {
		dao.orderInfo(tran);
	}

}
