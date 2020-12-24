package co.company.papang.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductVO {
	private String pro_no;
	private String pro_name;
	private String pro_price;
	private String pro_pic;
	private String pro_detail;
	private String pro_cnt;
	private String pro_cc;
	private String pro_cn;
}
