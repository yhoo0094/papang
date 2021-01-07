package co.company.papang.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Pro_OdVO {
	private String pro_no; // 상품번호
	private String pro_name; // 상품명
	private String pro_price; // 가격
	private String pro_pic; // 메인사진
	private String bag_cnt;//수량
	private String order_no;
}