package co.company.papang.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class BagVO {
	private int bag_no; // 장바구니 번호
	private String mbr_id; // 장바구니 담는 회원의 아이디 = 세션아이디
	private String pro_no; // 상품번호
	private String bag_cnt; // 수량
	private String pro_name;
	private String pro_price;
	private String pro_pic;
	private String pro_cnt;
	
}
