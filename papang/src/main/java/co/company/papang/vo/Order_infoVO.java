package co.company.papang.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Order_infoVO {
	private String order_no;
	private String mbr_id;
	private String waybill;
	private String order_date;
	private String order_status;
	private String order_sum;
	private String addressee;
	private String post;
	private String addr1;
	private String addr2;
	private String addr3;
}
