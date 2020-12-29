package co.company.papang.market.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.company.papang.impl.EsMapper;
import co.company.papang.vo.ProductVO;

@Service
public class MarketServiceImpl implements MarketService {
	@Autowired EsMapper dao;
	
	@Override
	public ProductVO getItem(ProductVO product) {
		return dao.getItem(product);
	}

}
