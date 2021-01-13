package co.company.papang.market.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.company.papang.impl.EsMapper;
import co.company.papang.vo.BagVO;
import co.company.papang.vo.Od_detailVO;
import co.company.papang.vo.ProductVO;
import co.company.papang.vo.Order_infoVO;

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
	public int updateItem(ProductVO product) {
		return dao.updateItem(product);
	}
	
	@Override
	public int deleteItem(ProductVO product) {
		return dao.deleteItem(product);
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

//	@Override
//	public void orderInfo(Order_infoVO order) {
//		dao.orderInfo(order);
//	}
//
//	@Override
//	public void deleteAllCart(String mbr_id) {
//		dao.deleteAllCart(mbr_id);
//	}
//
//	@Override
//	public void orderDetail(Od_detailVO detail) {
//		dao.orderDetail(detail);
//	}

	@Override
	public int countCart(String pro_no, String mbr_id) {
		return dao.countCart(pro_no, mbr_id);
	}

//	@Override
//	public void cntChange(BagVO bag) {
//		dao.cntChange(bag);
//	}

	@Override
	public void updateCart(BagVO bag) {
		dao.updateCart(bag);
	}

	@Override
	public void orderInsert(Order_infoVO order, Od_detailVO detail, String mbr_id) {
		dao.orderInfo(order);
		dao.orderDetail(detail);
		dao.deleteAllCart(mbr_id);
	}

	@Override
	public void minusWareCnt(String mbr_id) {
		dao.minusWareCnt(mbr_id);
	}

}
